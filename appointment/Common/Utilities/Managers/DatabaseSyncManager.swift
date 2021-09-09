//
//  DatabaseSyncManager.swift
//  appointment
//
//  Created by Raluca Mesterca on 10/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import RxSwift
import Moya

// sourcery: AutoMockable
protocol DatabaseSyncManagerProtocol {
	func syncDatabase() -> Single<Void>
	func syncUserProfile() -> Single<UserProfile>
}

class DatabaseSyncManager: DatabaseSyncManagerProtocol {
    
    // MARK: - DI
    private let connectivity: ConnectivityProtocol
    private let errorHandler: ErrorHandlerProtocol
    private let dateProvider: DateProviderProtocol
    private let dateFormatter: DateFormatterProtocol

    // Current user sync
    private let userProfileService: UserProfileServiceProtocol
    private let currentUserDataService: CurrentUserDataServiceProtocol

    // appointments sync
    private let appointmentsService: AppointmentServiceProtocol
    private let appointmentsDataService: AppointmentDataServiceProtocol

    // events sync
    private let eventsService: EventsServiceProtocol
    private let eventsDataService: EventsDataServiceProtocol

    private let disposeBag = DisposeBag()

    init(
        userProfileService: UserProfileServiceProtocol,
        currentUserDataService: CurrentUserDataServiceProtocol,
        appointmentsService: AppointmentServiceProtocol,
        appointmentsDataService: AppointmentDataServiceProtocol,
        eventsService: EventsServiceProtocol,
        eventsDataService: EventsDataServiceProtocol,
        connectivity: ConnectivityProtocol,
        dateProvider: DateProviderProtocol,
        dateFormatter: DateFormatterProtocol,

        errorHandler: ErrorHandlerProtocol
    ) {
        self.userProfileService = userProfileService
        self.currentUserDataService = currentUserDataService
        self.appointmentsService = appointmentsService
        self.appointmentsDataService = appointmentsDataService
        self.eventsService = eventsService
        self.eventsDataService = eventsDataService
        self.connectivity = connectivity
        self.dateFormatter = dateFormatter
        self.dateProvider = dateProvider
        self.errorHandler = errorHandler
    }

    func syncDatabase() -> Single<Void> {
        return Single<Void>.create { [weak self] single -> Disposable in
            guard let self = self else {
                    single(.error(DatabaseSyncError.generic))
                    return Disposables.create()
            }

            // skip the sync if it was already done today
            if let date = UserDefaults.standard.object(forKey: "databaseSyncDate") as? Date,
                self.dateProvider.isDateInToday(date) {
                single(.success(()))
                return Disposables.create()
            }

            self.connectivity.checkConnectivity { connectivity in
                switch connectivity.status {
                case .connected, .connectedViaWiFi, .connectedViaCellular:

                    Single
                        .zip(self.syncAppointments(), self.syncEvents())
                        .subscribe(
                        onSuccess: { _, _ in
                            UserDefaults.standard.set(Date(), forKey: "databaseSyncDate")
                            single(.success(()))
                        }, onError: { single(.error($0)) })
                        .disposed(by: self.disposeBag)
                case .connectedViaWiFiWithoutInternet, .connectedViaCellularWithoutInternet, .notConnected:
                    self.errorHandler.handle(NetworkError.noConnection)
                    single(.error(NetworkError.noConnection))
                case .determining:
                    break
                }
            }
            return Disposables.create()
        }
    }

    func checkConnectivity(_ completion: @escaping (Error?) -> Void) {
        connectivity.checkConnectivity { connectivity in
            switch connectivity.status {
            case .connected, .connectedViaWiFi, .connectedViaCellular:
                completion(nil)
            case .determining: break // ?? 
            default:
                completion(NetworkError.noConnection)
            }
        }
    }
}

// MARK: - Current user sync logic
extension DatabaseSyncManager {

    func syncUserProfile() -> Single<UserProfile> {
        return Single<UserProfile>.create { [weak self] single -> Disposable in
            guard let self = self else {
                single(.error(DatabaseSyncError.generic))
                return Disposables.create()
            }

            self.userProfileService.getProfile { result in
                switch result {
                case .success(let profile):
                    Console.log(type: .success, "User fetched succesfully from API! \(profile)")
                    self.save(user: profile).subscribe(
                        onSuccess: { _ in single(.success(profile)) },
                        onError: { error in single(.error(error)) })
                        .disposed(by: self.disposeBag)
                case .failure(let error):
                    self.deleteUserIfNeeded()
                    single(.error(error))
                }
            }

            return Disposables.create()
        }
    }

    func save(user: UserProfile) -> Single<Void> {
        return Single<Void>.create { [weak self] single -> Disposable in
            self?.currentUserDataService.save(currentUser: user) { result in
                switch result {
                case .success(let user):
                    Console.log(type: .success, "User saved succesfully to database! \(String(describing: user))")
                    single(.success(()))
                case .failure(let error):
                    single(.error(DatabaseSyncError.underlying(error)))
                }
            }

            return Disposables.create()
        }
    }

    // delete the previous saved user
    func deleteUserIfNeeded() {
        currentUserDataService.deleteUser()
    }
}

// MARK: - Appointment sync related logic
extension DatabaseSyncManager {

    func syncAppointments() -> Single<[Appointment]> {
        return Single<[Appointment]>.create { [weak self] single -> Disposable in
            guard let self = self else {
                single(.error(DatabaseSyncError.generic))
                return Disposables.create()
            }
            self.appointmentsService.getAppointments { result in
                switch result {
                case .success(let appointments):
                    Console.log(type: .success, "Appointments fetched succesfully from API! Count: \(appointments.count)")

                    self.debugPrintounts(for: appointments) // TODO: Remove later
                    let appointmentsFetchableByDate = self.upgradeAppointmentDates(appointments)

                    self.save(appointments: appointmentsFetchableByDate).subscribe(
                        onSuccess: { _ in single(.success(appointmentsFetchableByDate)) },
                        onError: { error in single(.error(error))})
                        .disposed(by: self.disposeBag)

                case .failure(let error):
                    self.resetAppointments()
                    single(.error(error))
                }
            }
            return Disposables.create()
        }
    }

    func save(appointments: [Appointment]) -> Single<Void> {
        return Single<Void>.create { [weak self] single -> Disposable in
            self?.appointmentsDataService.sync(appointments: appointments) { result in
                switch result {
                case .success(let data):
                    Console.log(type: .success, "Appointments saved succesfully to database! Count: \(data.count)")
                    single(.success(()))
                case .failure(let error):
                    single(.error(DatabaseSyncError.underlying(error)))
                }
            }
            return Disposables.create()
        }
    }

    func resetAppointments() {
        appointmentsDataService.deleteAppointment(with: nil)
    }
}

// MARK: - Event sync related logic
extension DatabaseSyncManager {

    func syncEvents() -> Single<[AppEvent]> {
        return Single<[AppEvent]>.create { [weak self] single -> Disposable in
            guard let self = self else {
                single(.error(DatabaseSyncError.generic))
                return Disposables.create()
            }
            self.eventsService.getEvents { result in
                switch result {
                case .success(let events):
                    Console.log(type: .success, "Events fetched succesfully from API ! Count: \(events.count)")
                    self.save(events: events).subscribe(
                        onSuccess: { _ in single(.success((events))) },
                        onError: { single(.error($0)) })
                    .disposed(by: self.disposeBag)
                case .failure(let error):
                    self.resetEventsIfNeeded()
                    single(.error(error))
                }
            }
            return Disposables.create()
        }
    }

    func save(events: [AppEvent]) -> Single<Void> {
        return Single<Void>.create { [weak self] single -> Disposable in
            self?.eventsDataService.sync(events: events) { result in
                switch result {
                case .success(let data):
                    Console.log(type: .success, "Events saved succesfully to database! \(data.count)")
                    single(.success(()))
                case .failure(let error):
                    single(.error(DatabaseSyncError.underlying(error)))
                }
            }
            return Disposables.create()
        }
    }

    func resetEventsIfNeeded() {
        eventsDataService.resetEvents()
    }
}

// MARK: - Privates
extension DatabaseSyncManager {
    // TODO: Remove later
    func debugPrintounts(for appointments: [Appointment]) {
        let appointmentIds: [Int] = appointments.compactMap { $0.id }
        print("👾👾👾", appointmentIds)
        
        let appointmentsWithDates = appointments.filter { !($0.dates?.isEmpty ?? true) }
        print("👾👾👾 IDs of appointments with dates: ", appointmentsWithDates.compactMap { $0.id })
        
        var appointmentsDates: [AppointmentDate] = []
        
        appointmentsWithDates.forEach { a in
            guard let dates = a.dates else { return }
            let datesWithTime = dates
                .filter { $0.startTime != nil }
                .filter { $0.startTime! > 0 }
            datesWithTime.forEach { date in
                appointmentsDates.append(date)
            }
        }
        
        let cleanDates = appointmentsDates.map {
            return AppointmentDate(
                id: $0.id, appointmentId: $0.appointmentId, appointmentTitle: $0.appointmentTitle, date: $0.date, appointmentLocation: nil, startTime: $0.startTime, endTime: $0.endTime, isFinal: nil, responseCount: nil, hasUsers: nil)
        }
    }
    
    func upgradeAppointmentDates(_  appointments: [Appointment]) -> [Appointment] {
        return appointments.map {
            return Appointment(
                id: $0.id,
                title: $0.title,
                description: $0.description,
                lastUpdate: $0.lastUpdate,
                created: $0.created,
                creatorId: $0.creatorId,
                creatorName: $0.creatorName,
                type: $0.type,
                category: $0.category,
                longitude: $0.longitude,
                latitude: $0.latitude,
                address: $0.address,
                dates: fetchableByDate($0.dates),
                participants: $0.participants,
                toDoList: $0.toDoList,
                attachments: $0.attachments,
                availabilityAllowed: $0.availabilityAllowed,
                dateProposalAllowed: $0.dateProposalAllowed,
                status: $0.status,
                origin: $0.origin,
                appointmentNotifyAt: $0.appointmentNotifyAt,
                appointmentIsClosed: $0.appointmentIsClosed,
                chatIDS: $0.chatIDS
            )
        }
    }
    
    func fetchableByDate(_ dateEntries: [AppointmentDate?]?) -> [AppointmentDate] {
        guard let dateEntries = dateEntries else { return [] }
        
        return dateEntries.compactMap {
            return AppointmentDate(
                id: $0?.id,
                appointmentId: $0?.appointmentId,
                appointmentTitle: $0?.appointmentTitle,
                date: dateFormatter.int64(
                    from: dateProvider.startOfDay(
                        from: $0?.startTime ?? 0
                )),
                appointmentLocation: $0?.appointmentLocation,
                startTime: $0?.startTime,
                endTime: $0?.endTime,
                isFinal: $0?.isFinal,
                responseCount: $0?.responseCount,
                hasUsers: $0?.hasUsers
            )
        }
    }
}

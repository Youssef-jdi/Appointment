//
//  AppointmentDataService.swift
//  appointment
//
//  Created by Raluca Mesterca on 01/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

//sourcery: AutoMockable
protocol AppointmentDataServiceProtocol {

    /// Deletes previously saved appointments
    /// and saves to database the provided list of appointments.
    func sync(appointments: [Appointment], _ completion: @escaping ArrayLocalCompletion<[AppointmentEntity]>)

    /// Creates a single appointment from model.
    func create(appointment: Appointment, _ completion: @escaping RequestLocalCompletion<AppointmentEntity>)

    /// Fetches the appointment with the provided id.
    /// If there is no appointment id provided, it fetches all appointments saved in database.
    func fetchAppointments(appointmentId: Int?, _ completion: @escaping ArrayLocalCompletion<[AppointmentEntity?]>)

    /// Deletes the appointment with the provided id.
    /// If there is no appointment id provided, it deletes all appointments saved in database.
    func deleteAppointment(with id: Int?)

    /// Updates the current appointment status.
    func updateAppointment(appointmentId: Int, appointmentStatus: AppointmentStatus, _ completion: @escaping RequestLocalCompletion<Void>)
}

class AppointmentDataService: AppointmentDataServiceProtocol {

    // MARK: - Init
    private var coreDataController: CoreDataControllerProtocol

    init(coreDataController: CoreDataControllerProtocol) {
        self.coreDataController = coreDataController
    }

    // MARK: - Methods
    func sync(appointments: [Appointment], _ completion: @escaping ArrayLocalCompletion<[AppointmentEntity]>) {
        let name = AppointmentEntity.entityName
        coreDataController.delete(entityName: name, predicate: nil) // deletes previously saved appointments

        let context = coreDataController.backgroundContext

        context.performAndWait {
            var newAppointments: [AppointmentEntity] = []

            appointments.forEach { appointment in
                newAppointments.append(AppointmentEntity.createNewAppointment(
                    from: appointment,
                    for: context
                ))
            }

            coreDataController.saveIfNeeded(context) { result in
                switch result {
                case .success:
                    completion(.success(newAppointments))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    func create(appointment: Appointment, _ completion: @escaping RequestLocalCompletion<AppointmentEntity>) {
        let context = coreDataController.backgroundContext
        let newAppointment = AppointmentEntity.createNewAppointment(from: appointment, for: context)

        coreDataController.saveIfNeeded(context) { result in
            switch result {
            case .success:
                completion(.success(newAppointment))
//                try? coreDataController.viewContext.save()
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchAppointments(appointmentId: Int?, _ completion: @escaping ArrayLocalCompletion<[AppointmentEntity?]>) {

        let name = AppointmentEntity.entityName
        let context = coreDataController.viewContext
        var predicate: NSPredicate?
        if let appointmentId = appointmentId {
            predicate = NSPredicate(format: "id == %@", appointmentId as NSNumber)
        }

        coreDataController.fetch(entityName: name, predicate: predicate, context: context) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func deleteAppointment(with id: Int?) {
        let name = AppointmentEntity.entityName
        var predicate: NSPredicate?
        if let id = id {
            predicate = NSPredicate(format: "id == %@", id as NSNumber)
        }
        coreDataController.delete(entityName: name, predicate: predicate)
    }

    func updateAppointment(appointmentId: Int, appointmentStatus: AppointmentStatus, _ completion: @escaping RequestLocalCompletion<Void>) {
        let name = AppointmentEntity.entityName
        let context = coreDataController.backgroundContext
        let predicate = NSPredicate(format: "id == %@", appointmentId as NSNumber)

        /// Fetch the appointment
        coreDataController.fetch(entityName: name, predicate: predicate, context: context) {[weak self] result in
            switch result {
            case .success(let value):
                guard let appointment = value[0] as? AppointmentEntity else { return }
                /// update the status
                appointment.setValue(appointmentStatus.rawValue, forKey: "status")
                 /// Save the changes to database
                self?.coreDataController.saveIfNeeded(context) { result in
                    switch result {
                    case .success: completion(.success(appointment))
                    case .failure(let error): completion(.failure(error))
                    }
                }
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}

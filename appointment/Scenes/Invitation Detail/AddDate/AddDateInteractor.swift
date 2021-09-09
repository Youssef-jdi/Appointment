//
//  AddDateInteractor.swift
//  appointment
//
//  Created by Tran Gia Huy on 04/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol AddDateInteractorProtocol {
    func handleSetInvitation(_ invitation: Appointment)

    func handleViewDidLoad()
    
    func handleSelectStartDate(date: Date)
    func handleSelectEndDate(date: Date)
    
    func handleSuggestDayTapped()
}

class AddDateInteractor: AddDateInteractorProtocol {
    
    // MARK: - Properties
    private var invitation: Appointment?
    private var startDate: Date?
    private var endDate: Date?

    // MARK: - DI
    private let presenter: AddDatePresenterProtocol
    private let dateProvider: DateProviderProtocol
    private let appointmentDateApiService: AppointmentDateApiServiceProtocol
    private let errorHandler: ErrorHandlerProtocol
    private let calendar: CalendarProtocol
    private let alertPresenter: AlertPresenterProtocol
    private let invitationDetailStoryboard: Storyboard
    
    init(
        presenter: AddDatePresenterProtocol,
        dateProvider: DateProviderProtocol,
        calendar: CalendarProtocol,
        appointmentDateApiService: AppointmentDateApiServiceProtocol,
        errorHandler: ErrorHandlerProtocol,
        alertPresenter: AlertPresenterProtocol,
        invitationDetailStoryboard: Storyboard
    ) {
        self.presenter = presenter
        self.dateProvider = dateProvider
        self.calendar = calendar
        self.appointmentDateApiService = appointmentDateApiService
        self.errorHandler = errorHandler
        self.alertPresenter = alertPresenter
        self.invitationDetailStoryboard = invitationDetailStoryboard
    }

    // MARK: - Protocol Methods
    func handleSetInvitation(_ invitation: Appointment) {
        self.invitation = invitation
    }
    
    func handleViewDidLoad() {
        guard
            let calendarViewController = invitationDetailStoryboard.viewController(
            identifier: InvitationDetailStoryboardId.dayCalendar
            ) as? DayCalendarViewController,
            let invitation = invitation else { return }
        
        let today = dateProvider.today()
        
        calendarViewController.set(title: invitation.title, date: today)
        presenter.presentCalendar(calendarViewController)
    }
    
    func handleSelectStartDate(date: Date) {
        startDate = date
        presenter.presentSelectStartDate(date)
        presenter.presentCalendar(for: date)
        
        guard endDate != nil else { return }
        endDate = relative(endDate: endDate!, basedOn: date)
        alertIfEndPrecedesStart(start: date, end: endDate!)
    }

    func handleSelectEndDate(date: Date) {
        presenter.presentSelectEndDate(date)
        
        guard let startDate = startDate else {
            endDate = date
            return
        }
        endDate = relative(endDate: date, basedOn: startDate)
        alertIfEndPrecedesStart(start: startDate, end: endDate!)
    }
    
    func handleSuggestDayTapped() {
        guard let invitation = invitation, datesAreValid() else { return }
        appointmentDateApiService.addSuggestedDate(
            for: invitation.id,
            start: Int(startDate?.timeIntervalSince1970 ?? 0) * 1000,
            end: Int(endDate?.timeIntervalSince1970 ?? 0) * 1000) { [weak self] result in
                print("😈", result)
                switch result {
                case .success(let addedDateResponse):
                    guard !addedDateResponse.appointmentDates.isEmpty else { return }
                    self?.presenter.presentDateAdded(addedDateResponse.appointmentDates[0].mapToAppointmentDate())
                case .failure(let error):
                    self?.errorHandler.handle(error)
                }
            }
    }
}

// MARK: - Privates
private extension AddDateInteractor {
    
    /// Returns a boolean value that determines whether
    /// (1) both start and end dates selected and
    /// (2) start precedes end.
    /// Displays a proper alert if any of these two checkups fail.
    func datesAreValid() -> Bool {
        guard let startDate = startDate, let endDate = endDate else {
            alertPresenter.presentAlert(
                title: R.string.localizable.timeMissingTitle(),
                description: R.string.localizable.timeMissingDescription(),
                actions: [.init(title: "OK", style: .default, handler: nil)]
            )
            return false
        }
        
        guard startDate < endDate else {
            alertIfEndPrecedesStart(start: startDate, end: endDate)
            return false
        }
        
        return true
    }
    
    func alertIfEndPrecedesStart(start: Date, end: Date) {
        if start > end {
            alertPresenter.presentAlert(
                title: R.string.localizable.timeConflictTitle(),
                description: R.string.localizable.timeConflictDescription(),
                actions: [.init(title: "OK", style: .default, handler: nil)]
            )
        }
    }
    
    /// Returns the end date that is relative to the start
    func relative(endDate: Date, basedOn startDate: Date) -> Date {
        let endHour = calendar.component(.hour, from: endDate)
        let endMinute = calendar.component(.minute, from: endDate)
        return dateProvider.date(
            bySettingHour: endHour,
            minute: endMinute,
            of: startDate
        )
    }
}

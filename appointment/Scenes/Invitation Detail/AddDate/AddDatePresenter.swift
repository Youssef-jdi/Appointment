//
//  AddDatePresenter.swift
//  appointment
//
//  Created by Tran Gia Huy on 04/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol AddDatePresenterProtocol {
    func set(viewController: AddDateViewControllerProtocol)
    
    func presentCalendar(_ calendarViewController: DayCalendarViewController)
    func presentCalendar(for date: Date)

    func presentSelectStartDate(_ date: Date)
    func presentSelectEndDate(_ date: Date)
    
    func presentDateAdded(_ date: AppointmentDate)
}

class AddDatePresenter: AddDatePresenterProtocol {
    // MARK: - Properties
    /// Specifies the maximum number of events with overlapping times that
    /// can be displayed simultaneously.
    private let maxItemsDisplayablePerHour = 3

    // MARK: - DI
    private weak var viewController: AddDateViewControllerProtocol?
    private let dateProvider: DateProviderProtocol
    private let dateFormatter: DateFormatterProtocol
    private let calendarBlocksModelProvider: CalendarBlocksModelProviderProtocol

    init(
        dateFormatter: DateFormatterProtocol,
        dateProvider: DateProviderProtocol,
        calendarBlocksModelProvider: CalendarBlocksModelProviderProtocol
    ) {
        self.dateFormatter = dateFormatter
        self.dateProvider = dateProvider
        self.calendarBlocksModelProvider = calendarBlocksModelProvider
    }
    
    // MARK: - Presentation Logic
    func presentCalendar(_ calendarViewController: DayCalendarViewController) {
        viewController?.displayCalendar(calendarViewController)
    }
    
    func presentCalendar(for date: Date) {
        viewController?.displayCalendar(for: date)
    }

    func presentSelectStartDate(_ date: Date) {
        let dateString = dateFormatter.formatDate(date: date, format: "dd MMMM yyyy   HH:mm")
        viewController?.displayStartDate(dateString)
    }

    func presentSelectEndDate(_ date: Date) {
        let timeString = dateFormatter.formatDate(date: date, format: "HH:mm")
        viewController?.displayEndTime(timeString)
    }

    func set(viewController: AddDateViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func presentDateAdded(_ date: AppointmentDate) {
        viewController?.displayDateAdded(date)
    }
}

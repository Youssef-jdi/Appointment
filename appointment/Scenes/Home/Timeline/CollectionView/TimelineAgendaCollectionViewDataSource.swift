//
//  TimelineAgendaCollectionViewDataSource.swift
//  appointment
//
//  Created by Raluca Mesterca on 20/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import UIKit

// TO DO: cleanup; make date object
// TO DO: custom label and lines to display end of time unit (week/year)
// TO DO: floating buttons - click actions
// TO DO: select year dropdown

class TimelineAgendaCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    private var appointments: [Appointment] = []
    private var isMonthAgenda: Bool = true
    private var status: Bool = true
    private var dayCount: Int?
    private var rows: Int?
    private var year: Int?

    func set(appointments: [Appointment]) {
        self.appointments = appointments
    }

    func set(isMonthAgenda: Bool) {
        self.isMonthAgenda = isMonthAgenda
    }

    /// status on timeline determines if all appointments are shown or just final ones
    /// status - false, show all appointments
    /// status true - only final ones with type: STANDARD, BUSINESS or GROUP
    func set(status: Bool) {
        self.status = status
    }

    func set(year: Int) {
        self.year = year
    }

    func handleViewDidLoad() {
        guard self.year != nil else { assertionFailure(); return }
        rows = isMonthAgenda ? 12 : Date().weeksArray.last ?? 52
        dayCount = isMonthAgenda ? 31 : 7
    }
}

// MARK: UICollectionViewDataSource
extension TimelineAgendaCollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard var rows = rows else { assertionFailure(); return 0 }
        rows = isMonthAgenda ? 12 : Date().weeksArray.last ?? 52
        return rows
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard var dayCount = dayCount else { assertionFailure(); return 0 }
        dayCount = isMonthAgenda ? 31 : 7
        return dayCount + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            return getWeekMonthCell(for: indexPath, and: collectionView)
        default:
            return getTimelineDayCell(for: indexPath, and: collectionView)
        }
    }
}

// MARK: Private Helpers
private extension TimelineAgendaCollectionViewDataSource {

    func getWeekMonthCell(
        for indexPath: IndexPath,
        and collectionView: UICollectionView
    ) -> WeekMonthCollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: R.reuseIdentifier.weekMonthCollectionViewCell.identifier,
            for: indexPath) as? WeekMonthCollectionViewCell else {
                assertionFailure()
                return WeekMonthCollectionViewCell()
        }

        let title = isMonthAgenda
            ? Date().shortMonthSymbols[indexPath.section]
            : String(Date().weeksArray[indexPath.section])

        cell.configure(with: title)
        return cell
    }

    func getTimelineDayCell(
        for indexPath: IndexPath,
        and collectionView: UICollectionView
    ) -> TimelineDayCollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: R.reuseIdentifier.timelineDayCollectionViewCell.identifier,
            for: indexPath) as? TimelineDayCollectionViewCell else {
                assertionFailure()
                return TimelineDayCollectionViewCell()
        }

        guard let year = year else { assertionFailure(); return cell }

        let date = isMonthAgenda
            ? getDateForMonth(at: indexPath, year: year)
            : getDateForWeek(index: indexPath)

        let appointments = getAppointmentsForDay(at: indexPath)

        cell.configure(date: date, with: appointments)
        return cell
    }

    func getAppointmentsForDay(at indexPath: IndexPath) -> [Appointment] {
        guard let year = year else { assertionFailure(); return [] }
        guard let date = isMonthAgenda
            ? getDateForMonth(at: indexPath, year: year)
            : getDateForWeek(index: indexPath)
            else { return [] }

        let sameYearAppointments = appointments.filter {
            if let dates = $0.dates, dates.count > 0, let date = dates[0].startDate {
               return date.year == self.year
            }

            return false
        }

        let filteredAppointments = sameYearAppointments.filter {
            let hasCorrectType = filter(appointmentCategory: $0.appointmentCategory)
            let hasSameDate = filter(appointmentDates: $0.dates ?? [], date: date)

            return hasCorrectType && hasSameDate
        }

        // gets list of appointments for date
        return filteredAppointments
    }

    func filter(appointmentCategory: AppointmentCategory) -> Bool {
        guard status else { return true } // status false - show all appointments

        // status - true, only show these categories
        guard appointmentCategory == .business
            || appointmentCategory == .standard
            || appointmentCategory == .group
            else { return false }

        return true
    }

    func filter(appointmentDates: [AppointmentDate], date: Date) -> Bool {
        guard appointmentDates.count == 1 else { return false }
        guard let savedDate = appointmentDates[0].startDate else { return false }

        let isFinal = appointmentDates[0].isFinal?.wrappedBool() ?? false
        let calendar = Calendar.calendarMonday

        guard
            savedDate.year == date.year,
            savedDate.month == date.month,
            savedDate.day == date.day
            else { return false }

        // if status is false, show all appointments that have the same date
        guard status else { return true }
        // if status is true, only final appointment are shown
        guard isFinal else { return false }

        return true
    }
}

// TO DO: move to separate date manager
// MARK: Calculate Date For Month Logic
private extension TimelineAgendaCollectionViewDataSource {

    // MARK: Month
    func getDateForMonth(at index: IndexPath, year: Int) -> Date? {
        let days = getAllDays(month: index.section + 1, year: year)
        guard index.row <= days.count else { return nil }
        let date = days[index.row - 1]

        guard date.month == index.section + 1 else { return nil }
        return date
    }

    /// Returns an array with all the days in a given month from a given year
    func getAllDays(month: Int, year: Int) -> [Date] {
        let dateComponents = DateComponents(year: year, month: month, day: 2)
        let calendar = Calendar.calendarMonday
        let date = calendar.date(from: dateComponents)!

        var day = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: date))!
        let range = calendar.range(of: .day, in: .month, for: date)!

        var days = [Date]()

        for _ in 1...range.count + 1 {
            days.append(day)
            day = calendar.date(byAdding: .day, value: 1, to: day)!
        }

        return days
    }

    // MARK: Week
    func getDateForWeek(index: IndexPath) -> Date? {
        guard let year = year else { assertionFailure(); return nil }
        var calendar = Calendar(identifier: .gregorian)
        calendar.firstWeekday = 2

        let offset = 1 - getFirstDayOffset(year, calendar)

        let resultComp = DateComponents(
            year: year,
            day: (index.row) + (index.section * 7),
            hour: 0,
            minute: 0,
            second: 1
        )

        let date = calendar.date(from: resultComp)?.addingComponent(value: offset, for: .day)

        guard self.year == date?.year else { return nil }

        return date
    }

    // MARK: Common
    func getFirstDayOffset(_ year: Int, _ calendar: Calendar) -> Int {
        let firstDayComp = DateComponents(
            year: year,
            day: 0,
            hour: 0,
            minute: 0,
            second: 1
        )
        let firstDay = calendar.date(from: firstDayComp)!

        return calendar.dateComponents([.weekday], from: firstDay).weekday!
    }
}

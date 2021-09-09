//
//  SideMenuDataSource.swift
//  appointment
//
//  Created by Raluca Mesterca on 25/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol SideMenuDataSourceProtocol: UITableViewDataSource {
    func setDataSource()
    func updateEventsNotificationsCount(events: [AppEvent])
    func updateAppointmentNotificationsCount(appointmentData: [Appointment])
    func resetSubItemsData()
}

class SideMenuDataSource: NSObject, SideMenuDataSourceProtocol {

    // MARK: DI
    var dataSource: [SideMenuCellModel] = []
    var sideMenuCellData: [SideMenuCellModel] = []

    func setDataSource() {
        if sideMenuCellData.isEmpty { setInitialSideMenuItemsData() }
        self.dataSource = sideMenuCellData
    }

    func resetSubItemsData() {
        updateEventsNotificationsCount(events: [])
        updateAppointmentNotificationsCount(appointmentData: [])
    }

    func updateEventsNotificationsCount(events: [AppEvent]) {
        sideMenuCellData[0].notificationText = "(\(events.count))"
        sideMenuCellData[5].notificationText = getMessagesText(events)
    }

    func updateAppointmentNotificationsCount(appointmentData: [Appointment]) {
        // TO DO: update messages count

        // Minutes of meetings notification count
        sideMenuCellData[6].notificationText = getTypeText(appointmentData, type: .mom)

        // Standard Appointments count
        sideMenuCellData[8].notificationText = getCategoryText(appointmentData, category: .standard)

        // Business Appointments count
        sideMenuCellData[9].notificationText = getCategoryText(appointmentData, category: .business)

        // Group Appointments count
        sideMenuCellData[10].notificationText = getCategoryText(appointmentData, category: .group)

        // POST-IT count
        sideMenuCellData[12].notificationText = getTypeText(appointmentData, type: .memo)

        // POST-IT TO count
        sideMenuCellData[13].notificationText = getTypeText(appointmentData, type: .memoTo)

        // Linked to Facebook count
        sideMenuCellData[15].notificationText = getOriginText(appointmentData, origin: .facebook)

        // Linked to Google count
        sideMenuCellData[16].notificationText = getOriginText(appointmentData, origin: .google)

        // Linked to Outlook count
        sideMenuCellData[17].notificationText = getOriginText(appointmentData, origin: .outlook)

        // Linked to Yahoo count
        sideMenuCellData[18].notificationText = getOriginText(appointmentData, origin: .yahoo)

        // Linked to Contacts count
        sideMenuCellData[19].notificationText = getOriginText(appointmentData, origin: .contacts)
    }
}

// MARK: Private helpers
private extension SideMenuDataSource {

    func getMessagesText(_ events: [AppEvent]) -> String {
        let data = events.filter { $0.eventType == .newChat }
        return "(\(data.count))"
    }

    func getTypeText(_ appointmentData: [Appointment], type: AppointmentType) -> String {
        let data = appointmentData.filter { $0.appointmentType == type }
        return "(\(data.count))"
    }

    func getCategoryText(_ appointmentData: [Appointment], category: AppointmentCategory) -> String {
        let data = appointmentData.filter { $0.appointmentCategory == category }
        return "(\(data.count))"
    }

    func getOriginText(_ appointmentData: [Appointment], origin: AppointmentOrigin) -> String {
        let data = appointmentData.filter { $0.appointmentOrigin == origin }
        return "(\(data.count))"
    }
}

// MARK: UITableViewDataSource
extension SideMenuDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: R.reuseIdentifier.sideMenuTableViewCell.identifier,
            for: indexPath) as? SideMenuTableViewCell else {
            assertionFailure()
            return UITableViewCell()
        }

        cell.configureCell(model: dataSource[indexPath.row], at: indexPath.row)
        return cell
      }
}

// NOTE:
// the values are hardcoded
// if you change the order, make sure you match it in the update notification text logic too
// to display correct subitems

// MARK: Hardcoded SideMenu Cells
extension SideMenuDataSource {

    // swiftlint:disable:next function_body_length
    func setInitialSideMenuItemsData() {
        sideMenuCellData = [
            // 1 - GEBEURTENISSEN - Events
            SideMenuCellModel(
                type: .primary,
                descriptionText: R.string.localizable.events().uppercased(),
                image: R.image.menu_Events()!),

            // 2 - APPOINTMENT STATUS - Invitations
            SideMenuCellModel(
                type: .primary,
                descriptionText: R.string.localizable.invitations().uppercased(),
                image: R.image.menu_Invitations()!),

            // 3 - AGENDA
            SideMenuCellModel(
                type: .primary,
                descriptionText: R.string.localizable.agenda().uppercased(),
                image: R.image.menu_Calendar()!,
                notificationText: "(\(Date().year))"),

            // 4 - FEESTDAGEN - Holidays
            SideMenuCellModel(
                type: .primary,
                descriptionText: R.string.localizable.holidays().uppercased(),
                image: R.image.menu_Holidays()!),

            // 5 - VERGADERINGEN - Meetings
            SideMenuCellModel(
                type: .primary,
                descriptionText: R.string.localizable.meetings().uppercased(),
                image: R.image.menu_Meeting()!),

            // 6 - BERICHTEN - Messages
            SideMenuCellModel(
                type: .secondary,
                descriptionText: R.string.localizable.messages().uppercased(),
                image: R.image.menu_Messages()!),

            // 7 - MINUTES OF MEETINGS - M.O.M.
            SideMenuCellModel(
                type: .secondary,
                descriptionText: R.string.localizable.minOfMeeting().uppercased(),
                image: R.image.menu_MOM_Blue()!),

            // 8 - AFSPRAKEN - Appointments
            SideMenuCellModel(
                type: .primary,
                descriptionText: R.string.localizable.appointments().uppercased(),
                image: R.image.menu_Appointments()!),

            // 9 - STANDAARD - Standart
            SideMenuCellModel(
                type: .secondary,
                descriptionText: R.string.localizable.standart().uppercased(),
                image: R.image.menu_Standard()!),

            // 10 - ZAKELIJK - Business
            SideMenuCellModel(
                type: .secondary,
                descriptionText: R.string.localizable.forBusiness().uppercased(),
                image: R.image.menu_Business()!),

            // 11 - GROEP - Group
            SideMenuCellModel(
                type: .secondary,
                descriptionText: R.string.localizable.group().uppercased(),
                image: R.image.menu_Group()!),

            // 12 - HERINNERINGEN - MEMOS
            SideMenuCellModel(
                type: .primary,
                descriptionText: R.string.localizable.reminders().uppercased(),
                image: R.image.menu_Reminder()!),

            // 13 - POST IT - Memo
            SideMenuCellModel(
                type: .secondary,
                descriptionText: R.string.localizable.memo().uppercased(),
                image: R.image.menu_Memo()!),

            // 14 - POST IT NAAR - Memo to
            SideMenuCellModel(
                type: .secondary,
                descriptionText: R.string.localizable.memoTo().uppercased(),
                image: R.image.menu_MemoTo()!),

            // 15 - GELINKT MET - Linked with
            SideMenuCellModel(
                type: .primary,
                descriptionText: R.string.localizable.linkedWith().uppercased(),
                image: R.image.menu_Linked()!),

            // 16 - FACEBOOK
            SideMenuCellModel(
                type: .secondary,
                descriptionText: R.string.localizable.facebook().uppercased(),
                image: R.image.menu_Linked_Facebook()!),

            // 17 - GOOGLE
            SideMenuCellModel(
                type: .secondary,
                descriptionText: R.string.localizable.google().uppercased(),
                image: R.image.menu_Linked_Google()!),

            // 18 - OUTLOOK
            SideMenuCellModel(
                type: .secondary,
                descriptionText: R.string.localizable.outlook().uppercased(),
                image: R.image.menu_Linked_Outlook()!),

            // 19 - YAHOO
            SideMenuCellModel(
                type: .secondary,
                descriptionText: R.string.localizable.yahoo().uppercased(),
                image: R.image.menu_Linked_Yahoo()!),

            // 20 - CONTACTS iOS
            SideMenuCellModel(
                type: .secondary,
                descriptionText: R.string.localizable.contacts().uppercased(),
                image: R.image.menu_Contacts()!),

            // 21 - INSTELLINGEN - Settings
            SideMenuCellModel(
                type: .primary,
                descriptionText: R.string.localizable.settings().uppercased()),

            // 22 - UPGRADES
            SideMenuCellModel(
                type: .primary,
                descriptionText: R.string.localizable.upgrades().uppercased()),

            // 23 - OVER APP!POINTMENT - About
            SideMenuCellModel(
                type: .primary,
                descriptionText: R.string.localizable.aboutAppointment().uppercased())
        ]
    }
}

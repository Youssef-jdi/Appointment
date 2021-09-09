//
//  InvitationDetailDataSource.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/11/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol InvitationDetailDataSourceProtocol: UITableViewDataSource {
    func data() -> [AppointmentDate]

    func set(dates: [AppointmentDate])
    func set(invitation: Appointment)
    func set(isOutGoing: Bool)
}

class InvitationDetailDataSource: NSObject, InvitationDetailDataSourceProtocol {

    // MARK: - Properties
    private var dates: [AppointmentDate] = []
    private var invitation: Appointment?
    private var isOutGoing: Bool = true

    // MARK: - DI
    private let dateViewModelProvider: AppointmentViewModelProviderProtocol
    
    init(viewModelProvider: AppointmentViewModelProviderProtocol) {
        self.dateViewModelProvider = viewModelProvider
    }
    
    // MARK: - Protocol Methods
    func set(dates: [AppointmentDate]) {
        self.dates = dates.sorted { ($0.startTime ?? 0) < ($1.startTime ?? 0) }
    }

    func set(invitation: Appointment) {
        self.invitation = invitation
    }

    func set(isOutGoing: Bool) {
        self.isOutGoing = isOutGoing
    }
    
    func data() -> [AppointmentDate] {
        return self.dates
    }
}

// MARK: - UITableViewDataSource
extension InvitationDetailDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return invitation?.finalDate == nil ? dates.count : 1
        case 2: return invitationSetupData.count
        default: return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let dateCell = tableView.dequeueReusableCell(withIdentifier: R.nib.invitationProposedDateCell.identifier) as? InvitationProposedDateCell,
            let setupCell = tableView.dequeueReusableCell(withIdentifier: R.nib.invitationSetupCell.identifier) as? InvitationSetupCell,
            let titleCell = tableView.dequeueReusableCell(withIdentifier: R.nib.invitationDetailDateTitleView.identifier, for: indexPath) as? InvitationDetailDateTitleView
            else { return UITableViewCell() }

        switch indexPath.section {
        case 0:
            guard let invitation = invitation else { return UITableViewCell() }
            titleCell.configure(for: invitation.finalDate == nil ?  .suggested : .finalized)
            return titleCell
        case 1:
            guard let finalDate = invitation?.finalDate else {
                return prepareDateCell(dateCell, for: indexPath)
            }
            let viewModel = dateViewModelProvider.dateViewModel(from: finalDate)
            dateCell.configureForGroup(from: viewModel)
            return dateCell
        case 2:
            setupCell.configureCell(invitationSetupData[indexPath.row])
            return setupCell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - Private Helpers
private extension InvitationDetailDataSource {

    var invitationSetupData: [InvitationSetupCellModel] {
        switch invitation?.appointmentCategory {
        case .business, .standard:
            return dataForBusinessAndStandard()
        case .group:
            return dataForGroup()
        default:
            return dataForGroup()
        }
    }

    func getToDoListDetails() -> String {
        guard let invitation = invitation, let toDoList = invitation.toDoList else { return "" }
        let done = toDoList.filter { $0.done == true }
        return "\(done.count)/\(toDoList.count)"
    }

    func getNumberOfAttachments() -> String {
        guard let invitation = invitation, let attachments = invitation.attachments else { return "" }
        return "\(attachments.count) " + R.string.localizable.attachments(attachments.count)
    }

    func prepareDateCell(_ dateCell: InvitationProposedDateCell, for indexPath: IndexPath) -> InvitationProposedDateCell {
        // TODO: Leaving this in-place just in case we do have different views based on the category after the redesign.
//        switch invitation?.appointmentCategory {
//        case .business, .standard:
//            dateCell.configureForStandardOrBusiness(date: dates[indexPath.row])
//
//        case .group:
//            dateCell.configureForGroup(date: dates[indexPath.row])
//
//        default:
//            break
//        }
        let viewModel = dateViewModelProvider.dateViewModel(from: dates[indexPath.row])
        dateCell.configureForGroup(from: viewModel)
        return dateCell
    }

    /// Still missing group chats
    func dataForGroup() -> [InvitationSetupCellModel] {
        return  isOutGoing
            ? [
                InvitationSetupCellModel(
                    typeImage: R.image.to_do_list(),
                    title: R.string.localizable.todoList(),
                    details: getToDoListDetails()
                ),
                InvitationSetupCellModel(
                    typeImage: R.image.appointment_Attachment_Blue(),
                    title: R.string.localizable.attachments((invitation?.attachments?.count) ?? 0),
                    details: getNumberOfAttachments()
                ),
                InvitationSetupCellModel(
                    typeImage: R.image.invıtationItems.new_chat(),
                    title: R.string.localizable.openNewChat(),
                    details: "")
                ]
            : [
                InvitationSetupCellModel(
                    typeImage: R.image.to_do_list(),
                    title: R.string.localizable.todoList(),
                    details: getToDoListDetails()
                ),
                InvitationSetupCellModel(
                    typeImage: R.image.appointment_Attachment_Blue(),
                    title: R.string.localizable.attachments((invitation?.attachments?.count) ?? 0),
                    details: getNumberOfAttachments()
                )
        ]
    }

    func dataForBusinessAndStandard() -> [InvitationSetupCellModel] {
        return [
            InvitationSetupCellModel(
                typeImage: R.image.to_do_list(),
                title: R.string.localizable.todoList(),
                details: getToDoListDetails()
            ),
            InvitationSetupCellModel(
                typeImage: R.image.invıtationItems.icn_bijlagen(),
                title: R.string.localizable.attachments((invitation?.attachments?.count) ?? 0),
                details: getNumberOfAttachments()
            ),
            InvitationSetupCellModel(
                typeImage: R.image.invıtationItems.icn_private_chat(),
                title: R.string.localizable.privateConversation(),
                details: ""
            ),
            InvitationSetupCellModel(
                typeImage: R.image.invıtationItems.new_chat(),
                title: R.string.localizable.openNewChat(),
                details: ""
            )
        ]
    }
}

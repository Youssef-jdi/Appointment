//
//  NewInvitationDetailDataSource.swift
//  appointment
//
//  Created by Irina Filkovskaya on 02.07.2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol NewInvitationDetailDataSourceProtocol: UITableViewDataSource {
    func data() -> [AppointmentDate]

    func set(dates: [AppointmentDate])
    func set(invitation: Appointment?)
}

class NewInvitationDetailDataSource: NSObject, NewInvitationDetailDataSourceProtocol {
    
    // MARK: - Properties
    private var dates: [AppointmentDate] = []
    private var invitation: Appointment?
    
    // MARK: - DI
    private let dateViewModelProvider: AppointmentViewModelProviderProtocol
    
    init(viewModelProvider: AppointmentViewModelProviderProtocol) {
        self.dateViewModelProvider = viewModelProvider
    }
    
    // MARK: - Protocol Methods
    func set(dates: [AppointmentDate]) {
        self.dates = dates.sorted { ($0.startTime ?? 0) < ($1.startTime ?? 0) }
    }

    func set(invitation: Appointment?) {
        self.invitation = invitation
    }
    
    func data() -> [AppointmentDate] {
        return self.dates
    }
}

// MARK: - UITableViewDataSource
extension NewInvitationDetailDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dateCell = tableView.dequeueReusableCell(
            withIdentifier: R.nib.invitationProposedDateCell.identifier
        ) as? InvitationProposedDateCell else { return UITableViewCell() }

        let viewModel = dateViewModelProvider.dateViewModel(from: dates[indexPath.row])
        dateCell.configureForGroup(from: viewModel)
        return dateCell
    }
}

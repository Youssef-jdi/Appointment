//
//  InvitationDataSource.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/25/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol InvitationDataSourceProtocol: UITableViewDataSource {
    func set(data: [Appointment])

    var data: [Appointment] { get }
}

class InvitationDataSource: NSObject, InvitationDataSourceProtocol {
    
    var data: [Appointment] = []

    // MARK: DI
    func set(data: [Appointment]) {
        self.data = data
    }
}

extension InvitationDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: R.reuseIdentifier.invitationCell.identifier,
            for: indexPath) as? InvitationCell else {
                assertionFailure()
                return UITableViewCell()
        }
        cell.configureCell(invitation: data[indexPath.row])
        
        return cell
    }
}

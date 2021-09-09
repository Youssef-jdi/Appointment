//
//  AvailabilityOverviewDatasource.swift
//  appointment
//
//  Created by Tran Gia Huy on 28/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

// swiftlint:disable superfluous_disable_command
import UIKit

class AvailabilityOverviewDatasource: NSObject, UITableViewDataSource {

    var date: AppointmentDate?
    var attendees: [AppointmentDateHasUser] = []
    var unknowns: [AppointmentDateHasUser] = []
    var unavailable: [AppointmentDateHasUser] = []
    var unsure: [AppointmentDateHasUser] = []
    var avaiable: [AppointmentDateHasUser] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return avaiable.count
        case 1:
            return unsure.count
        case 2:
            return unavailable.count
        default:
            return unknowns.count
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AvailablityOverviewCell") as? AvailablityOverviewCell else {
            return UITableViewCell()
        }

        switch indexPath.section {
        case 0:
            cell.seperatorView.isHidden = indexPath.row == (avaiable.count - 1)
            cell.setUp(attendee: avaiable[indexPath.row])
        case 1:
            cell.seperatorView.isHidden = indexPath.row == (unsure.count - 1)
            cell.setUp(attendee: unsure[indexPath.row])
        case 2:
            cell.seperatorView.isHidden = indexPath.row == (unavailable.count - 1)
            cell.setUp(attendee: unavailable[indexPath.row])
        default:
            cell.seperatorView.isHidden = indexPath.row == (unknowns.count - 1)
            cell.setUp(attendee: unknowns[indexPath.row])
        }
        return cell
    }

    func set(date: AppointmentDate) {
        self.date = date
        self.attendees = date.hasUsers ?? []
        separatedStatus()
    }

    private func separatedStatus() {
        _ = attendees.map { result in
            switch result.availability {
            case "available":
                avaiable.append(result)
            case "un-available":
                unavailable.append(result)
            case "unsure":
                unsure.append(result)
            default:
                unknowns.append(result)
            }
        }
    }
}

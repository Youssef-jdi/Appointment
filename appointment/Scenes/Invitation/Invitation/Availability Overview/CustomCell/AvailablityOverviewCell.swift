//
//  AvailablityOverviewCell.swift
//  appointment
//
//  Created by Tran Gia Huy on 28/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit
import Nuke

class AvailablityOverviewCell: UITableViewCell {
    // MARK: Outlet
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var seperatorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // To do: 2020-04-29, Sam, Ask Rick to confirm the API for image and timestamp
    func setUp(attendee: AppointmentDateHasUser) {
        nameLabel.text = attendee.userName
        messageLabel.text = attendee.comment
        timestampLabel.text = "\(attendee.repliedOn)"
        if let url = URL(string: attendee.imageURL ?? "") {
            Nuke.loadImage(with: url, into: profileImageView)
        }
    }
}

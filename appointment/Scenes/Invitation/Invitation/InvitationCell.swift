//
//  InvitationCell.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/25/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class InvitationCell: UITableViewCell {
    
    @IBOutlet private weak var typeImage: UIImageView!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    func configureCell(invitation: Appointment) {
        typeImage.image = invitation.appointmentCategory.image
        typeLabel.text = invitation.title
        statusLabel.text = invitation.status
		dateLabel.text = "\(R.string.localizable.lastAccessed()): \(invitation.formattedDate ?? "")"
    }
}

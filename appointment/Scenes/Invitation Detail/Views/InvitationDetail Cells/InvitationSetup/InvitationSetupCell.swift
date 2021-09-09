//
//  InvitationSetup.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/6/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class InvitationSetupCell: UITableViewCell {

    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(_ invitationSetup: InvitationSetupCellModel) {
        typeImageView.image = invitationSetup.typeImage
        titleLabel.text = invitationSetup.title
        detailLabel.text = invitationSetup.details
    }
}

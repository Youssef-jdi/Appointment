//
//  TitleView.swift
//  appointment
//
//  Created by Tran Gia Huy on 12/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class InvitationDetailDateTitleView: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(for status: AppointmentDateStatus) {
        self.titleLabel.text = status.title
    }
}

enum AppointmentDateStatus {
    case suggested
    case finalized
    
    var title: String {
        switch self {
        case .suggested:
            return R.string.localizable.dates()
        case .finalized:
            return R.string.localizable.selectedDate()
        }
    }
}

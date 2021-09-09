//
//  InvitationSelectDateHeaderView.swift
//  appointment
//
//  Created by Tran Gia Huy on 11/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class InvitationSelectDateHeaderView: UICollectionReusableView {

    // MARK: - Outlet
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static let identifier: String = {
        return String(describing: InvitationSelectDateHeaderView.self)
    }()

    func setUp(text: String) {
        self.titleLabel.text = text
    }
}

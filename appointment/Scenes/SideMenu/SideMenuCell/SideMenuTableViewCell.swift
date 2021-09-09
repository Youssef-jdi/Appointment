//
//  SideMenuTableViewCell.swift
//  appointment
//
//  Created by Raluca Mesterca on 21/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

// i.e. linked with - primary, google/yahoo,etc. - secondary
enum SideMenuCellType {
    case primary
    case secondary
}

class SideMenuTableViewCell: UITableViewCell {

    // MARK: Outlets

    @IBOutlet weak var imageViewContainer: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var notificationCountLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var leadingStackViewConstraint: NSLayoutConstraint!

    func configureCell(model: SideMenuCellModel, at index: Int) {
        descriptionLabel.text = model.descriptionText
        notificationCountLabel.text = model.notificationText

        descriptionLabel.font = model.type == .primary
            ?         R.font.openSansSemibold(size: 14)  : R.font.openSansLight(size: 14)

        leadingStackViewConstraint.constant = model.type == .primary ? 10 : 40
        separatorView.isHidden = model.type == .secondary || index == 0

        guard let image = model.image else { imageViewContainer.isHidden = true; return }
        iconImageView.image = image
    }
}

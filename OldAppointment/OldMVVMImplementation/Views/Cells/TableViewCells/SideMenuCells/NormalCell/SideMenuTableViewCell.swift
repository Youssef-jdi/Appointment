//
//  SideMenuTableViewCell.swift
//  appointment
//
//  Created by Onur Hüseyin Çantay on 2.03.2019.
//  Copyright © 2019 DTT. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    override var reuseIdentifier: String? { return "SideMenuTableViewCell" }
    
    @IBOutlet private weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet private weak var subTextLabel: UILabel! {
        didSet {
            subTextLabel.font = R.font.robotoRegular(size: 14)
            subTextLabel.textColor = R.color.appDimGray()!
        }
    }
    @IBOutlet private weak var notificationCountLabel: UILabel! {
        didSet {
            notificationCountLabel.font = R.font.robotoRegular(size: 14)
            notificationCountLabel.textColor = R.color.appGray()!
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func prepareCell(image: UIImage, subText: String, notificationCount: String?, font: UIFont? = nil ) {
        iconImageView.image = image
        subTextLabel.text = subText
        separatorInset.left = 0
        if notificationCount == nil {
            notificationCountLabel.isHidden = true
        }
        subTextLabel.font = font ?? R.font.robotoRegular(size: 14)
        notificationCountLabel.text = notificationCount
    }
}

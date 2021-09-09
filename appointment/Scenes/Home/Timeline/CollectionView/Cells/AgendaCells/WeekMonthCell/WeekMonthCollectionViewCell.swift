//
//  WeekMonthCollectionViewCell.swift
//  appointment
//
//  Created by Raluca Mesterca on 19/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

// used both for weekly and monthly calendar to set week no./month name
class WeekMonthCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var weekMonthLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with title: String) {
        weekMonthLabel.text = title
        separatorView.makeDashedBorderLine()
    }
}

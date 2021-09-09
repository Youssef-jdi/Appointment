//
//  TimelineHeaderCollectionViewCell.swift
//  appointment
//
//  Created by Raluca Mesterca on 09/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class TimelineHeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(for index: Int, isMonthAgenda: Bool) {
        isMonthAgenda
            ? configureForMonth(for: index)
            : configureForWeek(for: index)
    }
}

// MARK: Private Helpers
private extension TimelineHeaderCollectionViewCell {

    func configureForWeek(for index: Int) {
        var shortDays = Date().shortWeekdaySymbols
        shortDays.append(shortDays[0])
        shortDays.remove(at: 0)

        self.titleLabel.text = index == 0 ? "WEEK" : shortDays[index - 1]
    }

    func configureForMonth(for index: Int) {
        self.titleLabel.text = index == 0 ? "MONTH" : String(index)
        self.titleLabel.textColor = index == 0
            ? R.color.appGrayChateau()! : R.color.appGrayMagnesium()!
    }
}

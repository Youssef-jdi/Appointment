//
//  DateCell.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/6/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class InvitationProposedDateCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var availabilityLabel: UILabel!
    @IBOutlet weak var percentageSlider: UISlider! {
        didSet {
            percentageSlider.setThumbImage(UIImage(), for: .normal)
            percentageSlider.setThumbImage(UIImage(), for: .highlighted)
        }
    }
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var sliderStackView: UIStackView!
    @IBOutlet weak var availabilityStackView: UIStackView!
    @IBOutlet weak var unsureLabel: UILabel!
    @IBOutlet weak var canceledLabel: UILabel!
    @IBOutlet weak var unrespondedLabel: UILabel!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureForGroup(from model: AppointmentDateViewModel) {
        dateLabel.text = model.date
        timeLabel.text = model.start + "-" + model.end
        guard model.respondedTo else {
            configureForStandardOrBusiness(from: model)
            return
        }
        confirmedLabel.text = model.available
        unsureLabel.text = model.unsure
        canceledLabel.text = model.unavailable
        unrespondedLabel.text = model.unsure
        availabilityLabel.text = model.percentage != 0
            ? "\(model.percentage)% " + R.string.localizable.isAvailable(model.availableInt)
            : R.string.localizable.isAvailable(model.availableInt)

        percentageSlider.setValue(model.percentage, animated: true)
    }

    func configureForStandardOrBusiness(from model: AppointmentDateViewModel) {
        sliderStackView.isHidden = true
        availabilityStackView.isHidden = true
        dateLabel.text = model.date
        timeLabel.text = model.start + "-" + model.end
    }
}

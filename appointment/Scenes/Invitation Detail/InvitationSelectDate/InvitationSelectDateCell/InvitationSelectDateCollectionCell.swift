//
//  InvitationSelectDateCollectionCell.swift
//  appointment
//
//  Created by Tran Gia Huy on 11/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class InvitationSelectDateCollectionCell: UICollectionViewCell {

    @IBOutlet weak var sliderView: UISlider! {
        didSet {
            sliderView.setThumbImage(UIImage(), for: .normal)
            sliderView.setThumbImage(UIImage(), for: .highlighted)
        }
    }
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var unsureLabel: UILabel!
    @IBOutlet weak var canceledLabel: UILabel!
    @IBOutlet weak var unrespondedLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var selectedDateImage: UIImageView! {
        didSet {
            selectedDateImage.isHidden = true
        }
    }
    private var viewModelProvider: AppointmentViewModelProviderProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    static let identifier: String = {
        return String(describing: InvitationSelectDateCollectionCell.self)
    }()

    func setUp(with date: AppointmentDateViewModel, selected: Bool) {
        dateLabel.text = date.date
        timeLabel.text = date.start + "-" + date.end
        confirmedLabel.text = "\(date.available)"
        unsureLabel.text = "\(date.unsure)"
        canceledLabel.text = "\(date.unavailable)"
        unrespondedLabel.text = "\(date.unsure)"
        percentageLabel.text = date.percentage != 0
            ? "\(date.percentage)% " + R.string.localizable.isAvailable(date.availableInt)
            : R.string.localizable.isAvailable(date.availableInt)

        sliderView.setValue(Float(date.percentage), animated: true)
        selectedDateImage.isHidden = !selected
    }
}

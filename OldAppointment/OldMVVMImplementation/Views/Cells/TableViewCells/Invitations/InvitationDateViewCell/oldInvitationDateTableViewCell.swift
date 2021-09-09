////
////  InvitationDateTableViewCell.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 18.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class InvitationDateTableViewCell: UITableViewCell {
//    
//    @IBOutlet private weak var dateLabel: UILabel!
//    @IBOutlet private weak var timeLabel: UILabel!
//    @IBOutlet private var totalCountsLabel: [UILabel]! {
//        didSet {
//            totalCountsLabel.forEach {
//                $0.textColor = R.color.appGray()
//            }
//        }
//    }
//    @IBOutlet private weak var availabilityLabel: UILabel!
//    @IBOutlet private weak var iconImage: UIImageView! {
//        didSet {
//             iconImage.tintColor = ThemeService.shared.theme.firstColor
//        }
//    }
//    @IBOutlet private weak var roundedView: UIView! {
//        didSet {
//            roundedView.layer.cornerRadius = roundedView.frame.width / 2
//            roundedView.clipsToBounds = true
//            roundedView.backgroundColor = ThemeService.shared.theme.firstColor
//        }
//    }
//    
//    @IBOutlet private weak var progressView: UIProgressView! {
//        didSet {
//            progressView.tintColor = ThemeService.shared.theme.firstColor
//        }
//    }
//    @IBOutlet private var statusImages: [UIImageView]! {
//        didSet {
//            statusImages.forEach {
//                $0.tintColor = ThemeService.shared.theme.firstColor
//            }
//        }
//    }
//    
//    @IBOutlet private weak var roundedViewLeadingConstraint: NSLayoutConstraint!
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        selectionStyle = .none
//    }
//    
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
//    // swiftlint:disable function_parameter_count
//    func prepareCell(dateString: String, timeString: String, confirmed: String, unsure: String, cancelled: String, notResponded: String, availableProcent: Float) {
//        dateLabel.text = dateString.firstCapitalized
//        timeLabel.text = timeString
//        totalCountsLabel[0].text = confirmed
//        totalCountsLabel[1].text = unsure
//        totalCountsLabel[2].text = cancelled
//        totalCountsLabel[3].text = notResponded
//        availabilityLabel.text = R.string.localizable.isAvailable.key.localizedWithCount(count: Int(availableProcent))
//        updateConstraintOfRoundedView(with: availableProcent)
//    }
//    
//    func updateConstraintOfRoundedView(with availableProcent: Float) {
//        progressView.setProgress(availableProcent, animated: true)
//        roundedViewLeadingConstraint.constant = CGFloat(availableProcent * Float(progressView.frame.width))
//        layoutIfNeeded()
//    }
//}
//
//extension InvitationDateTableViewCell: Themeable {
//    func applyTheme(theme: ProductModel) {
//        roundedView.backgroundColor = theme.firstColor
//        progressView.tintColor = theme.firstColor
//        statusImages.forEach { $0.tintColor = theme.firstColor }
//        iconImage.tintColor = theme.firstColor
//    }
//}

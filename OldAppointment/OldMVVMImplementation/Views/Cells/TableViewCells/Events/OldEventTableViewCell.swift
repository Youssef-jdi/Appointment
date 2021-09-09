////
////  EventTableViewCell.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class EventTableViewCell: UITableViewCell {
//
//    @IBOutlet private weak var dateLabel: UILabel! {
//        didSet {
//            dateLabel.textColor = .lightGray
//        }
//    }
//
//    @IBOutlet private weak var stateLabel: UILabel!
//    @IBOutlet private weak var descriptionLabel: UILabel! {
//        didSet {
//            descriptionLabel.font = R.font.openSans(size: 16)!
//        }
//    }
//    @IBOutlet private weak var actionTypeImageView: UIImageView!
//    @IBOutlet private weak var arrowImageView: UIImageView!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        ThemeService.shared.addThemeable(themable: self)
//    }
//
//    func prepareCell(description: NSMutableAttributedString, interactionTypeImage: UIImage, dateString: String, isRead: Bool) {
//        descriptionLabel.attributedText = description
//        actionTypeImageView.image = interactionTypeImage
//        dateLabel.text = dateString
//        readStatusHandler(isRead: isRead)
//    }
//
//    private func readStatusHandler(isRead: Bool) {
//        if isRead {
//            stateLabel.text = R.string.localizable.isRead.key.localized.uppercased()
//            stateLabel.textColor = ThemeService.shared.theme.firstColor!
//        } else {
//            stateLabel.text = R.string.localizable.unRead.key.localized.uppercased()
//            stateLabel.textColor = ThemeService.shared.theme.highlightColor!
//        }
//    }
//}
//
//extension EventTableViewCell: Themeable {
//    func applyTheme(theme: ProductModel) {
//        arrowImageView.tintColor = theme.firstColor
//        actionTypeImageView.tintColor = theme.firstColor
//    }
//}

////
////  InvitationGeneralTableViewCell.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 18.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//enum InvitationGeneralCellType {
//    case giveAvailability
//    case todoList
//    case proposedDate
//    case attachment
//    case chat(Conversation)
//    case newChat
//}
//
//class InvitationGeneralTableViewCell: UITableViewCell {
//    override var reuseIdentifier: String { return "InvitationGeneralTableViewCell" }
//    
//    @IBOutlet private weak var iconImageView: UIImageView! {
//        didSet {
//            iconImageView.contentMode = .scaleAspectFit
//        }
//    }
//    @IBOutlet private weak var rightArrowView: UIImageView!
//    @IBOutlet private weak var descriptionLabel: UILabel! {
//        didSet {
//            descriptionLabel.font = R.font.openSans(size: 12)
//            descriptionLabel.textColor = R.color.appDimGray()
//        }
//    }
//    
//    @IBOutlet private weak var titleLabel: UILabel! {
//        didSet {
//            titleLabel.font = R.font.openSans(size: 14)
//            titleLabel.textColor = R.color.appGray()
//        }
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    
//    func prepareCell(image: UIImage, title: String, desc: String?) {
//        iconImageView.image = image
//        titleLabel.text = title
//        descriptionLabel.text = desc
//        selectionStyle = .none
//    }
//}
//
//extension InvitationGeneralTableViewCell: Themeable {
//    func applyTheme(theme: ProductModel) {
//        iconImageView.tintColor = theme.highlightColor
//        rightArrowView.tintColor = theme.highlightColor
//    }
//}

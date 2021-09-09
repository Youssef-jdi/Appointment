////
////  MeetingMessageView.swift
////  appointment
////
////  Created by Dylan Barteling on 29/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class MeetingMessageView: UIView {
//    
//    @IBOutlet private weak var topBarHeightConstraint: NSLayoutConstraint!
//    @IBOutlet private weak var stackViewTopConstraint: NSLayoutConstraint!
//    @IBOutlet private weak var stackViewBottomConstraint: NSLayoutConstraint!
//    @IBOutlet private weak var bottomConstaint: NSLayoutConstraint!
//    
//    @IBOutlet private weak var responseTopConstraint: NSLayoutConstraint!
//    @IBOutlet private weak var responseBubbleTopConstraint: NSLayoutConstraint!
//    @IBOutlet private weak var responseBubbleBottomConstraint: NSLayoutConstraint!
//    
//    @IBOutlet private weak var messageLabelLeftConstraint: NSLayoutConstraint!
//    @IBOutlet private weak var profileImageHeightConstraint: NSLayoutConstraint!
//    @IBOutlet private weak var contentViewWidthContraint: NSLayoutConstraint!
//    @IBOutlet private weak var bottomViewHeightConstraint: NSLayoutConstraint!
//    
//    @IBOutlet private weak var headerView: UIView!
//    @IBOutlet private weak var messageIdLabel: UILabel!
//    @IBOutlet private weak var senderLabel: UILabel!
//    
//    @IBOutlet private weak var responseView: UIView!
//    @IBOutlet private weak var roundedView: RoundedView! {
//        didSet {
//            roundedView.shadowOffsetY = 0
//            roundedView.shadowColor = .clear
//            roundedView.borderWidth = 1
//        }
//    }
//    @IBOutlet private weak var responseLabel: UILabel! {
//        didSet {
//            responseLabel.font = R.font.openSans(size: 13)!
//        }
//    }
//    
//    @IBOutlet private weak var profileImageView: UIImageView!
//    @IBOutlet private weak var messageLabel: UILabel! {
//        didSet {
//            messageLabel.font = R.font.openSans(size: 16)!
//        }
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        ThemeService.shared.addThemeable(themable: self)
//    }
//}
//
//extension MeetingMessageView: CellConfigurable {
//    
//    var contentViewWidthContraintMultiplier: CGFloat {
//        return contentViewWidthContraint.multiplier
//    }
//    
//    var minCellHeight: CGFloat {
//        var height: CGFloat = 0
//        height += topBarHeightConstraint.constant
//        height += bottomViewHeightConstraint.constant
//        height += stackViewTopConstraint.constant
//        height += stackViewBottomConstraint.constant
//        height += bottomConstaint.constant
//        return height
//    }
//    
//    var messageLabelHorizontalPadding: CGFloat {
//        return messageLabelLeftConstraint.constant
//            + profileImageHeightConstraint.constant
//    }
//    
//    var responseVerticalPadding: CGFloat {
//        return responseTopConstraint.constant
//            + responseBubbleTopConstraint.constant
//            + responseBubbleBottomConstraint.constant
//    }
//    
//    var profileImageHeightConstraintConstant: CGFloat {
//        return profileImageHeightConstraint.constant
//    }
//    
//    func configure(with message: UserMessage, emojis: [EmojiModel.Datum.Emoji], version: Int) {
//        messageIdLabel.text = message.messageId
//        
//        let dateformatter = DateFormatter()
//        dateformatter.dateStyle = .short
//        dateformatter.timeStyle = .short
//        let date = dateformatter.string(from: message.sentDate)
//        
//        senderLabel.text = "\(date), \(message.sender.data.givenName)"
//        
//        var attrMessage = message.content.replaceEmoji(with: R.font.openSans(size: 16)!, emojis: emojis, version: version)
//        if let response = message.response {
//            attrMessage = attrMessage.replaceFirstReply()
//            responseView.isHidden = false
//            responseLabel.attributedText = response.replaceEmoji(with: R.font.openSans(size: 13)!, emojis: emojis, version: version)
//        } else {
//            responseView.isHidden = true
//            responseLabel.text = String()
//        }
//        messageLabel.attributedText = attrMessage
//    }
//}
//
//extension MeetingMessageView: Themeable {
//    func applyTheme(theme: ProductModel) {
//        headerView.backgroundColor = theme.backgroundColor
//        roundedView.borderColor = theme.backgroundColor!
//    }
//}

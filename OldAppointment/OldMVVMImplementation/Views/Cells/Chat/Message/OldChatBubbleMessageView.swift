////
////  ChatMessageView.swift
////  appointment
////
////  Created by Dylan Barteling on 04/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class ChatBubbleMessageView: UIView {
//    
//    @IBOutlet private weak var stackViewTopConstraint: NSLayoutConstraint!
//    @IBOutlet private weak var stackViewBottomConstraint: NSLayoutConstraint!
//    
//    @IBOutlet private weak var senderLabelHeightConstraint: NSLayoutConstraint!
//    @IBOutlet private weak var dateTimeLabelHeightConstraint: NSLayoutConstraint!
//    
//    @IBOutlet private weak var messageLabelLeftConstraint: NSLayoutConstraint!
//    @IBOutlet private weak var messageLabelRightConstraint: NSLayoutConstraint!
//    
//    @IBOutlet private weak var dateTimeLabel: UILabel!
//    @IBOutlet private weak var senderLabel: UILabel!
//    
//    @IBOutlet private weak var messageStackView: UIStackView!
//    @IBOutlet private weak var responseBubbleView: BubbleView!
//    
//    @IBOutlet private weak var profileImageView: UIImageView!
//    @IBOutlet private weak var messageLabel: UILabel!
//}
//
//extension ChatBubbleMessageView: CellConfigurable {
//    
//    var contentViewWidthContraintMultiplier: CGFloat {
//        return 1
//    }
//    
//    var minCellHeight: CGFloat {
//        var height: CGFloat = 0
//        height += stackViewTopConstraint.constant
//        height += stackViewBottomConstraint.constant
//        let spacingCount = CGFloat(messageStackView.subviews.count - 1)
//        height += messageStackView.spacing * spacingCount
//        height += senderLabelHeightConstraint.constant
//        height += dateTimeLabelHeightConstraint.constant
//        return height
//    }
//    
//    var messageLabelHorizontalPadding: CGFloat {
//        return messageLabelLeftConstraint.constant
//            + messageLabelRightConstraint.constant
//    }
//    
//    var responseVerticalPadding: CGFloat {
//        return 0
//    }
//    
//    var profileImageHeightConstraintConstant: CGFloat {
//        return 0
//    }
//    
//    func configure(with message: UserMessage, emojis: [EmojiModel.Datum.Emoji], version: Int) {
//        let dateformatter = DateFormatter()
//        dateformatter.dateStyle = .short
//        dateformatter.timeStyle = .short
//        let date = dateformatter.string(from: message.sentDate)
//        
//        senderLabel.text = "\(message.sender.data.givenName) zegt:"
//        dateTimeLabel.text = date
//        
//        messageLabel.attributedText = message.content.replaceEmoji(with: R.font.openSans(size: 16)!, emojis: emojis, version: version)
//    }
//}

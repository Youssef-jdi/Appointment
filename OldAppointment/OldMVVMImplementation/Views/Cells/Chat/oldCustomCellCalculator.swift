////
////  CustomCellCalculator.swift
////  appointment
////
////  Created by Dylan Barteling on 08/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import MessageKit
//
//open class CustomMessageSizeCalculator: TextMessageSizeCalculator {
//    
//    var emojis: [EmojiModel.Datum.Emoji]!
//    var version: Int!
//    
//    private var chatMessageView: CellConfigurable!
//    
//    convenience init(layout: MessagesCollectionViewFlowLayout? = nil, chatType: ChatType) {
//        self.init(layout: layout)
//        if case .MOM = chatType {
//            chatMessageView = R.nib.meetingMessageView.firstView(owner: nil)!
//        } else {
//            chatMessageView = R.nib.chatBubbleMessageView.firstView(owner: nil)!
//        }
//    }
//    
//    override public init(layout: MessagesCollectionViewFlowLayout? = nil) {
//        super.init()
//        self.layout = layout
//    }
//    
//    override open func sizeForItem(at indexPath: IndexPath) -> CGSize {
//        guard let layout = layout,
//            let attr = layout.layoutAttributesForItem(at: indexPath) as? MessagesCollectionViewLayoutAttributes
//            else { return .zero }
//        
//        let collectionViewWidth = layout.collectionView?.bounds.width ?? 0
//        let contentInset = layout.collectionView?.contentInset ?? .zero
//        let inset = layout.sectionInset.left + layout.sectionInset.right + contentInset.left + contentInset.right
//        
//        if attr.messageContainerSize == .zero { // System message
//            return CGSize(width: collectionViewWidth - inset, height: 44)
//        }
//        
//        var minCellHeight: CGFloat = chatMessageView.minCellHeight
//        minCellHeight += attr.messageContainerSize.height
//        
//        return CGSize(width: collectionViewWidth - inset, height: minCellHeight)
//    }
//    
//    override open func messageContainerSize(for message: MessageType) -> CGSize {
//        guard let layout = layout as? MessagesCollectionViewFlowLayout else { return .zero }
//        var messageContainerSize: CGSize
//        let attributedText: NSAttributedString
//        var responseText: NSAttributedString?
//        
//        if case .custom(let messageKind) = message.kind,
//            let kind = messageKind {
//            if let message = kind as? UserMessage {
//                attributedText = message.content.replaceEmoji(with: R.font.openSans(size: 16)!, emojis: emojis, version: version)
//                if let response = message.response, chatMessageView is MeetingMessageView {
//                    responseText = response.replaceEmoji(with: R.font.openSans(size: 13)!, emojis: emojis, version: version)
//                }
//            } else if kind is SystemMessage {
//                return .zero
//            } else {
//                fatalError("Message kind shouldn't be possible: \(kind)")
//            }
//        } else {
//            fatalError("Message kind shouldn't be possible: \(message.kind)")
//        }
//        
//        let sectionInset = layout.sectionInset.left + layout.sectionInset.right
//        var labelWidth: CGFloat = layout.messagesCollectionView.frame.width - sectionInset
//        labelWidth *= chatMessageView.contentViewWidthContraintMultiplier
//        labelWidth -= chatMessageView.messageLabelHorizontalPadding
//        messageContainerSize = labelSize(for: attributedText, width: labelWidth)
//        
//        messageContainerSize.height = max(messageContainerSize.height, chatMessageView.profileImageHeightConstraintConstant)
//        if let responseText = responseText {
//            messageContainerSize.height += chatMessageView.responseVerticalPadding
//            messageContainerSize.height += labelSize(for: responseText, width: labelWidth).height
//        }
//        
//        return messageContainerSize
//    }
//    
//    /// Returns the calculated label size
//    ///
//    /// - Parameters:
//    ///   - attributedText: The text
//    ///   - width: The width of the label
//    /// - Returns: The calculated label size
//    private func labelSize(for attributedText: NSAttributedString, width: CGFloat) -> CGSize {
//        let constraintBox = CGSize(width: width, height: .greatestFiniteMagnitude)
//        let mutableString = NSMutableAttributedString(attributedString: attributedText)
//        let emojiText = mutableString.replaceEmoji(emojis: emojis, version: version)
//        let rect = emojiText.boundingRect(with: constraintBox, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).integral
//        return rect.size
//    }
//}

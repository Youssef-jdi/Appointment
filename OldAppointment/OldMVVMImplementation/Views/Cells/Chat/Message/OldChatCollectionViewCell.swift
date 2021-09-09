////
////  ChatCollectionViewCell.swift
////  appointment
////
////  Created by Dylan Barteling on 04/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import MessageKit
//
//protocol CellConfigurable: UIView {
//    var contentViewWidthContraintMultiplier: CGFloat { get }
//    var minCellHeight: CGFloat { get }
//    var messageLabelHorizontalPadding: CGFloat { get }
//    var responseVerticalPadding: CGFloat { get }
//    var profileImageHeightConstraintConstant: CGFloat { get }
//    
//    func configure(with message: UserMessage, emojis: [EmojiModel.Datum.Emoji], version: Int)
//}
//
//class ChatCollectionViewCell: MessageCollectionViewCell {
//    
//    private var customContentView: CellConfigurable!
//    
//    private func setupSubviews(with chatType: ChatType) {
//        if case .MOM = chatType {
//            customContentView = R.nib.meetingMessageView.firstView(owner: nil)!
//        } else {
//            customContentView = R.nib.chatBubbleMessageView.firstView(owner: nil)!
//        }
//        contentView.subviews.forEach { $0.removeFromSuperview() }
//        contentView.addSubview(customContentView)
//        
//        customContentView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            customContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            customContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            customContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            customContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//            ])
//        setupViewAppearance()
//    }
//    
//    private func setupViewAppearance() {
//        customContentView.clipsToBounds = true
//        customContentView.layer.cornerRadius = 4
//        
//        layer.backgroundColor = UIColor.clear.cgColor
//        layer.shadowColor = UIColor.darkGray.cgColor
//        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
//        layer.shadowOpacity = 0.5
//        layer.shadowRadius = 2.0
//    }
//    
//    func configure(with message: UserMessage, chatType: ChatType, emojis: [EmojiModel.Datum.Emoji], version: Int) {
//        setupSubviews(with: chatType)
//        customContentView.configure(with: message, emojis: emojis, version: version)
//    }
//}

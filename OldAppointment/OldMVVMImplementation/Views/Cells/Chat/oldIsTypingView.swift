////
////  IsTypingView.swift
////  appointment
////
////  Created by Dylan Barteling on 18/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import MessageKit
//import InputBarAccessoryView
////import MessageInputBar
//import UIKit
//
//class IsTypingView: UIView, InputItem {
//
//    var inputBarAccessoryView: InputBarAccessoryView?
//
//    func keyboardSwipeGestureAction(with gesture: UISwipeGestureRecognizer) {
//    }
//
//    @IBOutlet private weak var isTypingLabel: UILabel!
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        backgroundColor = R.color.appLightGray()
//    }
//    
//    var messageInputBar: MessageInputBar?
//    var parentStackViewPosition: InputStackView.Position?
//    
//    func textViewDidChangeAction(with textView: InputTextView) { }
//    func keyboardEditingEndsAction() { }
//    func keyboardEditingBeginsAction() { }
//    
//    func setTypers(_ typers: [String]) {
//        if typers.count >= 2 {
//            isTypingLabel.text = R.string.localizable.moreAreTyping(val: typers.count)
//        } else if let oneTyper = typers.first {
//            isTypingLabel.text = R.string.localizable.isTyping(oneTyper).capitalizingFirstLetter()
//        } else {
//            print("No typers but somehow isTyping?")
//        }
//    }
//}

////
////  KeyboardService
////  appointment
////
////  Created by Suhaib Al Saghir on 04/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class KeyboardService: NSObject {
//    static var serviceSingleton = KeyboardService()
//    
//    var measuredSize: CGRect = .zero
//
//    @objc class func keyboardHeight() -> CGFloat {
//        let keyboardSize = KeyboardService.keyboardSize()
//        return keyboardSize.size.height
//    }
//
//    @objc class func keyboardSize() -> CGRect {
//        return serviceSingleton.measuredSize
//    }
//
//    private func observeKeyboardNotifications() {
//        let center = NotificationCenter.default
//
//        center.addObserver(self, selector: #selector(self.keyboardChange), name: UIResponder.keyboardDidShowNotification, object: nil)
//    }
//
//    private func observeKeyboard() {
//        let field = UITextField()
//        UIApplication.shared.windows.first?.addSubview(field)
//        field.becomeFirstResponder()
//        field.resignFirstResponder()
//        field.removeFromSuperview()
//    }
//
//    @objc private func keyboardChange(_ notification: Notification) {
//        guard measuredSize == CGRect.zero, let info = notification.userInfo,
//            let value = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
//            else { return }
//
//        measuredSize = value.cgRectValue
//    }
//
//    override init() {
//        super.init()
//        observeKeyboardNotifications()
//        observeKeyboard()
//    }
//
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//}

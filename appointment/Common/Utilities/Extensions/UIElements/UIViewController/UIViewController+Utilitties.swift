//
//  UIViewController+SkipButton.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/15/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupTapToDismiss() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapToDismissKeyboard)))
    }

    @objc func tapToDismissKeyboard() {
        self.view.endEditing(true)
    }
}

//
//  UILabel+resetText.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

extension UILabel {

    func resetText() {
        self.text = ""
        self.attributedText = NSAttributedString(string: "")
    }
}

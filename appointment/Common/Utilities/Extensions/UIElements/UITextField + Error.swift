//
//  UITextField + Error.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/21/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

extension UITextField {
    
    func displayError() {
        UIView.animate(withDuration: 0.15) {
            self.shake()
            self.textColor = R.color.appLightRed()
        }
    }
}

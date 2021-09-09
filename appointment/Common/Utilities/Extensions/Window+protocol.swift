//
//  Window+protocol.swift
//  appointment
//
//  Created by Tran Gia Huy on 07/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

extension UIWindow {
    
    func disableDarkMode() {
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
        }
    }
}

//
//  UIAlertAction+trigger.swift
//  appointmentTests
//
//  Created by Raluca Mesterca on 02/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

import UIKit

typealias AlertHandler = @convention(block) (UIAlertAction) -> Void

// for alert presenters that have a completion handler
extension UIAlertAction {

    /// Simulates a tap on the receiver.
    func trigger() {
        guard let block = value(forKey: "handler") else { return }
        let handler = unsafeBitCast(block as AnyObject, to: AlertHandler.self)
        handler(self)
    }
}

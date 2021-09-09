//
//  UIViewController+ActivityIndicator.swift
//  appointment
//
//  Created by Rachel Polachova on 24/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static func showActivityIndicator() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return }
            let indicator = UIActivityIndicatorView(style: .whiteLarge)
            window.addSubview(indicator)
            window.bringSubviewToFront(indicator)
            indicator.center = window.center
            indicator.color = .gray
            indicator.startAnimating()
        }
    }
    
    static func removeActivityIndicator() {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return }
            for subView in window.subviews where subView is UIActivityIndicatorView {
                subView.removeFromSuperview()
            }
        }
    }
}

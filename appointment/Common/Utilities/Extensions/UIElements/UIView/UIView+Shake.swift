//
//  UIView+Shake.swift
//  appointment
//
//  Created by Onur Hüseyin Çantay on 27.02.2019.
//  Copyright © 2019 DTT. All rights reserved.
//

import UIKit

extension UIView {

    /// this function shakes the phone
    ///
    /// - Parameters:
    ///   - duration: duration of the shake
    ///   - translation: translation of the view
    func shake(
        for duration: TimeInterval = 0.5,
        withTranslation translation: CGFloat = 10
        ) {
        let propertyAnimator = UIViewPropertyAnimator(
            duration: duration,
            dampingRatio: 0.3
        ) {
            self.transform = CGAffineTransform(translationX: translation, y: 0)
        }

        propertyAnimator.addAnimations({
            self.transform = CGAffineTransform(translationX: 0, y: 0)
        }, delayFactor: 0.2)

        propertyAnimator.startAnimation()
    }
}

//
//  CALayer + extension.swift
//  appointment
//
//  Created by Tran Gia Huy on 17/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

extension CALayer {

    /// Applies a shadow to a layer.
    func applyShadow(offset: CGSize, radius: CGFloat, opacity: Float, color: UIColor) {
        masksToBounds = false
        shadowOffset = offset
        shadowRadius = radius
        shadowOpacity = opacity
        shadowColor = color.cgColor
    }
}

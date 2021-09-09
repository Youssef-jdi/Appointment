//
//  UIView+dashedLine.swift
//  appointment
//
//  Created by Raluca Mesterca on 20/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

extension UIView {

    private static let lineDashPattern: [NSNumber] = [6, 6]
    private static let lineDashWidth: CGFloat = 1.0

    func makeDashedBorderLine() {
        let path = CGMutablePath()
        let shapeLayer = CAShapeLayer()

        shapeLayer.lineWidth = UIView.lineDashWidth
        shapeLayer.lineDashPattern = UIView.lineDashPattern

        shapeLayer.strokeColor = R.color.appGrayMagnesium()!.cgColor
        self.backgroundColor = .clear

        path.addLines(between: [
            CGPoint(x: bounds.minX, y: bounds.height / 2),
            CGPoint(x: bounds.maxX, y: bounds.height / 2)
        ])

        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}

////
////  UIView+DashedLine.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 1.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//extension UIView {
//    
//    /// Draws a dashed line with a spesific Color
//    ///
//    /// - Parameter cgColor: Color wanted to be set to dashed line
//    func drawDottedLine(cgColor: CGColor) {
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.strokeColor = cgColor
//        shapeLayer.lineWidth = 1
//        shapeLayer.lineDashPattern = [5, 5] // 7 is the length of dash, 3 is length of the gap.
//        let path = CGMutablePath()
//        path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.minY), CGPoint(x: bounds.maxX, y: bounds.minY)])
//        shapeLayer.path = path
//        self.layer.addSublayer(shapeLayer)
//    }
//}

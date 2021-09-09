////
////  BubbleView.swift
////  appointment
////
////  Created by Dylan Barteling on 08/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class BubbleView: UIView {
//    
//    var showBorder: Bool = false
//    
//    private let borderLayer = CAShapeLayer()
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        addChatBubbleLayer()
//    }
//    
//    private func addChatBubbleLayer() {
//        let radius: CGFloat = 10
//        let arcSize = radius * 2
//        
//        let roundedWidth = bounds.inset(by: UIEdgeInsets(top: 0, left: arcSize, bottom: 0, right: 0))
//        let bezierPath = UIBezierPath(roundedRect: roundedWidth,
//                                      byRoundingCorners: [.topRight, .bottomRight, .bottomLeft],
//                                      cornerRadii: CGSize(width: radius, height: radius))
//        
//        if showBorder {
//            bezierPath.move(to: CGPoint(x: arcSize, y: arcSize))
//            bezierPath.addQuadCurve(to: .zero, controlPoint: CGPoint(x: arcSize, y: radius / 2))
//        } else {
//            bezierPath.move(to: CGPoint(x: arcSize, y: radius))
//            bezierPath.addLine(to: .zero)
//        }
//        bezierPath.addLine(to: CGPoint(x: frame.height, y: 0))
//        
//        let incomingMessageLayer = CAShapeLayer()
//        incomingMessageLayer.path = bezierPath.cgPath
//        incomingMessageLayer.frame = bounds
//        layer.mask = incomingMessageLayer
//        
//        guard showBorder else { return }
//        addBorder(with: bezierPath)
//    }
//    
//    private func addBorder(with bezierPath: UIBezierPath) {
//        borderLayer.path = bezierPath.cgPath
//        borderLayer.fillColor = nil
//        borderLayer.strokeColor = R.color.appBlue()!.cgColor
//        borderLayer.frame = bounds
//        borderLayer.lineWidth = 1.0
//        layer.insertSublayer(borderLayer, at: 0)
//    }
//}

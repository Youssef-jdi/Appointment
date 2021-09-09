//
//  CustomPageControl.swift
//  appointment
//
//  Created by Rachel Polachova on 24/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class CustomPageControl: UIPageControl {

    @IBInspectable var borderColor: UIColor?
    
    override var numberOfPages: Int {
        didSet {
            updateBorderColor()
        }
    }

    override var currentPage: Int {
        didSet {
            updateBorderColor()
        }
    }

    func updateBorderColor() {
        guard borderColor != nil else { return }
        subviews.enumerated().forEach { index, subview in
            if index != currentPage {
                subview.layer.borderColor = borderColor?.cgColor
                subview.layer.borderWidth = 1
            } else {
                subview.layer.borderWidth = 0
            }
        }
    }
}

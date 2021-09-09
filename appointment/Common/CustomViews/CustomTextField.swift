//
//  CustomTextField.swift
//  SportWallet
//
//  Created by Mohamed Taha Douiri on 26/07/2019.
//  Copyright © 2019 DTT. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomTextField: UITextField {

    @IBInspectable var layerBorderWidth: CGFloat = 1 {
        didSet { setup() }
    }

    @IBInspectable var cornerRadius: CGFloat = 8 {
        didSet { setup() }
    }

    @IBInspectable var layerBorderColor: UIColor = .black {
        didSet { setup() }
    }

    @IBInspectable var placeHolderColor: UIColor = .black {
        didSet {
            self.attributedPlaceholder = NSAttributedString(
                string: self.placeholder ?? "",
                attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
        }
    }
    
    @IBInspectable var oneLineBorder: Bool = false {
        didSet {
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
            bottomLine.backgroundColor = R.color.appDimGray()?.cgColor
            self.backgroundColor = .white
            self.borderStyle = .none
            self.layer.addSublayer(bottomLine)
        }
    }

    @IBInspectable var padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        guard oneLineBorder else {
            self.setup()
            return
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard oneLineBorder else {
            self.setup()
            return
        }
    }

    /// Base setup. Assigning the values from the `IBInspectable`s.
    private func setup() {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = layerBorderWidth
        self.layer.borderColor = layerBorderColor.cgColor
        self.layer.masksToBounds = true
        self.tintColor = layerBorderColor
    }
}

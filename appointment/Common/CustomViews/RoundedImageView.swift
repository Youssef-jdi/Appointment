//
//  RoundedImageView.swift
//  appointment
//
//  Created by Onur Hüseyin Çantay on 2.03.2019.
//  Copyright © 2019 DTT. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    
    var color: UIColor? {
        didSet { self.layer.borderColor = color!.cgColor }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        contentMode = .scaleAspectFit
    }
}

//
//  CustomViewProtocol.swift
//  appointment
//
//  Created by Tran Gia Huy on 31/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import UIKit

protocol CustomViewProtocol {
    var contentView: UIView! { get }

    func commonInit(for customViewName: String)
}

extension CustomViewProtocol where Self: UIView {

    func commonInit(for customViewName: String) {
        Bundle.main.loadNibNamed(customViewName, owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = .clear
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

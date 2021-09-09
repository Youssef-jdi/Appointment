//
//  AddToAgendaHeader.swift
//  appointment
//
//  Created by Youssef Jdidi on 7/14/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class AddToAgendaHeader: UIView, CustomViewProtocol {
    @IBOutlet var contentView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit(for: "AddToAgendaHeader")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit(for: "AddToAgendaHeader")
    }
}

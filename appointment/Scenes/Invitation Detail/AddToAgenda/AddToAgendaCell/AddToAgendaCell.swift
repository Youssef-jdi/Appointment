//
//  AddToAgendaCell.swift
//  appointment
//
//  Created by Youssef Jdidi on 7/14/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit
import M13Checkbox

protocol AddToAgendaDelegate: class {
    func select(at row: Int)
}

class AddToAgendaCell: UITableViewCell {
    @IBOutlet weak var checkBox: M13Checkbox!
    @IBOutlet weak var dateLabel: UILabel!
    private weak var delegate: AddToAgendaDelegate?
    private var row: Int = 0

    func configure(with text: String, row: Int, delegate: AddToAgendaDelegate) {
        self.row = row
        checkBox.checkState = .unchecked
        self.delegate = delegate
        dateLabel.text = text
    }

    @IBAction func selectCell(_ sender: Any) {
        delegate?.select(at: row)
    }
}

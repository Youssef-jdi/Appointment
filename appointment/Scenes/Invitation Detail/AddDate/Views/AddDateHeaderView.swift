//
//  CollectionReusableView.swift
//  appointment
//
//  Created by Tran Gia Huy on 04/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class AddDateHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(date: String, title: String) {
        dateLabel.text = date
        titleLabel.text = title
    }
}

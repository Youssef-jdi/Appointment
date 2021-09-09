//
//  SyncAppCollectionViewCell.swift
//  appointment
//
//  Created by Rachel Polachova on 06/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class SyncAppCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(app: SyncApp) {
        imageView.image = app.image
        imageContainerView.backgroundColor = app.color
    }
}

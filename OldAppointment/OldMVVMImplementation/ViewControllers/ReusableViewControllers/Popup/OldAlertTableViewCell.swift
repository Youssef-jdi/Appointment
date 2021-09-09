////
////  AlertTableViewCell.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 28/02/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class AlertTableViewCell: UITableViewCell {
//
//    @IBOutlet private weak var cellImage: UIImageView!
//    @IBOutlet private weak var cellLabel: UILabel! {
//        didSet {
//            cellLabel.font = R.font.openSansBold(size: 14)
//            cellLabel.textColor = R.color.appGray()!
//        }
//    }
//    override var reuseIdentifier: String? { return "AlertTableViewCell" }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//    
//    public func prepareCell(image: UIImage, text: String) {
//        cellImage.image = image
//        cellLabel.text = text
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//}

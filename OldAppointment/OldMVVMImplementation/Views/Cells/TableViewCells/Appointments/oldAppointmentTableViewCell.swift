////
////  AppointmentTableViewCell.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 3.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class AppointmentTableViewCell: UITableViewCell {
//    
//    @IBOutlet private weak var timeLabel: UILabel! {
//        didSet {
//            timeLabel.font = R.font.notoSans(size: 12)
//            timeLabel.textColor = R.color.appDimGray()
//        }
//    }
//    @IBOutlet private weak var titleLabel: UILabel! {
//        didSet {
//            titleLabel.font = R.font.notoSans(size: 14)
//        }
//    }
//    @IBOutlet private weak var appointmentTypeImageView: UIImageView!
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        
//        // Configure the view for the selected state
//    }
//    
//    func prepareCell(title: String, time: String, image: UIImage) {
//        self.timeLabel.text = time
//        self.titleLabel.text = title
//        self.appointmentTypeImageView.image = image
//    }
//}

////
////  PlanningMonthDetailTableViewCell.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 8.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class PlanningMonthDetailTableViewCell: UITableViewCell {
//    override var reuseIdentifier: String? { return "PlanningMonthDetailTableViewCell" }
//    @IBOutlet private weak var weekLabel: UILabel! {
//        didSet {
//            weekLabel.textColor = R.color.appDarkRed()!
//        }
//    }
//    @IBOutlet private weak var dateLabel: UILabel! {
//        didSet {
//            dateLabel.font = R.font.robotoRegular(size: 14)
//        }
//    }
//    @IBOutlet private weak var titleLabel: UILabel! {
//        didSet {
//            titleLabel.font = R.font.robotoRegular(size: 12)
//        }
//    }
//    @IBOutlet private weak var timeLabel: UILabel! {
//        didSet {
//            timeLabel.font = R.font.robotoRegular(size: 12)
//        }
//    }
//    @IBOutlet private weak var appointmentImage: UIImageView! {
//        didSet {
//            appointmentImage.contentMode = .scaleAspectFit
//        }
//    }
//    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//}

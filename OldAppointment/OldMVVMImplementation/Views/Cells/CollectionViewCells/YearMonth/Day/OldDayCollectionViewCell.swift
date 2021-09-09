////
////  DayCollectionViewCell.swift
////  appointment
////
////  Created by Dylan Barteling on 23/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class DayCollectionViewCell: UICollectionViewCell {
//    
//    private var holidays: [HolidayModel] = []
//    
//    @IBOutlet private weak var dayLabel: UILabel!
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        dayLabel.isHidden = false
//        dayLabel.textColor = R.color.appDimGray()
//        dayLabel.backgroundColor = .clear
//    }
//    
//    func configure(date: Date?, holidays: [HolidayModel]?) {
//        if let date = date {
//            dayLabel.text = "\(date.day)"
//            if date.isWeekend {
//                dayLabel.textColor = R.color.appBlue()
//            } else {
//                dayLabel.textColor = R.color.appDimGray()
//            }
//        } else {
//            dayLabel.isHidden = true
//        }
//        if let holidays = holidays, !holidays.isEmpty {
//            self.holidays = holidays
//            dayLabel.layer.cornerRadius = dayLabel.frame.height / 2
//            dayLabel.layer.masksToBounds = true
//            dayLabel.layer.borderWidth = 1
//            
//            let type = holidays.first!.type
//            dayLabel.backgroundColor = type.backgroundColor
//            dayLabel.textColor = type.textColor
//            dayLabel.layer.borderColor = type.borderColor
//        }
//    }
//}

////
////  PlanningMonthExpandableTableViewCell.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 8.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import ExpandableCell
//
//class PlanningMonthExpandableTableViewCell: UITableViewCell {
//    
//    override var reuseIdentifier: String? { return "PlanningMonthExpandableTableViewCell" }
//    
//    @IBOutlet private weak var arrowImage: UIImageView! {
//        didSet {
//            arrowImage.contentMode = .scaleAspectFit
//            arrowImage.image = R.image.pointer_Down_Black()!
//        }
//    }
//    
//    @IBOutlet private var appointmentTypeImageView: [UIImageView]! {
//        didSet {
//            appointmentTypeImageView.forEach { $0.contentMode = .scaleAspectFit }
//        }
//    }
//    
//    @IBOutlet private var appointmentTypeCountLabel: [UILabel]! {
//        didSet {
//            appointmentTypeCountLabel.forEach { $0.textColor = R.color.appDimGray() }
//        }
//    }
//    
//    @IBOutlet private weak var monthLabel: UILabel! {
//        didSet {
//            monthLabel.textColor = R.color.appBlue()!
//        }
//    }
//    
//    var isExpanded: Bool = false
//    var animator: UIViewPropertyAnimator {
//        let isUp: CGFloat = self.isExpanded ? 0 : .pi
//        return UIViewPropertyAnimator(duration: 0.3, curve: .linear) { self.arrowImage.transform = CGAffineTransform(rotationAngle: isUp) }
//    }
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
//    func hideAppointmentType(index: Int) {
//        self.appointmentTypeCountLabel[index].isHidden = true
//        self.appointmentTypeImageView[index].isHidden = true
//    }
//}

////
////  PlanningSearchCell.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 26.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class PlanningSearchCell: UITableViewCell {
//    @IBOutlet private weak var iconImageView: UIImageView! {
//        didSet {
//            iconImageView.contentMode = .scaleAspectFit
//            iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
//            iconImageView.clipsToBounds = true
//        }
//    }
//    
//    @IBOutlet private weak var eventNameLabel: UILabel!
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//    
//    func prepareCell(appointment: Appointment) {
//        self.iconImageView.image = appointment.appointmentTypeImage
//        self.eventNameLabel.text = appointment.title
//    }
//}

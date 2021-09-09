////
////  DayView.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//enum DayViewState {
//    case normal
//    case empty
//}
//class DayStackView: UIStackView {
//    @IBOutlet private weak var dayNotificationCountLabel: UILabel! {
//        didSet {
//        }
//    }
//    @IBOutlet private weak var daySocialIconImage: UIImageView! {
//        didSet {
//        }
//    }
//    @IBOutlet private weak var dayAppointmentTypeImageView: UIImageView! {
//        didSet {
//        }
//    }
//    @IBOutlet private weak var dayCountLabel: UILabel! {
//        didSet {
//        }
//    }
//
//    func prepareStackView(notificationCount: String?, socialImage: UIImage?, appointmentTypeImage: UIImage?, dayCount: String) {
//        dayCountLabel.text = dayCount
//        dayAppointmentTypeImageView.image = appointmentTypeImage
//        daySocialIconImage.image = socialImage
//        dayNotificationCountLabel.text = notificationCount
//        if socialImage != nil {
//            dayAppointmentTypeImageView.image = nil
//        }
//    }
//    
//    func removeAllProperties() {
//        dayNotificationCountLabel.text = nil
//        daySocialIconImage.image = nil
//        dayAppointmentTypeImageView.image = nil
//        dayCountLabel.text = nil
//    }
//}

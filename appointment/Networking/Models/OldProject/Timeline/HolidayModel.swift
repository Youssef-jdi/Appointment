//swiftlint:disable orphaned_doc_comment
////
////  HolidayModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 22.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//struct HolidayModel {
//    let header: String
//    let date: Date
//    let type: HolidayType
//}
//
//enum HolidayType: Int {
//    
//    case red, gray, circle
//    
//    var textColor: UIColor {
//        switch self {
//        case .red:
//            return .white
//        case .gray:
//            return .white
//        case .circle:
//            return R.color.appDimGray()!
//        }
//    }
//    
//    var backgroundColor: UIColor {
//        switch self {
//        case .red:
//            return R.color.appLightRed()!
//        case .gray:
//            return R.color.appDimGray()!
//        case .circle:
//            return .clear
//        }
//    }
//    
//    var borderColor: CGColor {
//        switch self {
//        case .red:
//            return UIColor.clear.cgColor
//        case .gray:
//            return UIColor.clear.cgColor
//        case .circle:
//            return R.color.appDimGray()!.cgColor
//        }
//    }
//}

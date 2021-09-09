//swiftlint:disable orphaned_doc_comment
////
////  PlanningModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 8.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//struct PlanningModel: Codable {
//    let data: PlanningData
//}
//
//struct PlanningData: Codable {
//    let appointments: [PlanningAppointmentModel]
//}
//
//struct PlanningAppointmentModel: Codable {
//    let type: Int
//    let title, date: String
//    let timestamp: Double
//    let place: String
//    
//    var planningType: PlanningModelType!
//    
//    enum CodingKeys: String, CodingKey {
//        case type, title, date, timestamp, place
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        type = try container.decode(Int.self, forKey: .type)
//        switch type {
//        case 0: planningType = .standart
//        case 1: planningType = .bussiness
//        case 2: planningType = .group
//        case 3: planningType = .MOM
//        case 4: planningType = .memo(.memo(.normal))
//        case 5: planningType = .memo(.memoTo(.normal))
//        case 6: planningType = .holiday
//        default: planningType = .memo ( .memo( .canceled))
//        }
//        title = try container.decode(String.self, forKey: .title)
//        date = try container.decode(String.self, forKey: .date)
//        timestamp = try container.decode(Double.self, forKey: .timestamp)
//        place = try container.decode(String.self, forKey: .place)
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(title, forKey: .title)
//        try container.encode(type, forKey: .type)
//        try container.encode(date, forKey: .date)
//        try container.encode(timestamp, forKey: .timestamp)
//        try container.encode(place, forKey: .place)
//    }
//
//    var color: UIColor {
//        switch planningType! {
//        case .standart: return R.color.appBlue()!
//        case .bussiness: return R.color.appDarkRed()!
//        //case .cancelledMemoTo:
//        case .holiday: return R.color.appDimGray()!
//        case .MOM: return R.color.appYellow()!
//        case .memo(let type):
//            switch type {
//            case .memo:
//                return R.color.appYellow()!
//            case .memoTo(let state):
//                switch state {
//                case .canceled: return R.color.appLightRed()!
//                case .normal: return R.color.appYellow()!
//                default: return R.color.appYellow()!
//                }
//            }
//        case .group: return R.color.appYellow()!
//        }
//    }
//    
//    var image: UIImage {
//        switch planningType! {
//        case .standart: return R.image.menu_Standard()!
//        case .bussiness: return R.image.menu_Business()!
//        case .holiday: return R.image.menu_Holidays()!
//        case .MOM: return R.image.mom_Icon_Yellow()!
//        case .memo(let type):
//            switch type {
//            case .memo:
//                return R.image.memo_Icon_Yellow()!
//            case .memoTo:
//                return R.image.menu_MemoTo()!
//            }
//            
//        case .group: return R.image.menu_Group()!
//        }
//    }
//}

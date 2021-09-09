////
////  EventsTarget.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//
//import Foundation
//import Moya
//
//enum EventsTarget {
//    case fetchEvents
//}
//
//extension EventsTarget: TargetType {
//    var baseURL: URL {
//        return URL(string: "https://appointment.dev2.d-tt.nl/api/v1/products")!
//    }
//    
//    var path: String {
//        switch self {
//        case .fetchEvents:
//            return ""
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .fetchEvents:
//            return .get
//        }
//    }
//    
//    var sampleData: Data {
//        switch self {
//        case .fetchEvents:
//            return stubbedResponse("EventsResponse")
//        }
//    }
//    
//    var task: Task {
//        switch self {
//        case .fetchEvents:
//            return .requestPlain
//        }
//    }
//    
//    var authorizationType: AuthorizationType {
//        return .bearer
//    }
//    
//    var headers: [String: String]? {
//        switch self {
//        default:
//            return nil
//        }
//    }
//}

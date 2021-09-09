////
////  PlanningSearchTarget.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 26.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//enum PlanningSearchTarget {
//    case fetchAppointmentsByName(name: String)
//}
//
//extension PlanningSearchTarget: TargetType {
//    var baseURL: URL {
//        return URL(string: "https://appointment.dev2.d-tt.nl/api/v1/products")!
//    }
//    
//    var path: String {
//        switch self {
//        case .fetchAppointmentsByName:
//            return ""
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .fetchAppointmentsByName:
//            return .get
//        }
//    }
//    
//    var sampleData: Data {
//        switch self {
//        case .fetchAppointmentsByName:
//            return stubbedResponse("PlanningSearchResponse")
//        default: break
//        }
//        return Data()
//    }
//    
//    var task: Task {
//        switch self {
//        case .fetchAppointmentsByName(let name):
//            var params: [String: Any] = [:]
//            params["name"] = name
//            return .requestParameters(parameters: params, encoding: URLEncoding.default)
//        default: break
//        }
//        return .requestPlain
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
//

////
////  DiagramParticipantTarget.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 8.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//enum DiagramParticipantTarget {
//    case fetchParticipant(id: Int)
//}
//
//extension DiagramParticipantTarget: TargetType {
//    // MARK: - Properties
//    var baseURL: URL {
//        return URL(string: "https://appointment.dev2.d-tt.nl/api/v1/appointments/")!
//    }
//    
//    var path: String {
//        switch self {
//        case .fetchParticipant(let id):
//            return "\(id)/participants"
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .fetchParticipant:
//            return .get
//        }
//    }
//    
//    var sampleData: Data {
//        switch self {
//        case .fetchParticipant:
//            return stubbedResponse("ParticipantDiagramResponse")
//        }
//    }
//    
//    var task: Task {
//        switch self {
//        case .fetchParticipant(let id):
//            var params: [String: Any] = [:]
//            params["id"] = id
//            return .requestParameters(parameters: params, encoding: URLEncoding.default)
//        }
//    }
//    
//    var authorizationType: AuthorizationType {
//        return .bearer
//    }
//    
//    var headers: [String: String]? {
//        switch self {
//            //        case .respond:
//            //            return ["Content-Type": "application/x-www-form-urlencoded"]
//            //        case .createInvitation:
//        //            return ["Content-Type": "application/json"]
//        default:
//            return nil
//        }
//    }
//}

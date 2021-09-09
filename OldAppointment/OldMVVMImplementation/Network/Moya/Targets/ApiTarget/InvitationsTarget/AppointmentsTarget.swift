////
////  AppointmentsTarget.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//enum AppointmentsTarget {
//    case participants(id: Int)
//    case appointmentsByType(type: SideMenuCellType)
//    case homeAppointments
//    case plannings
//}
//
//extension AppointmentsTarget: TargetType, AccessTokenAuthorizable {
//    // MARK: - Properties
//    var baseURL: URL {
//        return URL(string: "https://appointment.dev2.d-tt.nl/api/v1/appointments/")!
//    }
//    
//    var path: String {
//        switch self {
//        case .participants(let id):
//            return "\(id)/participants"
//        case .homeAppointments, .appointmentsByType:
//            return ""
//        case .plannings:
//            return ""
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .participants, .homeAppointments, .plannings, .appointmentsByType:
//            return .get
//        }
//    }
//    
//    var sampleData: Data {
//        switch self {
//        case .participants:
//            return stubbedResponse("AppointmentParticipantResponse")
//        case .homeAppointments:
//            return stubbedResponse("HomeAppointmentResponse")
//        case .appointmentsByType(let type):
//            switch type {
//            case .appointments(.standard): return stubbedResponse("AppointmentsStandartResponse")
//            case .appointments(.business): return stubbedResponse("AppointmentsBusinessResponse")
//            case .appointments(.group): return stubbedResponse("AppointmentsGroupResponse")
//            case .meetings(.messages): return stubbedResponse("AppointmentsMessagesResponse")
//            case .meetings(.minOfMeeting): return stubbedResponse("AppointmentsMOMResponse")
//            case .memories(.memo): return stubbedResponse("AppointmentsMemoResponse")
//            case .memories(.memoTo): return stubbedResponse("AppointmentsMemoToResponse")
//            default: return stubbedResponse("AppointmentsStandartResponse")
//            }
//
//        case .plannings:
//            return stubbedResponse("PlanningResponse")
//        }
//    }
//    
//    var task: Task {
//        switch self {
//        case .participants, .homeAppointments, .plannings, .appointmentsByType:
//            return .requestPlain
////        case .respond(let proposedDateId, let comment, let alternativeDate, let status):
////            var params: [ String:Any ] = [:]
////            params["proposedDateId"] = proposedDateId
////            params["comment"] = comment
////            params["alternativeDate"] = alternativeDate
////            params["status"] = status
////            return .requestParameters(parameters: params, encoding: URLEncoding.default)
//        }
//    }
//    
//    var authorizationType: AuthorizationType {
//        return .bearer
//    }
//    
//    var headers: [String: String]? {
//        switch self {
////        case .respond:
////            return ["Content-Type": "application/x-www-form-urlencoded"]
////        case .createInvitation:
////            return ["Content-Type": "application/json"]
//        default:
//            return nil
//        }
//    }
//}

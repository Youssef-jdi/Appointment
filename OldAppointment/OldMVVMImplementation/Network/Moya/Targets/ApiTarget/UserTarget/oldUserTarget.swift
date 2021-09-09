////
////  UserTarget.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//enum UserTarget {
//    case me
//    case changePassword(oldPassword: String, newPassword: String)
//    case profile
//    case filter(query: String, offset: Int?, limit: Int?, contactsOnly: Bool)
//    case attendances(invitationId: Int?)
//}
//
//extension UserTarget: TargetType, AccessTokenAuthorizable {
//    // MARK: - Properties
//    var baseURL: URL {
//        return URL(string: "https://appointment.docker-dev.d-tt.nl/api/users/")!
//    }
//    
//    var path: String {
//        switch self {
//        case .me:
//            return "me"
//        case .changePassword:
//            return ""
//        case .profile:
//            return "profile"
//        case .filter:
//            return "filter"
//        case .attendances:
//            return "me/attendances"
//        }
//    }
//    
//    var method: Moya.Method {
//        return .post
//    }
//    
//    var sampleData: Data {
//        switch self {
//        case .me:
//            return stubbedResponse("UserResponse")
//        case .filter:
//            return stubbedResponse("UserFilterResponse")
//        case .attendances:
//            return stubbedResponse("UserAttendancesResponse")
//        case .profile:
//            return stubbedResponse("UserProfileResponse")
//        default: return Data()
//        }
//    }
//    
//    var task: Task {
//        switch self {
//        case .me, .profile:
//            return .requestPlain
//        case .changePassword(let oldPassword, let newPassword):
//            var params: [String: Any] = [:]
//            params["oldPassword"] = oldPassword
//            params["newPassword"] = newPassword
//            return .requestParameters(parameters: params, encoding: URLEncoding.default)
//        case .filter(let query, let offset, let limit, let contactsOnly):
//            var params: [String: Any] = [:]
//            params["query"] = query
//            params["offset"] = offset
//            params["limit"] = limit
//            params["contactsOnly"] = contactsOnly
//            return .requestParameters(parameters: params, encoding: URLEncoding.default)
//        case .attendances(let invitationId):
//            var params: [String: Any] = [:]
//            params["invitationId"] = invitationId
//            return .requestParameters(parameters: params, encoding: URLEncoding.default)
//        }
//    }
//    
//    var authorizationType: AuthorizationType {
//        switch self {
//        default:
//            return .bearer
//        }
//    }
//    
//    var headers: [String: String]? {
//        switch self {
//        default:
//            return nil
//        }
//    }
//}

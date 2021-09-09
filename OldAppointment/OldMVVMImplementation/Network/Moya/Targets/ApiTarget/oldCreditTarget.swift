////
////  CreditTarget.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 14.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//enum CreditTarget {
//    case fetchAvailableCredit
//    case bought(key: String)
//}
//
//extension CreditTarget: TargetType, AccessTokenAuthorizable {
//    // MARK: - Properties
//    var baseURL: URL {
//        return URL(string: "https://appointment.dev2.d-tt.nl/api/v1/users")!
//    }
//    
//    var path: String {
//        switch self {
//        case .fetchAvailableCredit, .bought:
//            return "/buy"
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .fetchAvailableCredit:
//            return .get
//        case .bought:
//            return .post
//        }
//    }
//    
//    var sampleData: Data {
//        switch self {
//        case .fetchAvailableCredit:
//            return stubbedResponse("AvailableCreditsResponse")
//        default: return Data()
//        }
//    }
//    
//    var task: Task {
//        switch self {
//        case .fetchAvailableCredit:
//            return .requestPlain
//        case .bought(let key):
//            var params: [String: Any] = [:]
//            params["credit_key"] = key
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
//        default:
//            return nil
//        }
//    }
//}

////
////  YahooContacts.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 23.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Moya
//
//enum YahooContacts: TargetType, AccessTokenAuthorizable {
//    
//    case contacts
//
//    // MARK: - Properties
//    var baseURL: URL {
//        return URL(string: "https://social.yahooapis.com")!
//    }
//    
//    var path: String {
//        switch self {
//        case .contacts:
//            return "/v1/user/me/contacts?format=json"
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .contacts:
//            return .get
//        }
//    }
//    
//    var sampleData: Data {
//        return Data()
//    }
//    
//    var task: Task {
//        switch self {
//        case .contacts:
//            return .requestPlain
//        }
//    }
//    
//    var authorizationType: AuthorizationType {
//        return .bearer
//    }
//    
//    var headers: [String: String]? {
//        return nil
//    }
//}

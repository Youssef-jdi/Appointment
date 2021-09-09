////
////  OutlookContacts.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 21.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//enum OutlookContacts: TargetType, AccessTokenAuthorizable {
//    
//    case contacts
//
//    // MARK: - Properties
//    var baseURL: URL {
//        return URL(string: "https://graph.microsoft.com/v1.0/me")!
//    }
//    
//    var path: String {
//        switch self {
//        case .contacts:
//            return "/contacts"
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

////
////  FacebookContacts.swift
////  appointment
////
////  Created by Dylan Barteling on 22/02/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//enum FacebookContacts: TargetType, AccessTokenAuthorizable {
//    
//    case contacts
//    // MARK: - Properties
//    var baseURL: URL {
//        return URL(string: "https://graph.facebook.com/v3.2")!
//    }
//    
//    var path: String {
//        switch self {
//        case .contacts:
//            return "/me/friends"
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

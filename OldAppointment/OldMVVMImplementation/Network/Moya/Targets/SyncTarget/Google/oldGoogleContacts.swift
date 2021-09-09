////
////  GoogleContacts.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 22.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//enum GoogleContacts: TargetType {
//    
//    case contacts
//    case emailAddresses
//
//    // MARK: - Properties
//    var baseURL: URL {
//        return URL(string: "https://people.googleapis.com/v1/people/me")!
//    }
//    
//    var path: String {
//        switch self {
//        case .emailAddresses:
//            return ""
//        case .contacts:
//            return "/connections"
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .contacts, .emailAddresses:
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
//            return .requestParameters(parameters: ["personFields": "emailAddresses,phoneNumbers"], encoding: URLEncoding.default)
//        case .emailAddresses:
//            return .requestParameters(parameters: ["personFields": "emailAddresses,phoneNumbers,names,relations"], encoding: URLEncoding.default)
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

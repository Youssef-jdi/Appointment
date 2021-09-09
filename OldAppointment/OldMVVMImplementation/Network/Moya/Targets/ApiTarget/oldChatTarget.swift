////
////  EmojiTarget.swift
////  appointment
////
////  Created by Dylan Barteling on 05/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//enum ChatTarget {
//    case fetchEmojis
//}
//
//extension ChatTarget: TargetType {
//    var baseURL: URL {
//        return URL(string: "https://appointment.dev2.d-tt.nl/api/v1/chat")!
//    }
//    
//    var path: String {
//        switch self {
//        case .fetchEmojis:
//            return "/emojis"
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .fetchEmojis:
//            return .get
//        }
//    }
//    
//    var sampleData: Data {
//        switch self {
//        case .fetchEmojis:
//            return stubbedResponse("EmojiResponse")
//        }
//    }
//    
//    var task: Task {
//        return .requestPlain
//    }
//    
//    var authorizationType: AuthorizationType {
//        return .none
//    }
//    
//    var headers: [String: String]? {
//        return nil
//    }
//}

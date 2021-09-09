////
////  TodoListTarget.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//enum TodoListTarget {
//    case getTodoList(invitationId: Int)
//    case updateTodoComplete(invitationId: Int, todoId: Int, isComplete: Bool)
//    case createTodoItem(invitationId: Int, title: String)
//    case bulkTodoItemCreation(invitationId: Int)
//}
//
//extension TodoListTarget: TargetType, AccessTokenAuthorizable {
//    
//    var baseURL: URL {
//        return URL(string: "https://appointment.dev2.d-tt.nl/api/v1/invitations")!
//    }
//    
//    var path: String {
//        switch self {
//        case .getTodoList(let id), .bulkTodoItemCreation(let id), .createTodoItem(let id, _):
//            return "/\(id)/todo"
//        case .updateTodoComplete(let invitationId, let todoId, _):
//            return "/\(invitationId)/todo/\(todoId)"
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .getTodoList:
//            return .get
//        case .updateTodoComplete:
//            return .patch
//        case .createTodoItem, .bulkTodoItemCreation:
//            return .post
//        }
//    }
//    
//    var sampleData: Data {
//        switch self {
//        case .getTodoList:
//            return stubbedResponse("TodoListResponse")
//        case .bulkTodoItemCreation:
//            return stubbedResponse("TodoListBulkResponse")
//        default:
//            return Data()
//        }
//    }
//    
//    var task: Task {
//        switch self {
//        case .getTodoList, .bulkTodoItemCreation:
//            return .requestPlain
//        case .createTodoItem(_, let title):
//            var params: [String: Any] = [:]
//            params["title"] = title
//            return .requestParameters(parameters: params, encoding: URLEncoding.default)
//        case .updateTodoComplete(_, _, let isComplete):
//            var params: [String: Any] = [:]
//            params["isComplete"] = isComplete
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
//        case .updateTodoComplete, .createTodoItem:
//            return ["Content-Type": "application/x-www-form-urlencoded"]
//        case .bulkTodoItemCreation:
//            return ["Content-Type": "application/json"]
//        default:
//            return nil
//        }
//    }
//}

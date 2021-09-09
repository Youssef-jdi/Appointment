////
////  NewChatService.swift
////  appointment
////
////  Created by Dylan Barteling on 15/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//class NewChatService: MVVMService {
//    var provider: AuthenticatedProvider<MultiTarget, AuthTarget>!
//    
//    typealias AuthTarget = ApiTarget
//}
//
//extension NewChatService: NewChatServicable {
//    
//    func fetchFriends(query: String? = nil, result: @escaping NewChatCompletion<UserFilterModel, NewChatError>) {
//        provider.request(MultiTarget(UserTarget.filter(query: query ?? "", offset: 0, limit: 20, contactsOnly: true))) { response in
//            do {
//                let userResponse: UserFilterModel = try response
//                    .get()
//                    .map(UserFilterModel.self)
//                result(.success(userResponse))
//            } catch {
//                print(error.localizedDescription)
//                result(.failure(NewChatError.underlying(error)))
//            }
//        }
//    }
//}

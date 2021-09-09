////
////  FacebookService.swift
////  appointment
////
////  Created by Dylan Barteling on 25/02/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//class FacebookService: MVVMService {
//    typealias AuthTarget = FacebookTarget
//    
//    var provider: AuthenticatedProvider<MultiTarget, FacebookTarget>!
//}
//
//extension FacebookService: FacebookServiceable {
//    
//    func getContacts(getContactsRequest: FacebookContacts, result: @escaping FacebookCompletion<FacebookFriendsResponse, FacebookError>) {
//        AppDelegate.adapter = provider.authManager
//        provider.request(MultiTarget(getContactsRequest)) { response in
//            do {
//                let facebookFriendsResponse = try response
//                    .get()
//                    .filterSuccessfulStatusCodes()
//                    .map(FacebookFriendsResponse.self)
//                result(.success(facebookFriendsResponse))
//            } catch {
//                result(.failure(FacebookError.underlying(error)))
//            }
//        }
//    }
//    
//}

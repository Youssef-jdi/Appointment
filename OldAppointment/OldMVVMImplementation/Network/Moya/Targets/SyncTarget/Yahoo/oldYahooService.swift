////
////  YahooService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 23.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Moya
//import Result
//
//class YahooService: MVVMService {
//    
//    typealias AuthTarget = YahooTarget
//    
//    var provider: AuthenticatedProvider<MultiTarget, YahooTarget>!
//}
//
//extension YahooService: YahooServiceable {
//    func contacts(getContactsRequest: YahooContacts, result: @escaping YahooCompletion<YahooContactResponse, YahooError>) {
//        AppDelegate.adapter = provider.authManager
//        provider.request(MultiTarget(YahooContacts.contacts)) { response in
//            do {
//                let decodedYahooResponse = try response
//                    .get()
//                    .filterSuccessfulStatusCodes()
//                    .map(YahooContactResponse.self)
//                result(.success(decodedYahooResponse))
//            } catch {
//                result(.failure(YahooError.underlying(error)))
//            }
//        }
//    }
//}

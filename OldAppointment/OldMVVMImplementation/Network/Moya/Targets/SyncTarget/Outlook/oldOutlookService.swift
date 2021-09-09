////
////  OutlookService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 21.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//
//class OutlookService: MVVMService {
//    typealias AuthTarget = OutlookTarget
//    
//    var provider: AuthenticatedProvider<MultiTarget, OutlookTarget>!
//}
//
//extension OutlookService: OutlookServiceable {
//    
//    func getContacts(getContactsRequest: OutlookContacts, result: @escaping OutlookCompletion<OutlookContactResponse, OutlookError>) {
//        AppDelegate.adapter = provider.authManager
//        provider.request(MultiTarget(OutlookContacts.contacts)) { response in
//            do {
//                let decodedOutlookResponse = try response
//                    .get()
//                    .filterSuccessfulStatusCodes()
//                    .map(OutlookContactResponse.self)
//                result(.success(decodedOutlookResponse))
//            } catch {
//                result(.failure(OutlookError.underlying(error)))
//            }
//        }
//    }
//    
//}

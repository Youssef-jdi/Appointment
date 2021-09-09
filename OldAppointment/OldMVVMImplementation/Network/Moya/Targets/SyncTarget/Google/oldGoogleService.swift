////
////  GoogleService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 22.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//class GoogleService: MVVMService {
//    typealias AuthTarget = GoogleTarget
//    
//    var provider: AuthenticatedProvider<MultiTarget, GoogleTarget>!
//}
//
//extension GoogleService: GoogleServicable {
//    func getContacts(getContactsRequest: GoogleContacts, result: @escaping GoogleCompletion<GoogleContactResponse, GoogleError>) {
//        provider.request(MultiTarget(GoogleContacts.contacts)) { response in
//            do {
//                let decodedGoogleResponse = try response
//                    .get()
//                    .filterSuccessfulStatusCodes()
//                    .map(GoogleContactResponse.self)
//                result(.success(decodedGoogleResponse))
//            } catch {
//                result(.failure(GoogleError.underlying(error)))
//            }
//        }
//    }
//}

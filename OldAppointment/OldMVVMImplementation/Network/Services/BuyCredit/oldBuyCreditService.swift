////
////  BuyCreditService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 14.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//import Moya
//
//class BuyCreditService: MVVMService {
//    var provider: AuthenticatedProvider<MultiTarget, AuthTarget>!
//    
//    typealias AuthTarget = ApiTarget
//}
//
//extension BuyCreditService: BuyCreditServicable {
//    func buyCredit(creditKey: String, result: @escaping BuyCreditCompletion<Void, BuyCreditError>) {
//        provider.request(MultiTarget(CreditTarget.bought(key: creditKey))) { response in
//            do {
//                _ = try response
//                    .get()
//                    .filterSuccessfulStatusCodes()
//                result(.success(()))
//            } catch {
//                result(.failure(BuyCreditError.underlying(error)))
//            }
//        }
//    }
//    
//    func fetchCreditBalance(result: @escaping BuyCreditCompletion<CreditModels, BuyCreditError>) {
//        provider.request(MultiTarget(CreditTarget.fetchAvailableCredit)) { response in
//            do {
//                let creditModels: CreditModels = try response
//                    .get()
//                    .map(CreditModels.self)
//                result(.success(creditModels))
//            } catch {
//                result(.failure(BuyCreditError.underlying(error)))
//            }
//        }
//    }
//    
//}

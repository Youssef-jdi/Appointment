//
////  IAPService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 27.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import SwiftyStoreKit
//import StoreKit
//
//enum RegisteredPurchase: String {
//    case credit10 = "credits_10"
//    case credit20 = "credits_20"
//    case credit30 = "credits_30"
//}
//
//typealias IAPServiceState = PresentationState<IAPState, IAPError>
//
//enum IAPState {
//    case fetchedCredits
//    case fetchProductInfo(RetrieveResults)
//    case alertForPurchase(PurchaseResult)
//    case purchased
//}
//
//enum IAPError: Error {
//    case productNotFound(Error)
//    case underlying(SKError)
//}
//
//class IAPService {
//    var stateHandler: ((IAPServiceState) -> Void)?
//    
//    private(set) var currentState: IAPServiceState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//}
//
//extension IAPService: IAPServicable {
//    
//    func fetchAllProducts() {
//        self.currentState = .loading
//        SwiftyStoreKit.retrieveProductsInfo([
//            RegisteredPurchase.credit10.rawValue,
//            RegisteredPurchase.credit20.rawValue,
//            RegisteredPurchase.credit30.rawValue
//        ]) { result in
//            guard let error = result.error else {
//                self.currentState = .value(IAPState.fetchProductInfo(result))
//                self.currentState = .idle
//                return
//            }
//            self.currentState = .error(IAPError.productNotFound(error))
//        }
//    }
//    
//    func purchase(_ purchaseType: RegisteredPurchase, atomically: Bool) {
//        self.currentState = .loading
//        SwiftyStoreKit.purchaseProduct(purchaseType.rawValue, atomically: atomically) { result in
//            switch result {
//            case .success(let purchase):
//                let downloads = purchase.transaction.downloads
//                if !downloads.isEmpty {
//                    SwiftyStoreKit.start(downloads)
//                }
//                if purchase.needsFinishTransaction {
//                    self.currentState = .idle
//                    SwiftyStoreKit.finishTransaction(purchase.transaction)
//                    self.currentState = .value(IAPState.purchased)
//                }
//                self.currentState = .value(IAPState.alertForPurchase(result))
//            case .error(let error):
//                self.currentState = .idle
//                self.currentState = .error(IAPError.underlying(error))
//            }
//        }
//    }
//}

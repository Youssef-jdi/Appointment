////
////  BuyCreditsViewModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 14.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//typealias BuyCreditPresentationState = PresentationState<BuyCreditState, BuyCreditError>
//
//enum BuyCreditState {
//    case fetchedCredits
//}
//
//
//
//class BuyCreditsViewModel: MVVMViewModel {
//    typealias Service = BuyCreditService
//    
//    var service = BuyCreditService()
//    var stateHandler: ((BuyCreditPresentationState) -> Void)?
//    private(set) var currentState: BuyCreditPresentationState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//    
//    var credits: [Credit] = []
//}
//
//extension BuyCreditsViewModel {
//    func fetchCreditBalance() {
//        service.fetchCreditBalance { result in
//            switch result {
//            case .success(let value):
//                self.credits = value.credits
//                self.currentState = .value(BuyCreditState.fetchedCredits)
//            case .failure(let error):
//                self.currentState = .error(BuyCreditError.underlying(error))
//            }
//        }
//    }
//    
//    func getTypeIndex(for productIdentifier: String) -> Int? {
//        guard let type = RegisteredPurchase(rawValue: productIdentifier) else { return nil }
//        var index: Int?
//        switch type {
//        case .credit10: index = 0
//        case .credit20: index = 1
//        case .credit30: index = 2
//        }
//        return index
//    }
//}

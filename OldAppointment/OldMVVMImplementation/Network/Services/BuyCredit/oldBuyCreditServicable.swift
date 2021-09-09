////
////  BuyCreditServicable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 14.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Result
//
//typealias BuyCreditResult<T, U: Error> = Result<T, U>
//typealias BuyCreditCompletion<T, U: Error> = ((BuyCreditResult<T, U>) -> Void)
//typealias BuyCreditSuccessResult = Result<Void, BuyCreditError>
//enum BuyCreditError: Error {
//    case unauthorized
//    case productNotFound(Error)
//    case underlying(Error)
//}
//
//protocol BuyCreditServicable {
//    
//    /// Fetches buyable credits
//    ///
//    /// - Parameters:
//    ///   - result: Buy Credit Completion
//    func fetchCreditBalance(result: @escaping BuyCreditCompletion<CreditModels, BuyCreditError>)
//    
//    
//    /// Save's the bought credit to API
//    ///
//    /// - Parameters:
//    ///   - creditKey: credit key to be saved
//    ///   - result: Buy Credit Completion
//    func buyCredit(creditKey:String, result: @escaping (BuyCreditSuccessResult) -> Void )
//}

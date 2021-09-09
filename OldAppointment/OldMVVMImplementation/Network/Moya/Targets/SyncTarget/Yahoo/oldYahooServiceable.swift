////
////  YahooServiceable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 4.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//typealias YahooResult<T, U: Error> = Result<T, U>
//typealias YahooCompletion<T, U: Error> = ((OutlookResult<T, U>) -> Void)
//
//
//
//enum YahooError: Error {
//    ///  Not Authenticated
//    case notAuthenticated
//    
//    /// A General error Like internet connection etc.
//    case underlying(Error)
//}
//
//
//protocol YahooServiceable {
//    
//    /// Gets contacts from Yahoo
//    ///
//    /// - Parameters:
//    ///   - getContactsRequest: request Target
//    ///   - result: YahooCompletion
//    func contacts(getContactsRequest: YahooContacts, result: @escaping YahooCompletion<YahooContactResponse,YahooError>)
//}

////
////  OutlookServiceable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 4.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//
//typealias OutlookResult<T, U: Error> = Result<T, U>
//typealias OutlookCompletion<T, U: Error> = ((OutlookResult<T, U>) -> Void)
//
//enum OutlookError: Error {
//    ///  Not Authenticated
//    case notAuthenticated
//    
//    /// A General error Like internet connection etc.
//    case underlying(Error)
//}
//
//protocol OutlookServiceable {
//    
//     /// Fetches Outlook Contacts
//     ///
//     /// - Parameters:
//     ///   - getContactsRequest: request Target
//     ///   - result: OutlookCompletion
//     func getContacts(getContactsRequest: OutlookContacts, result: @escaping OutlookCompletion<OutlookContactResponse, OutlookError>)
//    
//}

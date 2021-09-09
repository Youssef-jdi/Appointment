////
////  FacebookServiceable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 4.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//typealias FacebookResult<T, U: Error> = Result<T, U>
//typealias FacebookCompletion<T, U: Error> = ((FacebookResult<T, U>) -> Void)
//
//enum FacebookError: Error {
//    
//    /*
//     100    Invalid parameter
//     200    Permissions error
//     210    U
//     func getContacts(getContactsRequest: FacebookContacts, result: @escaping FacebookCompletion<FacebookFriendsResponse, FacebookError>) {
//     <#code#>
//     }
//     ser not visible
//     110    Invalid user id
//     */
//    
//    ///  Not Authenticated
//    case notAuthenticated
//    
//    /// A General error Like internet connection etc.
//    case underlying(Error)
//}
//
//protocol FacebookServiceable {
//    
//    /// Fetches Contacts From Facebook
//    ///
//    /// - Parameters:
//    ///   - getContactsRequest: request Target
//    ///   - result: FacebookCompletion
//    func getContacts(getContactsRequest: FacebookContacts, result: @escaping FacebookCompletion<FacebookFriendsResponse,FacebookError>)
//}

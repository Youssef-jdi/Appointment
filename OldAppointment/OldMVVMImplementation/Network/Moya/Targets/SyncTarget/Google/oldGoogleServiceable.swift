////
////  GoogleServiceable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 4.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//typealias GoogleResult<T, U: Error> = Result<T, U>
//typealias GoogleCompletion<T, U: Error> = ((GoogleResult<T, U>) -> Void)
//
//enum GoogleError: Error {
//    ///  Not Authenticated
//    case notAuthenticated
//    
//    /// A General error Like internet connection etc.
//    case underlying(Error)
//}
//
//protocol GoogleServicable {
//
//    /// Gets Contact from Google
//    ///
//    /// - Parameters:
//    ///   - getContactsRequest: request Target
//    ///   - result: GoogleCompletion
//    func getContacts(getContactsRequest: GoogleContacts, result: @escaping GoogleCompletion<GoogleContactResponse, GoogleError>)
//    
//}

////
////  NewChatServicable.swift
////  appointment
////
////  Created by Dylan Barteling on 15/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Result
//
//typealias NewChatResult<T, U: Error> = Result<T, U>
//typealias NewChatCompletion<T, U: Error> = ((NewChatResult<T, U>) -> Void)
//
//enum NewChatError: Error {
//    case unauthorized
//    case underlying(Error)
//}
//
//protocol NewChatServicable {
//    
//    /// Fetches user friends by query
//    ///
//    /// - Parameters:
//    ///   - query: The name of the friend
//    ///   - result: User Friends Completion
//    func fetchFriends(query: String?, result: @escaping NewChatCompletion<UserFilterModel, NewChatError>)
//}

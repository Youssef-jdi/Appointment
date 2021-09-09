////
////  EmojiServicable.swift
////  appointment
////
////  Created by Dylan Barteling on 05/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Result
//
//typealias EmojiResult<T, U: Error> = Result<T, U>
//typealias EmojiCompletion<T, U: Error> = ((EmojiResult<T, U>) -> Void)
//
//enum EmojiError: Error {
//    case unauthorized
//    case underlying(Error)
//}
//
//protocol ChatServicable {
//    
//    /// Fetches the Emojis
//    ///
//    /// - Parameters:
//    ///   - result: Emojis Completion
//    func fetchEmojis(result: @escaping EmojiCompletion<EmojiModel, EmojiError>)
//}

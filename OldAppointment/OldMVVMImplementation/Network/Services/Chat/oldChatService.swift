////
////  EmojiService.swift
////  appointment
////
////  Created by Dylan Barteling on 05/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//class ChatService: MVVMService {
//    var provider: AuthenticatedProvider<MultiTarget, AuthTarget>!
//    
//    typealias AuthTarget = ApiTarget
//}
//
//extension ChatService: ChatServicable {
//    
//    func fetchEmojis(result: @escaping EmojiCompletion<EmojiModel, EmojiError>) {
//        provider.request(MultiTarget(ChatTarget.fetchEmojis)) { response in
//            do {
//                let emojiResponse: EmojiModel = try response
//                    .get()
//                    .map(EmojiModel.self)
//                result(.success(emojiResponse))
//            } catch {
//                print(error.localizedDescription)
//                result(.failure(EmojiError.underlying(error)))
//            }
//        }
//    }
//}

////
////  ChatViewModel.swift
////  appointment
////
////  Created by Dylan Barteling on 05/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import UIKit
//import Nuke
//
//typealias ChatPresentationState = PresentationState<ChatState, EmojiError>
//
//enum ChatState {
//    case fetchedEmojis
//}
//
//class ChatViewModel: MVVMViewModel {
//    var service = ChatService()
//    
//    typealias Service = ChatService
//    
//    var emojis: EmojiModel?
//    var stateHandler: ((ChatPresentationState) -> Void)?
//    private(set) var currentState: ChatPresentationState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//    
//    private let defaults = UserDefaults.standard
//}
//
//extension ChatViewModel {
//    
//    func fetchEmojis() {
//        service.fetchEmojis { result in
//            switch result {
//            case .success(let emojis):
//                self.downloadEmojis(data: emojis.data)
//                self.emojis = emojis
//                self.currentState = .value(ChatState.fetchedEmojis)
//            case .failure(let error):
//                self.currentState = .error(EmojiError.underlying(error))
//            }
//        }
//    }
//    
//    private func downloadEmojis(data: EmojiModel.Datum) {
//        guard newEmojiVersion(data.version) else { return }
//        data.categories
//            .flatMap { $0.emojis }
//            .forEach {
//                downloadEmoji(emoji: $0, version: data.version)
//        }
//    }
//    
//    private func newEmojiVersion(_ version: Int) -> Bool {
//        if version > defaults.integer(forKey: "Version") {
//            removeEmojis(version: version)
//            return true
//        }
//        return false
//    }
//    
//    private func downloadEmoji(emoji: EmojiModel.Datum.Emoji, version: Int) {
//        guard let url = URL(string: emoji.url) else { return }
//
//        let request = ImageRequest(
//            url: url,
//            targetSize: CGSize(width: 20, height: 20),
//            contentMode: .aspectFill)
//
//        ImagePipeline.shared.loadImage(with: request) { result in
//            switch result {
//            case .success(let response):
//                guard let imageData = response.image.pngData() else { return }
//                var dict = self.defaults.dictionary(forKey: "emoji.version.\(version)")
//                    as? [String: Data] ?? [:]
//                dict[emoji.code] = imageData
//                self.defaults.set(dict, forKey: "emoji.version.\(version)")
//                self.defaults.set(version, forKey: "Version")
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//    
//    private func removeEmojis(version: Int) {
//        defaults.removeObject(forKey: "Version")
//        defaults.removeObject(forKey: "emoji.version.\(version)")
//    }
//}

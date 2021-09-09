//swiftlint:disable orphaned_doc_comment
///*
// MIT License
// 
// Copyright (c) 2017-2018 MessageKit
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
// */
//
//import Foundation
//import MessageKit
//
//protocol CustomMessageType: Codable {
//    func asMessageType() -> MessageType
//}
//
//struct Message: MessageType {
//    var sender: SenderType
//    var messageId: String
//    var sentDate: Date
//    var kind: MessageKind
//}
//
//struct UserMessage: CustomMessageType {
//    let messageId: String
//    let content: String
//    let sentDate: Date
//    let sender: UserModel
//    let response: String?
//    let status: MessageStatus = .sending
//    let respect: Int = 0
//    let disrespect: Int = 0
//    
//    func asMessageType() -> MessageType {
//        return Message(sender: sender.asSender(), messageId: messageId, sentDate: sentDate, kind: .custom(self))
//    }
//}
//
//struct SystemMessage: CustomMessageType {
//    let content: String
//    let status: MessageStatus
//    let sender: UserModel
//    let messageId: String
//    let sentDate: Date
//    
//    init(content: String) {
//        self.content = content
//        self.status = MessageStatus.sending
//        self.sender = UserModel(id: "00000", givenName: "System")
//        self.messageId = "1"
//        self.sentDate = Date()
//    }
//    
//    func asMessageType() -> MessageType {
//        return Message(sender: sender.asSender(), messageId: messageId, sentDate: sentDate, kind: .custom(self))
//    }
//}
//
//enum MessageStatus: Int, Codable {
//    case sending
//    case received
//}
//
//enum CustomMessageKind {
//    case user(message: UserMessage)
//    case system(message: SystemMessage)
//}

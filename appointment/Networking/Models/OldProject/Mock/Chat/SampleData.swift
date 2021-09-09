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
//import MessageKit
//
//internal final class SampleData {
//
//    static let shared = SampleData()
//
//    private init() {}
//
//    let system = UserModel(id: "000000", givenName: "System")
//    let nathan = UserModel(id: "000001", givenName: "Nathan Tannar")
//    let steven = UserModel(id: "000002", givenName: "Steven Deutsch")
//    let wu = UserModel(id: "000003", givenName: "Wu Zhong")
//
//    lazy var senders = [nathan, steven, wu]
//
//    var currentSender: UserModel {
//        return nathan
//    }
//
//    var now = Date()
//
//    func dateAddingRandomTime() -> Date {
//        let randomNumber = Int.random(in: 0..<10)
//        if randomNumber % 2 == 0 {
//            let date = Calendar.current.date(byAdding: .hour, value: randomNumber, to: now)!
//            now = date
//            return date
//        } else {
//            let randomMinute = Int.random(in: 0...60)
//            let date = Calendar.current.date(byAdding: .minute, value: randomMinute, to: now)!
//            now = date
//            return date
//        }
//    }
//
//    func randomMessage(allowedSenders: [UserModel]) -> CustomMessageType {
//
//        let randomNumberSender = Int.random(in: 0..<allowedSenders.count)
//
//        let uniqueID = String(NSUUID().uuidString.prefix(4))
//        let sender = allowedSenders[randomNumberSender]
//        let date = dateAddingRandomTime()
//
//        let i = Int.random(in: 0..<3)
//        switch i {
//        case 0:
//            let randomSentence = "Someone left the conversation"
//            return SystemMessage(content: randomSentence)
//        case 1:
//            return UserMessage(messageId: uniqueID, content: Lorem.sentence(), sentDate: date, sender: sender, response: nil)
//        case 2:
//            return UserMessage(messageId: uniqueID, content: Lorem.sentence(), sentDate: date, sender: sender, response: Lorem.sentence())
//        default:
//            fatalError("Out of bounds")
//        }
//    }
//
//    func getAdvancedMessages(count: Int, completion: ([CustomMessageType]) -> Void) {
//        var messages: [CustomMessageType] = []
//        for _ in 0..<count {
//            let message = randomMessage(allowedSenders: senders)
//            messages.append(message)
//        }
//        completion(messages)
//    }
//}

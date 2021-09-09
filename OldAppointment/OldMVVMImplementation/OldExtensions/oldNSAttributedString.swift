////
////  NSAttributedString.swift
////  appointment
////
////  Created by Dylan Barteling on 05/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import Nuke
//
//extension String {
//    
//    func replaceEmoji(with font: UIFont, emojis: [EmojiModel.Datum.Emoji], version: Int) -> NSMutableAttributedString {
//        let mutableString = NSMutableAttributedString(string: self, attributes: [.font: font])
//        return mutableString.replaceEmoji(emojis: emojis, version: version)
//    }
//}
//
//extension NSMutableAttributedString {
//    
//    func replaceEmoji(emojis: [EmojiModel.Datum.Emoji], version: Int) -> NSMutableAttributedString {
//        guard let dict = UserDefaults.standard.dictionary(forKey: "emoji.version.\(version)") as? [String: Data] else {
//            print("Couldn't find emojis with version:", version)
//            return self
//        }
//        emojis.forEach { emoji in
//            do {
//                let regex = try NSRegularExpression(pattern: emoji.code)
//                let range = NSRange(location: 0, length: self.string.count)
//                regex.matches(in: self.string, options: [], range: range).forEach { item in
//                    let imageAttachment = NSTextAttachment()
//                    if let imageData = dict[emoji.code],
//                        let image = UIImage(data: imageData, scale: 1.0) {
//                        image.accessibilityIdentifier = emoji.code
//                        imageAttachment.image = image
//                        let imageString = NSAttributedString(attachment: imageAttachment)
//                        if range.intersection(item.range) != nil {
//                            self.replaceCharacters(in: item.range, with: imageString)
//                        } else {
//                            print("\(item.range) not in", range)
//                        }
//                    } else {
//                        print("Couldn't find:", emoji.code)
//                    }
//                }
//            } catch {
//                print(error)
//            }
//        }
//        return self
//    }
//    
//    /// Replace only first word @{messageId} to bold and blue
//    ///
//    /// - Parameters:
//    ///   - attrString: The attributed string
//    ///   - messages: The messages with ids
//    /// - Returns: Retruns the attributedString with @{messageId} to bold and blue
//    func replaceFirstReply(messages: [CustomMessageType]) -> NSMutableAttributedString {
//        let attributes: [NSAttributedString.Key: Any] = [
//            NSAttributedString.Key.font: R.font.openSansBold(size: 16)!,
//            NSAttributedString.Key.foregroundColor: R.color.appBlue()!
//        ]
//        
//        guard self.string.starts(with: "@") else { return self }
//        let words = self.string.split(separator: " ")
//        guard let first = words.first else { return self }
//        messages.forEach {
//            let id = $0.asMessageType().messageId
//            guard first == "@\(id)" else { return }
//            
//            let tagString = NSAttributedString(string: String(first), attributes: attributes)
//            self.replaceCharacters(in: NSRange(location: 0, length: first.count), with: tagString)
//        }
//        return self
//    }
//    
//    /// Replace every @{messageId} to bold and blue
//    ///
//    /// - Parameters:
//    ///   - attrString: The attributed string
//    ///   - messages: The messages with ids
//    /// - Returns: Retruns the attributedString with @{messageId} to bold and blue
//    func replaceReply(messages: [CustomMessageType]) -> NSMutableAttributedString {
//        let attributes: [NSAttributedString.Key: Any] = [
//            NSAttributedString.Key.font: R.font.openSansBold(size: 16)!,
//            NSAttributedString.Key.foregroundColor: R.color.appBlue()!
//        ]
//        
//        messages.forEach {
//            let id = $0.asMessageType().messageId
//            let pattern = "@\(id)\\b"
//            do {
//                let regex = try NSRegularExpression(pattern: pattern)
//                guard let item = regex.firstMatch(in: self.string, options: [], range: NSRange(location: 0, length: self.string.count)) else { return }
//                
//                let string = String(self.string[Range(item.range, in: self.string)!])
//                let tagString = NSAttributedString(string: string, attributes: attributes)
//                
//                self.replaceCharacters(in: item.range, with: tagString)
//            } catch {
//                print(error)
//            }
//        }
//        return self
//    }
//    
//    func replaceFirstReply() -> NSMutableAttributedString {
//        let attributes: [NSAttributedString.Key: Any] = [
//            NSAttributedString.Key.font: R.font.openSansBold(size: 16)!,
//            NSAttributedString.Key.foregroundColor: R.color.appBlue()!
//        ]
//
//        let pattern = "@\\w+"
//        do {
//            let tag = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
//            if let match = tag.firstMatch(in: self.string, options: [], range: NSRange(location: 0, length: self.string.count)) {
//                self.addAttributes(attributes, range: match.range)
//            } else {
//                print("Message with reply should start with an @")
//            }
//        } catch {
//            print(error)
//        }
//        return self
//    }
//}

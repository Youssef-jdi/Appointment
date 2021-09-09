//
//  EmojiModel.swift
//  appointment
//
//  Created by Dylan Barteling on 05/04/2019.
//  Copyright © 2019 DTT. All rights reserved.
//

import Foundation

struct EmojiModel: Codable {
    let data: Datum
    
    struct Datum: Codable {
        let version: Int
        let categories: [Category]
        
        struct Category: Codable {
            let name: String
            let emojis: [Emoji]
        }
        
        struct Emoji: Codable {
            let code, url: String
        }
    }
}

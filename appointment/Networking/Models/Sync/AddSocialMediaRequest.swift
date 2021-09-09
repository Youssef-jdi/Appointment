//
//  AddSocialMediaReqeust.swift
//  appointment
//
//  Created by Rachel Polachova on 20/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct AddSocialMediaReqeust: Encodable {
    let facebookId: String
    let outlookId: String
    let googleId: String
    let yahooId: String
    let androidId: String
    
    enum CodingKeys: String, CodingKey {
        case facebookId = "facebook_id"
        case outlookId = "outlook_id"
        case googleId = "google_id"
        case yahooId = "yahoo_id"
        case androidId = "android_id"
    }
}

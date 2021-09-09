////
////  FacebookTarget.swift
////  appointment
////
////  Created by Dylan Barteling on 25/02/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import p2_OAuth2
//
//struct FacebookTarget: AuthTargetType {
//    
//    var grant: OAuth2 {
//        return OAuth2CodeGrant(settings: settings)
//    }
//    
//    var isEmbedded: Bool {
//        return true
//    }
//    
//    var settings: OAuth2JSON {
//        return [
//            "client_id": "1714341122155754",
//            "client_secret": "a2dd01ba4f412230f37c6ebcd7f5ce7b",
//            "authorize_uri": "https://www.facebook.com/v3.2/dialog/oauth",
//            "token_uri": "https://graph.facebook.com/v3.2/oauth/access_token",
//            "scope": "public_profile,email,user_friends",
//            "redirect_uris": ["fb1714341122155754://authorize/"],
//            "response_type": "code",
//            "verbose": true
//        ]
//    }
//}

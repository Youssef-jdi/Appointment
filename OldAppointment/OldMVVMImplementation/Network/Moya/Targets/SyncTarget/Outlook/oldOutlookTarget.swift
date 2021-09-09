////
////  OutlookTarget.swift
////  appointment
////
////  Created by Callum Trounce on 25/02/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import p2_OAuth2
//
//struct OutlookTarget: AuthTargetType {
//    var settings: OAuth2JSON {
//        return [
//            "client_id": "aeddcd13-1241-45c7-b4ce-12af702b66c7",
//            "authorize_uri": "https://login.microsoftonline.com/common/oauth2/v2.0/authorize",
//            "token_uri": "https://login.microsoftonline.com/common/oauth2/v2.0/token",
//            "scope": "openid profile offline_access User.Read Contacts.Read",
//            "redirect_uris": ["appointment://oauth2/callback"],
//            "response_type": "code",
//            "verbose": true
//        ]
//    }
//    
//    var isEmbedded: Bool {
//        return true
//    }
//    
//    var grant: OAuth2 {
//         return OAuth2CodeGrant(settings: settings)
//    }
//}

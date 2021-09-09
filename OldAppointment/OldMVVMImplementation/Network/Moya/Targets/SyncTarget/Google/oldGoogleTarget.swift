////
////  GoogleTarget.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 26/02/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import p2_OAuth2
//
//struct GoogleTarget: AuthTargetType {
//    var settings: OAuth2JSON {
//        return [
//            "response_type": "code token id_token",
//            "client_id": "984897590199-1s9gc5fc08niddvk3p266fhnf58d3og8.apps.googleusercontent.com",
//            "token_uri": "https://oauth2.googleapis.com/token",
//            "scope": "openid email profile https://www.googleapis.com/auth/contacts",
//            "authorize_uri": "https://accounts.google.com/o/oauth2/v2/auth",
//            "redirect_uris": ["nl.dtt.appointment:/oauth2callback"],
//            "state": "pass-through value",
//            "verbose": true
//        ]
//    }
//
//    var isEmbedded: Bool {
//        return true
//    }
//
//    var grant: OAuth2 {
//        return OAuth2CodeGrant(settings: settings)
//    }
//}

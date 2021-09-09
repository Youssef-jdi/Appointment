////
////  YahooTarget.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 23.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//import p2_OAuth2
//
//struct YahooTarget: AuthTargetType {
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
//            "response_type": "token",
//            "client_id": "dj0yJmk9REpYTXA3ckdOTVg5JnM9Y29uc3VtZXJzZWNyZXQmc3Y9MCZ4PTJi",
//            "client_secret": "666116a131f5f28feebca5f11fa238da6857415e",
//            "authorize_uri": "https://api.login.yahoo.com/oauth2/request_auth",
//            "token_uri": "https://api.login.yahoo.com/oauth2/get_token",
//            "scope": "sdct-r",
//            "grant_type": "authorization_code",
//            "redirect_uris": ["https://appointmentapp.page.link/redirect_uri"],
//            "verbose": true
//        ]
//    }
//}

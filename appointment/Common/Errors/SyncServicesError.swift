//
//  OutlookServiceError.swift
//  appointment
//
//  Created by Rachel Polachova on 20/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import p2_OAuth2

enum OutlookServiceError: AppError {
    case generic
    case underlying(Error)
    
    var title: String {
        return "Ooops"
    }
    
    var localizedDescription: String {
        switch self {
        case .generic:
            return "Something went wrong."
        case .underlying(let error):
            return error.localizedDescription
        }
    }
}

enum YahooError: Error {
    case generic
    case underyling(Error)
    case login(OAuth2Error)
}

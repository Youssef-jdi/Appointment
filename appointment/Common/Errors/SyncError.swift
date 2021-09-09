//
//  SyncError.swift
//  appointment
//
//  Created by Rachel Polachova on 06/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum SyncError: AppError {
    
    case generic(Error?)
    
    var title: String {
        switch self {
        case .generic:
            return "Ooops"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .generic(let error):
            return error?.localizedDescription ?? "Something went wrong."
        }
    }
}

enum SyncServiceError: AppError {
    
    var title: String {
        switch self {
        case .facebookError:
            return "Facebook sync failed"
        case .googleError:
            return "Google sync failed"
        case .outlookError:
            return "Outlook sync failed"
        case .deviceError:
            return "Device sync failed"
        case .yahooError:
            return "Yahoo sync failed"
        case .generic, .underlying, .uploadError:
            return "Ooops"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .facebookError(let error):
            return error.localizedDescription
        case .googleError(let error):
            return error.localizedDescription
        case .deviceError(let error):
            return error.localizedDescription
        case .outlookError(let error):
            return error.localizedDescription
        case .underlying(let error):
            return error.localizedDescription
        case .yahooError(let error):
            return error.localizedDescription
        case .generic:
            return "Something went wrong"
        case .uploadError:
            return "We weren't able to upload you data to server."
        }
    }
    
    case facebookError(Error)
    case googleError(Error)
    case outlookError(Error)
    case deviceError(Error)
    case yahooError(Error)
    case generic
    case underlying(Error)
    case uploadError
}

//
//  DatabaseSyncError.swift
//  appointment
//
//  Created by Raluca Mesterca on 30/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum DatabaseSyncError: AppError {
    case generic
    case underlying(Error)

    var title: String {
        return "Oops!"
    }

    var localizedDescription: String {
        switch self {
        case .generic:
            return R.string.localizable.databaseSyncError().capitalizingFirstLetter()
        case .underlying(let error):
            return error.localizedDescription
        }
    }
}

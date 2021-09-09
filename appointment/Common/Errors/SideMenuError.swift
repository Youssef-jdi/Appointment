//
//  SideMenuError.swift
//  appointment
//
//  Created by Rachel Polachova on 28/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum SideMenuError: AppError {
    
    case authNeeded
    
    var title: String {
        switch self {
        case .authNeeded:
            return "You are not logged in"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .authNeeded:
            return "Authentication is needed to continue."
        }
    }
}

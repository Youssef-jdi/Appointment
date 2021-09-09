//
//  AppointmentError.swift
//  appointment
//
//  Created by Irina Filkovskaya on 02.07.2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum AppointmentError: AppError {
    case noDates

    var title: String {
        return "Oops!"
    }
    
    var localizedDescription: String {
        switch self {
        case .noDates:
            return "No dates found in the appointment."
        }
    }
}

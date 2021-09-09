//
//  SelectDateError.swift
//  appointment
//
//  Created by Tran Gia Huy on 25/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum SelectDateError: AppError {
    case restrictedAccessToModifyAppointment

    var title: String {
        switch self {
        case .restrictedAccessToModifyAppointment:
            // TODO: localize
            return "You must be the admin/creator of the appointment to be able to change the day."
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .restrictedAccessToModifyAppointment:
            return ""
        }
    }
}

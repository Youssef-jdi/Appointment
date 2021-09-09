//
//  MultipleButtonType.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/2/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

enum MultipleButtonType {
    case newAppointment
    case sendMessage

    var cellLabel: [String] {
        switch self {
        case .newAppointment:
            return ["STANDAARD", "ZAKELIJK", "GROEP", "MIJN POST-IT", "POST-IT NAAR..."]
        case .sendMessage:
            return ["STUUR BERICHT", "START VERGADERING", "HANGOUTS", "MESSENGER", "SMS"]
        }
    }

    var cellImage: [UIImage?] {
        switch self {
        case .newAppointment:
            return [R.image.blue_pin(), R.image.menu_Business(), R.image.menu_Group(), R.image.mom_Icon_Yellow(), R.image.memoTo_Icon_Yellow()]
        case .sendMessage:
            return [R.image.group(), R.image.group(), R.image.group(), R.image.group(), R.image.group()]
        }
    }

    var mainImage: UIImage? {
        switch self {
        case .newAppointment:
            return R.image.popUp_New_Appointment()
        case .sendMessage:
            return R.image.popUp_send_reminder()
        }
    }
}

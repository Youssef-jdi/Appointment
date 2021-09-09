//
//  EventType.swift
//  appointment
//
//  Created by Raluca Mesterca on 01/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum EventType: Int, Codable {
    case unknown = 0 //api starts from 1
    case newAppointment
    case editAppointment
    case deleteAppointment
    case newToDoList
    case deleteToDoList
    case appointmentInvited
    case appointmentCancelled
    case attachmentAdded
    case attachmentDeleted
    case finalDate
    case newChat
    case rejectedAppointment
    case unknown13
    case replyRemind
}

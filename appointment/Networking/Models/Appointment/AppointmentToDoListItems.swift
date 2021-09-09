//
//  AppointmentToDoListItems.swift
//  appointment
//
//  Created by Raluca Mesterca on 29/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct ToDo: Codable {
    let id: Int?
    let appointmentId: Int?
    let description: String
    let completed: Int

    var done: Bool {
        switch completed {
        case 0:
            return false
        case 1:
            return true
        default:
            return false
        }
    }

    enum CodingKeys: String, CodingKey {
        case id = "to_do_id"
        case appointmentId = "appointment_id"
        case description, completed
    }
}

// MARK: Map from database entity
extension ToDo {

    static func map(from entity: ToDoListEntity?) -> ToDo? {
        guard let entity = entity else { return nil }

        return ToDo(
            id: Int(entity.id),
            appointmentId: Int(entity.appointmentId),
            description: entity.description,
            completed: Int(entity.completed))
    }
}

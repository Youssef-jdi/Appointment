//
//  AppointmentAttachment.swift
//  appointment
//
//  Created by Raluca Mesterca on 29/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct Attachment: Codable {
    let id: String
    let path: String

    enum CodingKeys: String, CodingKey {
        case id = "attachment_id"
        case path = "attachment"
    }
}

// MARK: Map from database entity
extension Attachment {

    static func map(from entity: AttachmentEntity?) -> Attachment? {
        guard let entity = entity else { return nil }
        guard let id = entity.id, let path = entity.path else { return nil }
        return Attachment(id: id, path: path)
    }
}

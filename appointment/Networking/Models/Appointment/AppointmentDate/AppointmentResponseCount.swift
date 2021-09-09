//
//  AppointmentResponseCount.swift
//  appointment
//
//  Created by Raluca Mesterca on 29/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

// Naming is terrible, but keeping API convention
struct ResponseCount: Codable, Equatable {
    let unknown: Int
    let unavailable: Int
    let available: Int
    let unsure: Int

    enum CodingKeys: String, CodingKey {
        case unknown, unsure, available
        case unavailable = "un-available"
    }
}

// MARK: Map from database entity
extension ResponseCount {

    static func map(from entity: ResponseCountEntity?) -> ResponseCount? {
        guard let entity = entity else { return nil }
        return ResponseCount(
            unknown: Int(entity.unknown),
            unavailable: Int(entity.unavailable),
            available: Int(entity.available),
            unsure: Int(entity.unsure))
    }
}

//
//  DataContainer.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

struct DataContainer<T: Codable>: Codable {
    let data: T
}

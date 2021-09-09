//
//  LocationModel.swift
//  appointment
//
//  Created by Onur Hüseyin Çantay on 6.03.2019.
//  Copyright © 2019 DTT. All rights reserved.
//

import Foundation

struct LocationModel: Codable {
    let country, region, locality, thoroughfare: String
    let postalCode: String
    let latitude, longitude: Double
}

//
//  BaseUrl.swift
//  appointment
//
//  Created by Raluca Mesterca on 12/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum BaseURL {
//struct BaseURL {
    // apparently no staging yet as the API was made in 2013 when staging wasn't a thing o.O

    static let apiURL = URL(string: "https://appointment.docker-dev.d-tt.nl/api")!
    static let loginURL = URL(string: "https://appointment.docker-dev.d-tt.nl/api/auth/login")!
}

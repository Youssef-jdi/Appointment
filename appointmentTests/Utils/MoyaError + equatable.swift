//
//  MoyaError + equatable.swift
//  appointmentTests
//
//  Created by Raluca Mesterca on 02/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Moya

extension MoyaError: Equatable {

    public static func == (lhs: MoyaError, rhs: MoyaError) -> Bool {
        return lhs.errorDescription == rhs.errorDescription
            && lhs.response == rhs.response
    }
}

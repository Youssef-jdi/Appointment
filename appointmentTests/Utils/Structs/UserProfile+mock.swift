//
//  UserProfile+mock.swift
//  appointmentTests
//
//  Created by Raluca Mesterca on 16/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
@testable import appointment

extension UserProfile: Equatable {
    public static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        return lhs.userId == rhs.userId
            && lhs.lastName == rhs.lastName
            && lhs.firstName == rhs.firstName
    }
}

extension UserProfile {

    static func mock() -> UserProfile {
        return UserProfile(
            userId: 212,
            firstName: "User",
            lastName: "Name",
            email: "ra@ra.ra",
            image: "google.com",
            password: "$2y$10$XaWHV4g6Y/ClXGGEtxslk.GZJqlCOr15m/DMWluSixKvxlyny.CzW",
            credits: 765,
            isRegistered: 1,
            isBanned: 0,
            createdAt: "2019-01-03",
            registeredAt: "2019-01-03",
            updatedAt: "2019-01-03",
            businessProfile: BusinessProfile.mock())
    }
}

extension BusinessProfile {
    static func mock() -> BusinessProfile {
        return BusinessProfile(
            userID: 212,
            kvk: "kvk",
            function: "CTO",
            address: "DTT",
            zipCodeCity: "")
    }
}

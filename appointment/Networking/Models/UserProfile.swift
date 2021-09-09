//
//  ProfileResponse.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/26/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct UserProfile: Codable {
    let userId: Int
    let firstName: String?
    let lastName: String?
    let email: String?
    let image: String?
    let password: String?
    let credits, isRegistered, isBanned: Int?
    let createdAt, registeredAt, updatedAt: String?
    let businessProfile: BusinessProfile?

    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case image = "image_url"
        case password, credits
        case isRegistered = "is_registered"
        case isBanned = "is_banned"
        case createdAt = "created_at"
        case registeredAt = "registered_at"
        case updatedAt = "updated_at"
        case businessProfile = "business_profile"
    }

    static func map(from entity: CurrentUserEntity) -> UserProfile {
        return UserProfile(
            userId: Int(entity.userId),
            firstName: entity.firstName,
            lastName: entity.lastName,
            email: entity.email,
            image: entity.imageUrl,
            password: entity.password,
            credits: Int(entity.credits),
            isRegistered: Int(entity.isRegistered),
            isBanned: Int(entity.isBanned),
            createdAt: entity.createdAt,
            registeredAt: entity.registeredAt,
            updatedAt: entity.updatedAt,
            businessProfile: BusinessProfile.map(from: entity.businessProfile))
    }
}

// MARK: - BusinessProfile
struct BusinessProfile: Codable {
    let userID: Int?
    let kvk, function, address, zipCodeCity: String?

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case kvk, function, address
        case zipCodeCity = "zip_code_city"
    }

    static func map(from entity: BusinessProfileEntity?) -> BusinessProfile? {
        guard let entity = entity else { return nil }
        return BusinessProfile(
            userID: Int(entity.userId),
            kvk: entity.kvk,
            function: entity.function,
            address: entity.address,
            zipCodeCity: entity.zipCodeCity)
    }
}

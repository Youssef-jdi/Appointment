//
//  GmailContactsResponse.swift
//  appointment
//
//  Created by Rachel Polachova on 06/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

// MARK: - GmailContactsResponse
struct GmailContactsResponse: Codable {
    let version, encoding: String
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let xmlns, xmlnsOpenSearch, xmlnsBatch, xmlnsGd: String
    let xmlnsGContact: String
    let gdEtag: String
    let id, updated: ID
    let category: [Category]
    let title: ID
    let link: [Link]
    let author: [Author]
    let generator: Generator
    let openSearchTotalResults, openSearchStartIndex, openSearchItemsPerPage: ID
    let entry: [Entry]?

    enum CodingKeys: String, CodingKey {
        case xmlns
        case xmlnsOpenSearch = "xmlns$openSearch"
        case xmlnsBatch = "xmlns$batch"
        case xmlnsGd = "xmlns$gd"
        case xmlnsGContact = "xmlns$gContact"
        case gdEtag = "gd$etag"
        case id, updated, category, title, link, author, generator
        case openSearchTotalResults = "openSearch$totalResults"
        case openSearchStartIndex = "openSearch$startIndex"
        case openSearchItemsPerPage = "openSearch$itemsPerPage"
        case entry
    }
}

// MARK: - Author
struct Author: Codable {
    let email, name: ID
}

// MARK: - ID
struct ID: Codable {
    let t: String

    enum CodingKeys: String, CodingKey {
        case t = "$t"
    }
}

// MARK: - Category
struct Category: Codable {
    let scheme, term: String
}

// MARK: - Entry
struct Entry: Codable {
    let id: ID
    let gdEtag: String
    let updated: ID
    let appEdited: AppEdited
    let category: [Category]
    let title: ID
    let link: [Link]
    let gdName: GdName?
    let gdEmail: [GdEmail]?
    let gdPhoneNumber: [GdPhoneNumber]?
    let gContactGroupMembershipInfo: [GContactGroupMembershipInfo]?
    let gContactWebsite: [GContactWebsite]?
    let content: ID?

    enum CodingKeys: String, CodingKey {
        case id
        case gdEtag = "gd$etag"
        case updated
        case appEdited = "app$edited"
        case category, title, link
        case gdName = "gd$name"
        case gdEmail = "gd$email"
        case gdPhoneNumber = "gd$phoneNumber"
        case gContactGroupMembershipInfo = "gContact$groupMembershipInfo"
        case gContactWebsite = "gContact$website"
        case content
    }
}

// MARK: - AppEdited
struct AppEdited: Codable {
    let xmlnsApp: String
    let t: String

    enum CodingKeys: String, CodingKey {
        case xmlnsApp = "xmlns$app"
        case t = "$t"
    }
}

// MARK: - GContactGroupMembershipInfo
struct GContactGroupMembershipInfo: Codable {
    let deleted: String
    let href: String
}

// MARK: - GContactWebsite
struct GContactWebsite: Codable {
    let href: String
    let rel: String
}

// MARK: - GdEmail
struct GdEmail: Codable {
    let address: String
    let primary: String?
    let rel: String?
    let label: String?
}

// MARK: - GdName
struct GdName: Codable {
    let gdFullName: ID
    let gdGivenName, gdFamilyName, gdAdditionalName: ID?

    enum CodingKeys: String, CodingKey {
        case gdFullName = "gd$fullName"
        case gdGivenName = "gd$givenName"
        case gdFamilyName = "gd$familyName"
        case gdAdditionalName = "gd$additionalName"
    }
}

// MARK: - GdPhoneNumber
struct GdPhoneNumber: Codable {
    let rel: String
    let uri: String?
    let t: String
    let primary: String?

    enum CodingKeys: String, CodingKey {
        case rel, uri
        case t = "$t"
        case primary
    }
}

// MARK: - Link
struct Link: Codable {
    let rel: String
    let type: TypeEnum
    let href: String
    let gdEtag: String?

    enum CodingKeys: String, CodingKey {
        case rel, type, href
        case gdEtag = "gd$etag"
    }
}

enum TypeEnum: String, Codable {
    case applicationAtomXML = "application/atom+xml"
    case image = "image/*"
    case textHTML = "text/html"
}

// MARK: - Generator
struct Generator: Codable {
    let t: String
    let uri: String
    let version: String

    enum CodingKeys: String, CodingKey {
        case t = "$t"
        case uri, version
    }
}

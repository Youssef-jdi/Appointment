//
//  YahooContactsResponse.swift
//  appointment
//
//  Created by Rachel Polachova on 19/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct YahooContactsResponse: Decodable {
    let contacts: YahooContacts
    
    struct YahooContacts: Decodable {
        let start: Int
        let count: Int
        let total: Int
        let uri: String
        let contact: [Contact]
        
        struct Contact: Decodable {
            let uri: String
            let created: String
            let updated: String
            let isConnection: Bool
            let id: Int
            let fields: [YahooContactField]
            let categories: [YahooContactCategories]
            
            struct YahooContactField: Decodable {
                let uri: String
                let created: String
                let updated: String?
                let id: Int
                let type: String
                var value: YahooContactValue?
                let editedBy: String?
                
                init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    
                    let type = try container.decode(YahooContactValue.YahooValueType.self, forKey: .type)
                    switch type {
                    case .address:
                        let value = try container.decode(YahooContactValue.YahooAddress.self, forKey: .value)
                        self.value = .address(value)
                    case .anniversary:
                        let value = try container.decode(YahooContactValue.YahooDate.self, forKey: .value)
                        self.value = .anniversary(value)
                    case .birthday:
                        let value = try container.decode(YahooContactValue.YahooDate.self, forKey: .value)
                        self.value = .birthday(value)
                    case .company:
                        let value = try container.decode(String.self, forKey: .value)
                        self.value = .company(value)
                    case .custom:
                        let value = try container.decode(String.self, forKey: .value)
                        self.value = .custom(value)
                    case .email:
                        let value = try container.decode(String.self, forKey: .value)
                        self.value = .email(value)
                    case .jobTitle:
                        let value = try container.decode(String.self, forKey: .value)
                        self.value = .jobTitle(value)
                    case .link:
                        let value = try container.decode(String.self, forKey: .value)
                        self.value = .link(value)
                    case .name:
                        let value = try container.decode(YahooContactValue.YahooName.self, forKey: .value)
                        self.value = .name(value)
                    case .nickname:
                        let value = try container.decode(String.self, forKey: .value)
                        self.value = .nickname(value)
                    case .notes:
                        let value = try container.decode(String.self, forKey: .value)
                        self.value = .notes(value)
                    case .phone:
                        let value = try container.decode(String.self, forKey: .value)
                        self.value = .phone(value)
                    }
                    
                    self.uri = try container.decode(String.self, forKey: .uri)
                    self.created = try container.decode(String.self, forKey: .created)
                    self.updated = try container.decode(String.self, forKey: .updated)
                    self.id = try container.decode(Int.self, forKey: .id)
                    self.type = try container.decode(String.self, forKey: .type)
                    self.editedBy = try container.decode(String.self, forKey: .editedBy)
                }
                
                enum CodingKeys: String, CodingKey {
                    case value, type, uri, created, updated, id, editedBy, isConnection
                }
                
                enum YahooContactValue {
                    
                    case address(YahooAddress)
                    case name(YahooName)
                    case custom(String)
                    case notes(String)
                    case link(String)
                    case jobTitle(String)
                    case phone(String)
                    case birthday(YahooDate)
                    case nickname(String)
                    case email(String)
                    case company(String)
                    case anniversary(YahooDate)
                    
                    enum YahooValueType: String, Decodable {
                        case address, name, custom, notes, link, jobTitle, phone, birthday, nickname, email, company, anniversary
                    }
                    
                    struct YahooAddress: Decodable {
                        let city: String
                        let country: String
                        let countryCode: String
                        let postalCode: String
                        let stateOrProvince: String
                    }
                    
                    struct YahooName: Decodable {
                        let familyName: String
                        let givenName: String
                        let middleName: String
                        let prefix: String
                        let suffix: String
                    }
                    
                    struct YahooDate: Decodable {
                        let day: String
                        let month: String
                        let year: String
                    }
                }
            }
            
            struct YahooContactCategories: Decodable {
                let uri: String
                let created: String
                let updated: String
                let id: Int
                let name: String
            }
        }
    }
}

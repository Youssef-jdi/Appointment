//
//  OutlookContactsResponse.swift
//  appointment
//
//  Created by Rachel Polachova on 12/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct OutlookContactsResponse: Decodable {
    let context: String
    let value: [OutlookContactsValue]
    
    struct OutlookContactsValue: Decodable {
        let givenName: String
        let id: String
        let etag: String
        let surname: String
        let emailAddresses: [OutlookEmail]
        
        enum CodingKeys: String, CodingKey {
            case etag = "@odata.etag"
            case givenName, id, surname, emailAddresses
        }
        
        struct OutlookEmail: Decodable {
            let name: String
            let address: String
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case context = "@odata.context"
        case value
    }
}

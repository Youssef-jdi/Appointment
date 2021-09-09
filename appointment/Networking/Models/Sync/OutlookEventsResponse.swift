//
//  OutlookEventsResponse.swift
//  appointment
//
//  Created by Rachel Polachova on 12/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct OutlookEventsResponse: Decodable {
    let dataContext: String
    let value: [OutlookEventValue]
    
    struct OutlookEventValue: Decodable {
        let id: String
        let subject: String
        let etag: String
        let start, end: OutlookDate
        
        enum CodingKeys: String, CodingKey {
            case etag = "@odata.etag"
            case id, subject, start, end
        }
    }
    
    struct OutlookDate: Decodable {
        let dateTime: String
        let timeZone: String
    }
    
    enum CodingKeys: String, CodingKey {
        case dataContext = "@odata.context"
        case value
    }
}

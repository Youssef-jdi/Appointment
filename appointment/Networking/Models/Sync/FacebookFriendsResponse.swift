//
//  FacebookFriendsResponse.swift
//  appointment
//
//  Created by Rachel Polachova on 06/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

struct FacebookFriendsResponse: Decodable {
    let data: [FacebookData]
    
    struct FacebookData: Decodable {
        let id: String
        let name: String
        let picture: FacebookPicture
        
        struct FacebookPicture: Decodable {
            let data: FacebookPictureData
            
            struct FacebookPictureData: Decodable {
                let url: String
            }
        }
    }
    
    struct FacebookSummary: Decodable {
        let totalCount: Int
    }
    
    struct FacebookPaging: Decodable {
        let after: String
        let before: String
    }
}

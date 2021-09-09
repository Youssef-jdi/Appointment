//
//  CreditsProduct.swift
//  appointment
//
//  Created by Onur Hüseyin Çantay on 14.03.2019.
//  Copyright © 2019 DTT. All rights reserved.
//

import Foundation

struct CreditModels: Codable {
    let credits: [Credit]
}

struct Credit: Codable {
    let amount: Int
    let localizedPrice: String
    
    init(amount: Int, localizedPrice: String) {
        self.amount = amount
        self.localizedPrice = localizedPrice
    }
}

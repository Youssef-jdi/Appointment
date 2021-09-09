//
//  Encodable + Dictionary.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/21/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

extension Encodable {
    
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { throw NSError() }
        return dictionary
    }
}

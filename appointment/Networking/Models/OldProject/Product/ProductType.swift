//
//  ProductType.swift
//  appointment
//
//  Created by Onur Hüseyin Çantay on 14.03.2019.
//  Copyright © 2019 DTT. All rights reserved.
//

import Foundation

enum ProductType: Codable {
    case theme(ThemeProductModel)
    case background(BackgroundProductModel)
    
    enum CodingKeys: String, CodingKey {
        case theme, background
    }
    
    enum PostTypeCodingError: Error {
        case decoding(String)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .background(let background):
            try container.encode(background, forKey: .background)
        case .theme(let theme):
            try container.encode(theme, forKey: .theme)
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? container.decode(ThemeProductModel.self, forKey: .theme) {
            self = .theme(value)
            return
        }
        if let value = try? container.decode(BackgroundProductModel.self, forKey: .background) {
            self = .background(value)
            return
        }
        throw PostTypeCodingError.decoding("Wasn't able to decode)")
    }
}

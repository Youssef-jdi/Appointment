//
//  ThemeProductModel.swift
//  appointment
//
//  Created by Onur Hüseyin Çantay on 14.03.2019.
//  Copyright © 2019 DTT. All rights reserved.
//

import Foundation

struct ThemeProductModel: Codable {
    let imageURL: String?
    let firstColor: String
    let highlightColor: String
    
    init(imageUrl: String? = "", firstColor: String, highlightColor: String) {
        self.firstColor = firstColor
        self.highlightColor = highlightColor
        self.imageURL = imageUrl
    }
}

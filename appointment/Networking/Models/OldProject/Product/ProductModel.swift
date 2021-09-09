//swiftlint:disable orphaned_doc_comment
////
////  ProductModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 14.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//struct ProductsModel: Codable {
//    var products: [ProductModel]
//}
//struct ProductModel: Codable {
//    let id: Int
//    let type: ProductType
//    let price: Credit
//    var owned: Bool
//    let name: String
//
//    var cellType: UpgradeCellState {
//        switch type {
//        case .background:
//            return .background(owned)
//        case .theme:
//            return .theme(owned)
//        }
//    }
//
//    init(id: Int, type: ProductType, price: Credit, owned: Bool, name: String) {
//        self.id = id
//        self.type = type
//        self.price = price
//        self.owned = owned
//        self.name = name
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case type, price, name, owned, id
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(type, forKey: .type)
//        try container.encode(price, forKey: .price)
//        try container.encode(name, forKey: .name)
//        try container.encode(owned, forKey: .owned)
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(Int.self, forKey: .id)
//        type = try container.decode(ProductType.self, forKey: .type)
//        price = try container.decode(Credit.self, forKey: .price)
//        name = try container.decode(String.self, forKey: .name)
//        owned = try container.decode(Bool.self, forKey: .owned)
//    }
//}
//
//extension ProductModel {
//
//    var backgroundColor: UIColor? {
//        switch type {
//        case .theme(let product):
//            return UIColor(hexString: product.firstColor)
//        default: return nil
//        }
//    }
//
//    var backgroundImageUrl: String? {
//        switch type {
//        case .theme(let product):
//            return product.imageURL
//        case .background(let product):
//            return product.imageURL
//        }
//    }
//
//    var firstColor: UIColor? {
//        switch type {
//        case .theme(let product):
//            return UIColor(hexString: product.firstColor)
//        default: return nil
//        }
//    }
//
//    var highlightColor: UIColor? {
//        switch type {
//        case .theme(let product):
//            return UIColor(hexString: product.highlightColor)
//        default: return nil
//        }
//    }
//}

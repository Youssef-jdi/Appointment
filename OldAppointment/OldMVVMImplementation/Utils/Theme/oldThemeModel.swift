////
////  ThemeModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 2.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import UIKit
//struct Theme: Codable {
//    var id: Int
//    var navigationBarTranslucent: Bool
//    var statusBarBackgroundHex: String
//    var backgroundHex: String
//    var headerAndButtonBackgroundHex: String
//    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case navigationBarTranslucent = "isTranclucent"
//        case statusBarBackgroundHex = "statusBarBackgroundColor"
//        case backgroundHex = "backgroundColor"
//        case headerAndButtonBackgroundHex = "headerAndButtonBackgroundColor"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(Int.self, forKey: .id)
//        navigationBarTranslucent = try container.decode(Bool.self, forKey: .navigationBarTranslucent)
//        statusBarBackgroundHex = try container.decode(String.self, forKey: .statusBarBackgroundHex)
//        backgroundHex = try container.decode(String.self, forKey: .backgroundHex)
//        headerAndButtonBackgroundHex = try container.decode(String.self, forKey: .headerAndButtonBackgroundHex)
//    }
//    
//}
//
//extension Theme: Themeable {
//    var backgroundColor: UIColor {
//        return .white
//    }
//    
//    var tintColor: UIColor {
//        return .white
//    }
//    
//    var navigationBarTintColor: UIColor? {
//        return .white
//    }
//    
//    var navigationTitleFont: UIFont {
//        return R.font.notoSans(size: 16)!
//    }
//    
//    var navigationTitleColor: UIColor {
//        return .white
//    }
//    
//    var headlineFont: UIFont {
//        return R.font.notoSans(size: 16)!
//    }
//    
//    var headlineColor: UIColor {
//        return .white
//    }
//    
//    var bodyTextFont: UIFont {
//        return R.font.notoSans(size: 16)!
//    }
//    
//    var bodyTextColor: UIColor {
//        return .white
//    }
//    
//    
//}

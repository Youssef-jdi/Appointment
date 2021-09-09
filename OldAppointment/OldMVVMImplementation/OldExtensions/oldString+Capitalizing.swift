////
////  String+Capitalizing.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 27.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//extension String {
//    func capitalizingFirstLetter() -> String {
//        return prefix(1).uppercased() + self.lowercased().dropFirst()
//    }
//    
//    mutating func capitalizeFirstLetter() {
//        self = self.capitalizingFirstLetter()
//    }
//    
//    func capitalizeWords() -> String {
//        return components(separatedBy: " ")
//            .map { $0.capitalizingFirstLetter() }
//            .joined(separator: " ")
//    }
//}

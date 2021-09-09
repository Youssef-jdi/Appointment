////
////  Dictionary+RemoveOptional.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 27.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//extension Dictionary {
//    
//    /// removes optional values from dictionary
//    ///
//    /// - Returns: the dectionary which has no optional
//    func removingOptionals<V>() -> [Key: V] where Value == V? {
//        return reduce(into: [Key: V]()) { result, x in
//            if let value = x.value {
//                result[x.key] = value
//            }
//        }
//    }
//}

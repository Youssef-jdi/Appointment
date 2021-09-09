////
////  String+Utils.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 27.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//extension String {
//    
//    /// Verifies whether the value of the current string is a valid email
//    ///
//    /// - Returns: true if the string is a valid email.
//    func isValidEmail() -> Bool {
//        let emailFirstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
//        let emailServerpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
//        let emailRegex = emailFirstpart + "@" + emailServerpart + "[A-Za-z]{2,6}"
//        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
//        
//        return emailPredicate.evaluate(with: self)
//    }
//}
//
//extension Optional where Wrapped == String {
//    
//    /// returns it self or an empty string
//    var orEmpty: String {
//        return self ?? ""
//    }
//}

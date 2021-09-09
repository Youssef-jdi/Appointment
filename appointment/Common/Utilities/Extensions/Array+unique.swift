//
//  Array_.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {

    func removeDuplicates() -> [Element] {
        var result: [Element] = []

        self.forEach { value in
            if !result.contains(value) {
                result.append(value)
            }
        }

        return result
    }
}

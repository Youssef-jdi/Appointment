//
//  Tutorial+mock.swift
//  appointmentTests
//
//  Created by Raluca Mesterca on 04/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import Foundation

extension Tutorial: Equatable {

    static func mock() -> Tutorial {
        return .init(title: "Tutorial Slide", description: "Tutorial Description", imageUrl: "https://static02.nyt.com/images/2016/07/02/arts/nf-obits-kahlo/nf-obits-kahlo-jumbo.jpg")
    }

    public static func == (lhs: Tutorial, rhs: Tutorial) -> Bool {
        return lhs.description == rhs.description
            && lhs.imageUrl == rhs.imageUrl
            && lhs.title == rhs.title
    }
}

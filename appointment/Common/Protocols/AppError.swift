//
//  AppError.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/14/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol AppError: Error {
    var title: String { get }
    var localizedDescription: String { get }
}

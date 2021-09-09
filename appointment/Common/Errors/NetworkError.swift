//
//  NetworkError.swift
//  appointment
//
//  Created by Irina Filkovskaya on 28.05.2020.
//  Copyright © 2020 DTT. All rights reserved.
//

enum NetworkError: AppError {
    
    case noConnection
    
    var title: String { return "Oops" }
    var localizedDescription: String { return "No internet connection. Please check your settings and try again." }
}

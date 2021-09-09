//
//  ErrorHandler.swift
//  appointment
//
//  Created by Irina Filkovskaya on 28.05.2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol ErrorHandlerProtocol {
    func handle(_ error: Error)
}

class ErrorHandler: ErrorHandlerProtocol {
        
//    private let crashlytics: CrashlyticsProtocol
    private let alertPresenter: AlertPresenterProtocol
    
    init(
//        crashlytics: CrashlyticsProtocol,
        alertPresenter: AlertPresenterProtocol
        ) {
        self.alertPresenter = alertPresenter
//        self.crashlytics = crashlytics
    }
    
    func handle(_ error: Error) {
//        crashlytics.recordError(error)
        Console.log(type: .error, error.localizedDescription)

//        guard let appError = error as? AppError else { return } // TODO: Bring back when there's always a mapping to the AppError
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertPresenter.presentAlert(
//            title: appError.title,
//            description: appError.localizedDescription, // TODO: Bring back when there's always a mapping to the AppError
            title: "Oops",
            description: error.localizedDescription,
            actions: [okAction])
    }
}

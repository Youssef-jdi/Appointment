//
//  TopViewController.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol TopViewControllerProviderProtocol {
    func topViewController() -> UIViewControllerRouting?
}

class TopViewControllerProvider: TopViewControllerProviderProtocol {

    private let application: UIApplicationProtocol

    init(application: UIApplicationProtocol) {
        self.application = application
    }

    func topViewController() -> UIViewControllerRouting? {
        return application.topViewController(controller: nil)
    }
}

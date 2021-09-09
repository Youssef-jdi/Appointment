//
//  AvailabilityOverviewRouter.swift
//  appointment
//
//  Created by Tran Gia Huy on 28/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol AvailabilityOverviewRouterProtocol {
    func set(viewController: AvailabilityOverviewViewControllerProtocol?)
    func route(to scene: AvailabilityOverviewRouter.Scene)
}

class AvailabilityOverviewRouter: AvailabilityOverviewRouterProtocol {
    
    private weak var viewController: AvailabilityOverviewViewControllerProtocol?

    enum Scene {
        case goBack
    }

    func route(to scene: Scene) {
        switch scene {
        case .goBack:
            viewController?.pop(animated: true)
        }
    }

    func set(viewController: AvailabilityOverviewViewControllerProtocol?) {
        self.viewController = viewController
    }
}

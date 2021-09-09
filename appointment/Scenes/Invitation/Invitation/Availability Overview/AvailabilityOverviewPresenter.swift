//
//  AvailabilityOverviewPresenter.swift
//  appointment
//
//  Created by Tran Gia Huy on 28/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol AvailabilityOverviewPresenterProtocol {
    func set(viewController: AvailabilityOverviewViewControllerProtocol?)
}

class AvailabilityOverviewPresenter: AvailabilityOverviewPresenterProtocol {
    private weak var viewController: AvailabilityOverviewViewControllerProtocol?

    func set(viewController: AvailabilityOverviewViewControllerProtocol?) {
        self.viewController = viewController
    }
}

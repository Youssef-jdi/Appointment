//
//  AvailabilityOverviewInteractor.swift
//  appointment
//
//  Created by Tran Gia Huy on 28/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol AvailabilityOverviewInteractorProtocol {
}

class AvailabilityOverviewInteractor: AvailabilityOverviewInteractorProtocol {
    private let presenter: AvailabilityOverviewPresenterProtocol

    init(presenter: AvailabilityOverviewPresenterProtocol) {
        self.presenter = presenter
    }
}

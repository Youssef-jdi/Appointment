//
//  InvitationSelectDatePresenter.swift
//  appointment
//
//  Created by Tran Gia Huy on 11/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol InvitationSelectDatePresenterProtocol {
    func set(viewController: InvitationSelectDateViewControllerProtocol)

    func presentSetFinalDateSuccess(_ date: AppointmentDate)
}

class InvitationSelectDatePresenter: InvitationSelectDatePresenterProtocol {

    private weak var viewController: InvitationSelectDateViewControllerProtocol?

    func set(viewController: InvitationSelectDateViewControllerProtocol) {
        self.viewController = viewController
    }

    func presentSetFinalDateSuccess(_ date: AppointmentDate) {
        viewController?.displaySelectFinalDate(date)
    }
}

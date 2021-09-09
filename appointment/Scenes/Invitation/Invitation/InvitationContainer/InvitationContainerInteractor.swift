//
//  InvitationContainerInteractor.swift
//  appointment
//
//  Created by Tran Gia Huy on 17/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol InvitationContainerInteractorProtocol {
    func handleChangeState(state: InvitationTabView.State)
    func handleViewDidLoad()
}

class InvitationContainerInteractor: InvitationContainerInteractorProtocol {

    private let presenter: InvitationContainerPresenterProtocol

    init(presenter: InvitationContainerPresenterProtocol) {
        self.presenter = presenter
    }

    func handleViewDidLoad() {
        presenter.presentInitialView(with: .outGoing)
    }

    func handleChangeState(state: InvitationTabView.State) {
        presenter.presentInitialView(with: state)
        presenter.presentContainerTabView(state)
    }
}

//
//  InvitationContainerPresenter.swift
//  appointment
//
//  Created by Tran Gia Huy on 17/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol InvitationContainerPresenterProtocol {
    func presentInitialView(with state: InvitationTabView.State)
    func presentContainerTabView(_ state: InvitationTabView.State)
    func set(viewController: InvitationContainerViewControllerProtocol)
}

class InvitationContainerPresenter: InvitationContainerPresenterProtocol {

    private weak var viewController: InvitationContainerViewControllerProtocol?
    private let invitationStoryboard: Storyboard

    init(invitationStoryboard: Storyboard) {
        self.invitationStoryboard = invitationStoryboard
    }

    func presentInitialView(with state: InvitationTabView.State) {
        switch state {
        case .outGoing:
            guard let vc = invitationStoryboard.viewController(identifier: InvitationStoryboardId.outgoing) as? OutGoingViewController else {
                return assertionFailure()
            }
            viewController?.displayChild(vc)

        case .inComing:
            guard let vc = invitationStoryboard.viewController(identifier: InvitationStoryboardId.incoming) as? InComingViewController else {
                           return assertionFailure()
                       }
            viewController?.displayChild(vc)
        }
    }

    func presentContainerTabView(_ state: InvitationTabView.State) {
        viewController?.displayContainerTabView(state, animated: true)
    }

    func set(viewController: InvitationContainerViewControllerProtocol) {
        self.viewController = viewController
    }
}

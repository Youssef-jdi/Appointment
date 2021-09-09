//
//  InvitationContainerRouter.swift
//  appointment
//
//  Created by Tran Gia Huy on 17/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol InvitationContainerRouterProtocol {
    func set(viewController: InvitationContainerViewControllerProtocol?)
    func route(to scene: InvitationContainerRouter.Scene)
}

class InvitationContainerRouter: InvitationContainerRouterProtocol {

    enum Scene {
        case showPopUp
    }

    private weak var viewController: InvitationContainerViewControllerProtocol?
    private let addPopUpStoryboard: Storyboard

    init(addPopUpStoryboard: Storyboard) {
        self.addPopUpStoryboard = addPopUpStoryboard
    }

    func route(to scene: Scene) {
        switch scene {
        case .showPopUp:
            guard let vc = addPopUpStoryboard.viewController(identifier: CustomPopUpStoryboardId.multipleButton) as? MultipleButtonAlertViewController else { return }
            vc.set(viewModel: MultipleButtonAlertViewController.ViewModel(type: .vertical, cellType: .newAppointment))
            vc.modalPresentationStyle = .overFullScreen
            viewController?.present(vc, animated: true, completion: nil)
        }
    }

    func set(viewController: InvitationContainerViewControllerProtocol?) {
        self.viewController = viewController
    }
}

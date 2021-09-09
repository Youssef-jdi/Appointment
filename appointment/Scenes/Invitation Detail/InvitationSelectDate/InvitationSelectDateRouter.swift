//
//  InvitationSelectDateRouter.swift
//  appointment
//
//  Created by Tran Gia Huy on 11/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol InvitationSelectDateRouterProtocol {
    func set(viewController: InvitationSelectDateViewControllerProtocol?)
    func route(to scene: InvitationSelectDateRouter.Scene)
}

class InvitationSelectDateRouter: InvitationSelectDateRouterProtocol {
    private weak var viewController: InvitationSelectDateViewControllerProtocol?
    private let popupStoryboard: Storyboard

    init(popupStoryboard: Storyboard) {
        self.popupStoryboard = popupStoryboard
    }

    enum Scene {
        case goBack
        case chooseDate(date: AppointmentDateViewModel, delegate: CustomPopupWithTwoButtonsDelegate)
    }

    func set(viewController: InvitationSelectDateViewControllerProtocol?) {
        self.viewController = viewController
    }

    func route(to scene: InvitationSelectDateRouter.Scene) {
        switch scene {
        case .goBack:
            viewController?.pop(animated: true)
        case .chooseDate(let date, let delegate):
            guard let vc = popupStoryboard.viewController(identifier: CustomPopUpStoryboardId.twoButton) as? CustomPopupWithTwoButtonsViewController else { return }

            vc.set(popupType: .dateConfirmed(date: date))
            vc.set(delegate: delegate)

            vc.modalPresentationStyle = .overCurrentContext

            viewController?.present(vc, animated: false, completion: nil)
        }
    }
}

//
//  ChatRouter.swift
//  appointment
//
//  Created by Tran Gia Huy on 30/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol ChatRouterProtocol {
    func set(viewController: ChatViewControllerProtocol?)
    func route(to scene: ChatRouter.Scene)
}

class ChatRouter: ChatRouterProtocol {

    // MARK: DI
    private weak var viewController: ChatViewControllerProtocol?
    private let chatStoryboard: Storyboard
    private let invitationDetailStoryboard: Storyboard

    enum Scene: Equatable {
        case back
        case addDate(invitation: Appointment)
    }

    init(
        chatStoryboard: Storyboard,
        invitationDetailStoryboard: Storyboard
    ) {
        self.chatStoryboard = chatStoryboard
        self.invitationDetailStoryboard = invitationDetailStoryboard
    }

    func set(viewController: ChatViewControllerProtocol?) {
        self.viewController = viewController
    }

    func route(to scene: ChatRouter.Scene) {
        switch scene {
        case .back:
            viewController?.pop(animated: true)
        case .addDate(let invitation):
            guard let vc = invitationDetailStoryboard.viewController(identifier: InvitationDetailStoryboardId.addDate) as? AddDateViewController else { return }
            vc.set(invitation: invitation)
            viewController?.show(vc, sender: nil)
        }
    }
}

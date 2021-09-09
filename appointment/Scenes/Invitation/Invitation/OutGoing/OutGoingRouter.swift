////
//  OutGoingRouter.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/24/20.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

//sourcery: AutoMockable
protocol OutGoingRouterProtocol {
  func set(viewController: OutGoingViewControllerProtocol?)
  func route(to scene: OutGoingRouter.Scene)
}

class OutGoingRouter: NSObject, OutGoingRouterProtocol {

    // MARK: DI
    private weak var viewController: OutGoingViewControllerProtocol?
    private let invitationDetailStoryboard: Storyboard

    func set(viewController: OutGoingViewControllerProtocol?) {
        self.viewController = viewController
    }

    init(invitationDetailStoryboard: Storyboard) {
        self.invitationDetailStoryboard = invitationDetailStoryboard
    }
}

// MARK: Routing logic
extension OutGoingRouter {

    enum Scene {
        case invitationDetail(invitation: Appointment?)
    }

    func route(to scene: OutGoingRouter.Scene) {
        switch scene {
        case .invitationDetail(let invitation):
            // TODO: fixRouting
            // --- new --- //
            guard let vc = invitationDetailStoryboard.viewController(
                identifier: InvitationDetailStoryboardId.newInvitationDetail
                ) as? NewInvitationDetailViewController else { return }
            // --- old --- //
//            guard let vc = invitationDetailStoryboard.viewController(
//                identifier: InvitationDetailStoryboardId.invitationDetail
//                ) as? InvitationDetailViewController else { return }
            vc.set(invitation: invitation, isOutgoing: true)
            viewController?.show(vc, sender: nil)
        }
    }
}

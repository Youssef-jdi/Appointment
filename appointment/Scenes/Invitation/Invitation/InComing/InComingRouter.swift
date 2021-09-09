////
//  InComingRouter.swift
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
protocol InComingRouterProtocol {
  func set(viewController: InComingViewControllerProtocol?)
  func route(to scene: InComingRouter.Scene)
}

class InComingRouter: NSObject, InComingRouterProtocol {

    // MARK: DI
    weak var viewController: InComingViewControllerProtocol?
    private let invitationDetailStoryboard: Storyboard

    func set(viewController: InComingViewControllerProtocol?) {
        self.viewController = viewController
    }

    init(invitationDetailStoryboard: Storyboard) {
        self.invitationDetailStoryboard = invitationDetailStoryboard
    }
}

// MARK: Routing logic
extension InComingRouter {

    enum Scene {
        case invitationDetail(invitation: Appointment?)
    }

    func route(to scene: InComingRouter.Scene) {
        switch scene {
        case .invitationDetail(let invitation):
            guard let invitationDetailVC = invitationDetailStoryboard.viewController(identifier: InvitationDetailStoryboardId.newInvitationDetail) as? NewInvitationDetailViewController else { return }
            prepareForInvitationDetail(invitationDetailVC, invitation: invitation)
        }
    }
}

// MARK: Preparing Methods
private extension InComingRouter {
    func prepareForInvitationDetail(_ invitationDetailVC: NewInvitationDetailViewController, invitation: Appointment?) {
        invitationDetailVC.set(invitation: invitation, isOutgoing: false)
        viewController?.show(invitationDetailVC, sender: nil)
    }
}

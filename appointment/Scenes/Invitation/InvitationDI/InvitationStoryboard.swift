//
//  InvitationStoryboard.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/24/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectStoryboard

enum InvitationStoryboardId: StoryboardId {
    case invitation
    case outgoing
    case incoming
    case availabilityOverview
    case setAvailability

    var identifier: String {
        switch self {
        case .invitation:
            return R.storyboard.invitation.invitationContainerViewController.identifier
        case .outgoing:
            return R.storyboard.invitation.outGoingViewController.identifier
        case .incoming:
            return R.storyboard.invitation.inComingViewController.identifier
        case .availabilityOverview:
            return R.storyboard.invitation.availabilityOverviewViewController.identifier
        case .setAvailability:
            return R.storyboard.invitation.setAvailabilityViewController.identifier
        }
    }
}

//swiftlint:disable implicit_return
class InvitationStoryboard: Storyboard {
    
    private let container: Container
    private let assembly: Assembly
    private let storyboard: SwinjectStoryboard

    init(sharedContainer: Container, assembly: Assembly) {
        self.assembly = assembly
        container = Container(parent: sharedContainer)
        assembly.assemble(container: container)
        storyboard = SwinjectStoryboard.create(name: R.storyboard.invitation.name, bundle: nil, container: container)
    }
    
    func initial<T>() -> T? where T: UIViewController {
        return storyboard.instantiateInitialViewController() as? T
    }

    func viewController<T>(identifier: StoryboardId) -> T? where T: UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier.identifier) as? T
    }
}

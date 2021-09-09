//
//  InvitationDetailStoryboard.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/5/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectStoryboard

//swiftlint:disable implicit_return
class InvitationDetailStoryboard: Storyboard {
    private let container: Container
    private let assembly: Assembly
    private let storyboard: SwinjectStoryboard

    init(sharedContainer: Container, assembly: Assembly) {
        self.assembly = assembly
        container = Container(parent: sharedContainer)
        assembly.assemble(container: container)
        storyboard = SwinjectStoryboard.create(name: R.storyboard.invitationDetail.name, bundle: nil, container: container)
    }

    func initial<T>() -> T? where T: UIViewController {
        return storyboard.instantiateInitialViewController() as? T
    }

    func viewController<T>(identifier: StoryboardId) -> T? where T: UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier.identifier) as? T
    }
}

enum InvitationDetailStoryboardId: StoryboardId {
    case invitationDetail
    case newInvitationDetail
    case addDate
    case selectDate
    case dayCalendar
    case addToAgenda

    var identifier: String {
        switch self {
        case .invitationDetail:
            return R.storyboard.invitationDetail.invitationDetailViewController.identifier
        case .newInvitationDetail:
            return R.storyboard.invitationDetail.newInvitationDetailViewController.identifier
        case .addDate:
            return R.storyboard.invitationDetail.addDateViewController.identifier
        case .selectDate:
            return R.storyboard.invitationDetail.invitationSelectDateViewController.identifier
        case .dayCalendar:
            return R.storyboard.invitationDetail.dayCalendarViewController.identifier
        case .addToAgenda:
            return R.storyboard.invitationDetail.addToAgendaViewController.identifier
        }
    }
}

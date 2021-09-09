//
//  ChatAssembly.swift
//  appointment
//
//  Created by Tran Gia Huy on 30/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

class ChatAssembly: Assembly {
    func assemble(container: Container) {

        container.register(ChatRouterProtocol.self) {
            return ChatRouter(
                chatStoryboard: $0 ~> (Storyboard.self, name: R.storyboard.chat.name),
                invitationDetailStoryboard: $0 ~> (Storyboard.self, name: R.storyboard.invitationDetail.name))
        }
        container.storyboardInitCompleted(ChatViewController.self) { resolver, vc in
            let router = resolver ~> (ChatRouterProtocol.self)
            router.set(viewController: vc)
            vc.set(router: router)
        }
    }
}

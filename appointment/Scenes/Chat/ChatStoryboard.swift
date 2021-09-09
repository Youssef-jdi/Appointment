//
//  ChatStoryboard.swift
//  appointment
//
//  Created by Tran Gia Huy on 30/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectStoryboard

//swiftlint:disable implicit_return
class ChatStoryboard: Storyboard {
    private let container: Container
    private let assembly: Assembly
    private let storyboard: SwinjectStoryboard

    init(sharedContainer: Container, assembly: Assembly) {
        self.assembly = assembly
        container = Container(parent: sharedContainer)
        assembly.assemble(container: container)
        storyboard = SwinjectStoryboard.create(name: R.storyboard.chat.name, bundle: nil, container: container)
    }

    func initial<T>() -> T? where T: UIViewController {
        return storyboard.instantiateInitialViewController() as? T
    }

    func viewController<T>(identifier: StoryboardId) -> T? where T: UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier.identifier) as? T
    }
}

enum ChatStoryboarddId: StoryboardId {
    case chat

    var identifier: String {
        switch self {
        case .chat:
            return R.storyboard.chat.chatViewController.identifier
        }
    }
}

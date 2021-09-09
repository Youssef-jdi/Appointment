//
//  SyncStoryboard.swift
//  appointment
//
//  Created by Rachel Polachova on 05/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectStoryboard

// swiftlint:disable implicit_return
class SyncStoryboard: Storyboard {
    
    enum SyncStoryboardId: StoryboardId {
        case sync

        var identifier: String {
            switch self {
            case .sync:
                return R.storyboard.sync.syncViewController.identifier
            }
        }
    }

    private let container: Container
    private let assembly: Assembly
    private let storyboard: SwinjectStoryboard

    init(sharedContainer: Container, assembly: Assembly) {
        self.assembly = assembly
        container = Container(parent: sharedContainer)
        assembly.assemble(container: container)
        storyboard = SwinjectStoryboard.create(name: R.storyboard.sync.name, bundle: nil, container: container)
    }

    func initial<T>() -> T? where T: UIViewController {
        return storyboard.instantiateInitialViewController() as? T
    }

    func viewController<T>(identifier: StoryboardId) -> T? where T: UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier.identifier) as? T
    }
}

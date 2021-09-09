//
//  HomeStoryboard.swift
//  appointment
//
//  Created by Raluca Mesterca on 25/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectStoryboard

enum HomeStoryboardId: StoryboardId {
    case home
    case homePage

    var identifier: String {
        switch self {
        case .home:
            return R.storyboard.home.homeViewController.identifier
        case .homePage:
            return R.storyboard.home.homePageViewController.identifier
        }
    }
}

// swiftlint:disable implicit_return
class HomeStoryboard: Storyboard {

    private let container: Container
    private let assembly: Assembly
    private let storyboard: SwinjectStoryboard

    init(sharedContainer: Container, assembly: Assembly) {
        self.assembly = assembly
        container = Container(parent: sharedContainer)
        assembly.assemble(container: container)
        storyboard = SwinjectStoryboard.create(name: R.storyboard.home.name, bundle: nil, container: container)
    }

    func initial<T>() -> T? where T: UIViewController {
        return storyboard.instantiateInitialViewController() as? T
    }

    func viewController<T>(identifier: StoryboardId) -> T? where T: UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier.identifier) as? T
    }
}

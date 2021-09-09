//
//  CustomPopUpStoryboard.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/2/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectStoryboard

class CustomPopUpStoryboard: Storyboard {

    private let container: Container
    private let assembly: Assembly
    private let storyboard: SwinjectStoryboard

    init(sharedContainer: Container, assembly: Assembly) {
        self.assembly = assembly
        container = Container(parent: sharedContainer)
        assembly.assemble(container: container)
        storyboard = SwinjectStoryboard.create(name: R.storyboard.customPopUp.name, bundle: nil, container: container)
    }

    func initial<T>() -> T? where T: UIViewController {
        return storyboard.instantiateInitialViewController() as? T
    }

    func viewController<T>(identifier: StoryboardId) -> T? where T: UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier.identifier) as? T
    }
}

enum CustomPopUpStoryboardId: StoryboardId {
    case multipleButton
    case twoButton

    var identifier: String {
        switch self {
        case .multipleButton:
            return R.storyboard.customPopUp.multipleButtonAlertViewController.identifier
        case .twoButton:
            return R.storyboard.customPopUp.customPopupWithTwoButtons.identifier
        }
    }
}

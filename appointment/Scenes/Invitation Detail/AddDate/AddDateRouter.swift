//
//  AddDateRouter.swift
//  appointment
//
//  Created by Tran Gia Huy on 04/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol AddDateRouterProtocol {
    func set(viewController: AddDateViewControllerProtocol?)
    func route(to scene: AddDateRouter.Scene)
}

class AddDateRouter: AddDateRouterProtocol {

    private weak var viewController: AddDateViewControllerProtocol?

    enum Scene: Equatable {
          case goBack
      }

    func set(viewController: AddDateViewControllerProtocol?) {
        self.viewController = viewController
    }

    func route(to scene: Scene) {
        switch scene {
        case .goBack:
            viewController?.pop(animated: true)
        }
    }
}

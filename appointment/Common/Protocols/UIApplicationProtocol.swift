//
//  UIApplicationProtocol.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol UIApplicationProtocol {
    var keyWindow: UIWindow? { get }
    var rootViewController: UIViewController? { get set }

    func topViewController(controller: UIViewController?) -> UIViewController?
}

extension UIApplication: UIApplicationProtocol {

    var rootViewController: UIViewController? {
        get { return keyWindow?.rootViewController }
        set { keyWindow?.rootViewController = newValue }
    }

    func topViewController(controller: UIViewController?) -> UIViewController? {
        var base: UIViewController?

        if controller == nil {
            base = rootViewController
        } else { base = controller }

        if let navigationController = base as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }

        if let presented = base?.presentedViewController {
            return topViewController(controller: presented)
        }
        return base
    }
}

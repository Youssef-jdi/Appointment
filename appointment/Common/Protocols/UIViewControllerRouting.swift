//
//  UIViewControllerRouting.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol UIViewControllerRouting {
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    func show(_ vc: UIViewController, sender: Any?)
    func pop(animated: Bool)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
    func popToRoot(animated: Bool)
}

//sourcery: AutoMockable
protocol UINavigationControllerRouting {
    func popViewController(animated: Bool) -> UIViewController?
    func show(_ vc: UIViewController, sender: Any?)
}

extension UIViewController: UIViewControllerRouting {
    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool) {
        navigationController?.popToRootViewController(animated: animated)
    }
}

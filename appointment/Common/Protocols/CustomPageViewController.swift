//
//  CustomPageViewController.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/24/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol HasCustomPageViewControllerProtocol: UIPageViewController {
    var vcs: [UIViewController] { get set }

    func setupViewControllers(vcs: [UIViewController])
    func moveToIndex(index: Int)
}

extension HasCustomPageViewControllerProtocol where Self: UIPageViewControllerDataSource & UIPageViewControllerDelegate {
    func pageViewControllerNavBack(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIdex = vcs.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIdex - 1

        guard previousIndex >= 0 else { return nil }

        guard vcs.count > previousIndex else { return nil }

        return vcs[previousIndex]
    }

    func pageViewControllerNavForward(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIdex = vcs.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIdex + 1

        guard vcs.count != nextIndex else { return nil }

        guard vcs.count > nextIndex else { return nil }

        return vcs[nextIndex]
    }
}

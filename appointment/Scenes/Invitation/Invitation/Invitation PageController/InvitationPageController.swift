//
//  InvitationPageController.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/24/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol PageViewControllerDelegate: class {
    func updateSegmentedControll(to point: CGFloat)
    func setSegmentedControl(to: Int)
}
//swiftlint:disable implicit_return
class InvitationPageController: UIPageViewController, HasCustomPageViewControllerProtocol {
    
    var vcs: [UIViewController] = []
    var invitationStoryboard: Storyboard!
    weak var segmentedControllDelegate: PageViewControllerDelegate?
    override var transitionStyle: UIPageViewController.TransitionStyle {
        return .scroll
    }
    override var navigationOrientation: UIPageViewController.NavigationOrientation {
        return .horizontal
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers(vcs: [
            invitationStoryboard.viewController(identifier: InvitationStoryboardId.outgoing)!,
            invitationStoryboard.viewController(identifier: InvitationStoryboardId.incoming)!
            ])
        moveToIndex(index: 0)
    }
    
    func setupViewControllers(vcs: [UIViewController]) {
        self.vcs = vcs
    }
    
    func moveToIndex(index: Int) {
        setViewControllers([vcs[index]], direction: index == 1 ? .forward : .reverse, animated: false, completion: nil)
    }
}

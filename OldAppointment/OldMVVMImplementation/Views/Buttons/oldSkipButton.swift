////
////  SkipButton.swift
////  appointment
////
////  Created by Dylan Barteling on 29/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import SideMenuSwift
//
//class SkipButton: UIBarButtonItem {
//    
//    convenience init(color: UIColor) {
//        let barButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 44))
//        barButton.setTitleColor(color, for: .normal)
//        barButton.setTitle("SKIP", for: .normal)
//        self.init(customView: barButton)
//        barButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
//    }
//    
//    override private init() {
//        super.init()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    @IBAction private func skipTapped() {
//        configureSideMenu()
//    }
//    
//    private func configureSideMenu() {
//        SideMenuController.preferences.basic.menuWidth = UIScreen.main.bounds.width * 0.7
//        SideMenuController.preferences.basic.defaultCacheKey = "0"
//        SideMenuController.preferences.basic.statusBarBehavior = .hideOnMenu
//        SideMenuController.preferences.basic.enableRubberEffectWhenPanning = false
//        SideMenuController.preferences.basic.hideMenuWhenEnteringBackground = true
//        let menuViewController = R.storyboard.sideMenu().instantiateInitialViewController()!
//        let contentViewController = R.storyboard.sideMenu.sideMenuController()!
//        let sideMenuVC = SideMenuController(contentViewController: contentViewController, menuViewController: menuViewController)
//        guard let navVC = UIApplication.shared.keyWindow?.topViewController()?.navigationController else {
//            return
//        }
//        navVC.present(sideMenuVC, animated: true)
//    }
//}

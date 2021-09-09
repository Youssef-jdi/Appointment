////
////  UIViewController+Base.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 19.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//extension UIViewController {
//    
//    var loadingView: OldLoadingView {
//        let view = OldLoadingView(frame: UIApplication.shared.keyWindow?.frame ?? .zero)
//        return view
//    }
//    
//    func prepareNavigationBar() {
//        navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationItem.backBarButtonItem?.tintColor = .white
//        navigationController?.navigationBar.isTranslucent = false
//        tabBarController?.tabBar.unselectedItemTintColor = UIColor.black.withAlphaComponent(0.15)
//        if let navController = navigationController, navController.viewControllers.count > 1 {
//            addBackButton()
//        }
//    }
//    
//    func addBackButton() {
//        let backButton = UIBarButtonItem(image: R.image.navigationBar_Back(),
//                                         style: .plain,
//                                         target: self,
//                                         action: #selector(backButtonTouched))
//        navigationItem.leftBarButtonItem = backButton
//        backButton.tintColor = .white
//    }
//    
//    func addSideMenuButton() {
//        let sideButton = UIBarButtonItem(image: R.image.menu_Button()!,
//                                         style: .plain,
//                                         target: self,
//                                         action: #selector(pushSideMenu))
//        navigationItem.leftBarButtonItem = sideButton
//        navigationItem.leftBarButtonItem!.tintColor = .white
//    }
//    
//    @objc private func backButtonTouched() {
//        navigationController?.popViewController(animated: true)
//    }
//    
//    @objc private func pushSideMenu() {
//        sideMenuController?.revealMenu()
//    }
//}

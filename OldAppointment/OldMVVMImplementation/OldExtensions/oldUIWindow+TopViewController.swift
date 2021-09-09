////
////  UIWindow+TopViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 6.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import SideMenuSwift
//extension UIWindow {
//    func topViewController() -> UIViewController? {
//        var top = self.rootViewController
//        while true {
//            if let sideMenu = top as? SideMenuController {
//                top = sideMenu.contentViewController
//            } else if let presented = top?.presentedViewController {
//                top = presented
//            } else if let nav = top as? UINavigationController {
//                top = nav.visibleViewController
//            } else if let tab = top as? UITabBarController {
//                top = tab.selectedViewController
//            } else {
//                break
//            }
//        }
//        return top
//    }
//}

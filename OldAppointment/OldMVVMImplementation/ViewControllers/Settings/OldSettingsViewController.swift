////
////  SettingsViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 6.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import Foundation
//
//protocol LoggedInSettingTableViewControllerPopup: class {
//    func showPopup()
//}
//
//class SettingsViewController: BaseViewController, Storyboardable {
//    
//    static var storyboardName: String { return "Settings" }
//    static var storyboardIdentifier: String { return "SettingsViewController" }
//    
//    @IBOutlet private weak var containerView: UIView!
//    
//    var isUserLoggedIn: Bool = false
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setuptablevView()
//        setupNavigationBar()
//        addSideMenuButton()
//    }
//    
//    func setuptablevView() {
//        let loginedTVC = R.storyboard.settings.loggedInSettingsTableViewController()!
//        loginedTVC.delegate = self
//        let unloginTVC = R.storyboard.settings.unloginSettingsTableViewController()!
//        if !isUserLoggedIn {
//            embed(tableViewController: loginedTVC)
//        } else {
//            embed(tableViewController: unloginTVC)
//        }
//    }
//    
//    func setupNavigationBar() {
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        self.navigationItem.title = "Instellingen"
//    }
//    
//    func embed(tableViewController: UITableViewController?) {
//        if let tableVC = tableViewController {
//            tableVC.willMove(toParent: self)
//            containerView.addSubview(tableVC.view)
//            tableVC.view.frame = containerView.bounds
//            self.addChild(tableVC)
//            tableVC.didMove(toParent: self)
//        }
//    }
//}
//
//extension SettingsViewController: LoggedInSettingTableViewControllerPopup {
//    func showPopup() {
//        print("tap tap tap")
//        let popup = DateFormatPopupViewController.instantiate()
//        popup.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//        self.present(popup, animated: true)
//    }
//}

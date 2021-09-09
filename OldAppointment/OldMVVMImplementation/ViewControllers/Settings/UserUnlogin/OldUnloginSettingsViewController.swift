////
////  UnloginSettingViewController.swift
////  appointment
////
////  Created by Tran Gia Huy on 3/12/19.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class UnloginSettingsTableViewController: UITableViewController, Storyboardable {
//    static var storyboardName: String { return "Settings" }
//    
//    static var storyboardIdentifier: String { return "UnloginSettingTableViewController" }
//    
//    @IBOutlet private weak var linksStackView: UIStackView! {
//        didSet {
//            linksStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToLinks)))
//        }
//    }
//    
//    @IBOutlet private weak var loginStackView: UIStackView! {
//        didSet {
//            loginStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToLogin)))
//        }
//    }
//
//    @IBOutlet private weak var registerStackView: UIStackView! {
//        didSet {
//            registerStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToRegister)))
//        }
//    }
//    
//    @IBOutlet private var subLabels: [UILabel]! {
//        didSet {
//            subLabels.forEach {
//                $0.font = R.font.openSans(size: 16)
//                $0.textColor = R.color.appGray()
//            }
//            subLabels[0].text = R.string.localizable.connectedSettings.key.localized.uppercased()
//            subLabels[1].text = R.string.localizable.login.key.localized.uppercased()
//            subLabels[2].text = R.string.localizable.register.key.localized.uppercased()
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}
//
//extension UnloginSettingsTableViewController {
//    @objc func goToLinks() {
//        let linksVC = storyboard?.instantiateViewController(withIdentifier: "LinksTableViewController") as? LinksTableViewController
//        if let linksVC = linksVC {
//            navigationController?.pushViewController(linksVC, animated: true)
//        }
//    }
//    
//    @objc func goToLogin() {
//        UIApplication.shared.keyWindow?.rootViewController = R.storyboard.login.instantiateInitialViewController()
//    }
//    
//    @objc func goToRegister() {
//        UIApplication.shared.keyWindow?.rootViewController = R.storyboard.register.instantiateInitialViewController()
//    }
//    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return R.string.localizable.general.key.localized.uppercased()
//        case 1: return R.string.localizable.account.key.localized.uppercased()
//        default:return nil
//        }
//    }
//}

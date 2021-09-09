////
////  AboutViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 6.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class AboutViewController: BaseViewController, Storyboardable {
//
//    static var storyboardName: String { return "About" }
//    
//    static var storyboardIdentifier: String { return "AboutViewController" }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addSideMenuButton()
//        setupNavigation()
//        UITextView.appearance().linkTextAttributes = [.foregroundColor: R.color.appBlue()]
//    }
//    
//    func setupNavigation() {
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        navigationItem.title = R.string.localizable.aboutAppointment.key.localized.firstCapitalized
//    }
//}

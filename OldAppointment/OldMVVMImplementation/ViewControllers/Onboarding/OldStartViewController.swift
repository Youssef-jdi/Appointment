////
////  StartViewController.swift
////  appointment
////
////  Created by Dylan Barteling on 18/02/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//import UIKit
//import Moya
//
//class StartViewController: BaseViewController, Storyboardable {
//
//    // MARK: Statics
//    static var storyboardName: String = "Start"
//    static var storyboardIdentifier: String = "StartVC"
//    
//    // MARK: IBOutlets
//    @IBOutlet private weak var loginButton: GeneralRoundedButton! {
//        didSet {
//            loginButton.setTitle("login".localized.uppercased(), for: .normal)
//            loginButton.type = .blue
//        }
//    }
//    @IBOutlet private weak var registerButton: GeneralRoundedButton! {
//        didSet {
//            registerButton.setTitle("register".localized.uppercased(), for: .normal)
//            registerButton.type = .blue
//        }
//    }
//    @IBOutlet private weak var tutorialButton: GeneralRoundedButton! {
//        didSet {
//            tutorialButton.setTitle("tutorial".localized.uppercased(), for: .normal)
//            tutorialButton.type = .noBackground
//        }
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
//    }
//}

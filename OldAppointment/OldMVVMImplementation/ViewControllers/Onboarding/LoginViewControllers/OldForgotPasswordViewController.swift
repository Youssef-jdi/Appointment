////
////  ForgotPasswordViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 26.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class ForgotPasswordViewController: BaseViewController {
//    
//    @IBOutlet private weak var forgotPasswordButton: GeneralRoundedButton! {
//        didSet {
//            forgotPasswordButton.setTitle(R.string.localizable.send.key.localized.uppercased(), for: .normal)
//            forgotPasswordButton.type = .blue
//        }
//    }
//    @IBOutlet private weak var explanationLabel: UILabel! {
//        didSet {
//            explanationLabel.text = R.string.localizable.sendEmailDescription.key.localized.capitalizingFirstLetter()
//        }
//    }
//    
//    @IBOutlet private weak var emailTextField: UITextField! {
//        didSet {
//            emailTextField.placeholder = R.string.localizable.email.key.localized.capitalizingFirstLetter()
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}

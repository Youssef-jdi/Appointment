////
////  LoginViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 26.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class LoginViewController: BaseViewController, MVVMViewController, Storyboardable {
//
//    static var storyboardName: String = "Login"
//    static var storyboardIdentifier: String = "LoginVC"
//
//    typealias ViewModel = LoginViewModel
//
//    var viewModel = ViewModel()
//
//    @IBOutlet private weak var noAccountView: UIView! {
//        didSet {
//            noAccountView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(noAccountTapped)))
//        }
//    }
//    
//    // MARK: IBOutlets
//    @IBOutlet private weak var loginButton: GeneralRoundedButton! {
//        didSet {
//            loginButton.setTitle(R.string.localizable.login.key.localized.uppercased(), for: .normal)
//            loginButton.titleLabel?.adjustsFontSizeToFitWidth = true
//            loginButton.type = .blue
//        }
//    }
//    
//    @IBOutlet private weak var forgotPasswordButton: UIButton! {
//        didSet {
//            forgotPasswordButton.setTitle(R.string.localizable.forgotPassword.key.localized.uppercased(), for: .normal)
//            forgotPasswordButton.titleLabel?.adjustsFontSizeToFitWidth = true
//        }
//    }
//    
//    @IBOutlet private weak var loginLabel: UILabel! {
//        didSet {
//             loginLabel.text = R.string.localizable.login.key.localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var emailTextField: RoundedTextField! {
//        didSet {
//            emailTextField.placeholder = R.string.localizable.email.key.localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var passwordTextField: RoundedTextField! {
//        didSet {
//            passwordTextField.placeholder = R.string.localizable.password.key.localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var credentialErrorLabel: UILabel! {
//        didSet {
//            credentialErrorLabel.text = R.string.localizable.wrongCredentials.key.localized.capitalizingFirstLetter()
//        }
//    }
//
//    private let errorFieldAssociations: [LoginError: [ReferenceWritableKeyPath<LoginViewController, RoundedTextField>]] = [
//        .emptyEmail: [\.emailTextField],
//        .emailNotValid: [\.emailTextField],
//        .emailNotRegistered: [\.emailTextField],
//        .emptyPassword: [\.passwordTextField],
//        .passwordTooShort: [\.passwordTextField],
//        .passwordMustContainOneUppercase: [\.passwordTextField],
//        .passwordMustContainOneLowercase: [\.passwordTextField],
//        .passwordMustContainOneDigit: [\.passwordTextField],
//        .emptyFields: [\.emailTextField, \.passwordTextField],
//        .emailAndPasswordDontMatch: [\.emailTextField, \.passwordTextField]
//    ]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        loginBinding()
//        navigationItem.rightBarButtonItem = SkipButton(color: .white)
//    }
//
//    @IBAction private func loginButtonPressed(_ sender: Any) {
//        viewModel.login()
//    }
//
//    @IBAction private func emailTextFieldDidUpdate(_ sender: Any) {
//        resetFieldAlert(fields: [emailTextField])
//        viewModel.email = emailTextField.text ?? ""
//    }
//
//    @IBAction private func passwordTextFieldDidUpdate(_ sender: Any) {
//        resetFieldAlert(fields: [passwordTextField])
//        viewModel.password = passwordTextField.text ?? ""
//    }
//    
//    @objc func noAccountTapped() {
//        if navigationController?.viewControllers[navigationController!.viewControllers.count - 2] is RegisterViewController {
//            navigationController?.popViewController(animated: true)
//        } else {
//            performSegue(withIdentifier: "ShowRegisterVC", sender: nil)
//        }
//    }
//}
//
//extension LoginViewController {
//
//    // MARK: - Helpers functions
//    func loginBinding() {
//        viewModel.didReceivedResponse = { [weak self] result in
//            do {
//                try result.get()
//                self?.performSegue(withIdentifier: "ShowSyncVC", sender: nil)
//            } catch let error as LoginError {
//                self?.handleAuthErrors(error: error)
//            } catch {
//                guard let `self` = self else { return }
//                let alert = self.alertWithTitle("Error", message: error.localizedDescription)
//                self.showAlert(alert)
//                return
//            }
//        }
//    }
//
//    fileprivate func handleAuthErrors(error: LoginError) {
//        guard let fieldKeypaths = errorFieldAssociations[error] else { return }
//        let message = error.localizedDescription
//        let textFields = fieldKeypaths.compactMap { self[keyPath: $0] }
//        handleFieldError(fields: textFields, errorMessage: message)
//    }
//
//    private func handleFieldError(fields: [UITextField], errorMessage: String) {
//        credentialErrorLabel.isHidden = false
//        credentialErrorLabel.text = errorMessage
//        for textField in fields {
//            textField.layer.borderColor = UIColor.red.cgColor
//            textField.textColor = UIColor.red
//            textField.shake()
//        }
//    }
//
//    private func resetFieldAlert(fields: [UITextField]) {
//        credentialErrorLabel.isHidden = true
//        for textField in fields {
//            textField.layer.borderColor = UIColor.black.cgColor
//            textField.textColor = UIColor.black
//        }
//    }
//}

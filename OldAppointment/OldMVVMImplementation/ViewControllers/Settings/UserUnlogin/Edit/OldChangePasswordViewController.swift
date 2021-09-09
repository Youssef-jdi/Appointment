////
////  ChangePasswordViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 14.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class ChangePasswordViewController: BaseViewController, Storyboardable, MVVMViewController {
//    static var storyboardName: String { return "Settings" }
//    static var storyboardIdentifier: String { return "ChangePasswordViewController" }
//    
//    typealias ViewModel = UserViewModel
//    
//    var viewModel = UserViewModel()
//    
//    private let errorFieldAssociations: [LoginError: [ReferenceWritableKeyPath<ChangePasswordViewController, RoundedTextField>]] = [
//        .passwordTooShort: [\.newPasswordTextField, \.reNewPasswordTextField],
//        .passwordDontMatch: [\.newPasswordTextField, \.reNewPasswordTextField],
//        .passwordMustContainOneUppercase: [\.newPasswordTextField, \.reNewPasswordTextField],
//        .passwordMustContainOneLowercase: [\.newPasswordTextField, \.reNewPasswordTextField],
//        .passwordMustContainOneDigit: [\.newPasswordTextField, \.reNewPasswordTextField],
//        .emptyFields: [\.newPasswordTextField, \.reNewPasswordTextField]
//    ]
//    
//    @IBOutlet private weak var oldPasswordTextField: RoundedTextField! {
//        didSet {
//            oldPasswordTextField.placeholder = R.string.localizable.oldPassword.key.localized.capitalizingFirstLetter()
//            oldPasswordTextField.delegate = self
//        }
//    }
//    
//    @IBOutlet private weak var credentialErrorLabel: UILabel! {
//        didSet {
//            credentialErrorLabel.text = R.string.localizable.wrongCredentials.key.localized.capitalizingFirstLetter()
//        }
//    }
//    
//    @IBOutlet private weak var indicator: UIActivityIndicatorView! {
//        didSet {
//            indicator.style = .whiteLarge
//            indicator.hidesWhenStopped = true
//            indicator.tintColor = ThemeService.shared.theme.firstColor
//        }
//    }
//    
//    @IBOutlet private weak var newPasswordTextField: RoundedTextField! {
//        didSet {
//            newPasswordTextField.placeholder = R.string.localizable.newPassword.key.localized.capitalizingFirstLetter()
//            newPasswordTextField.delegate = self
//        }
//    }
//    
//    @IBOutlet private weak var reNewPasswordTextField: RoundedTextField! {
//        didSet {
//            reNewPasswordTextField.placeholder = R.string.localizable.reNewPassword.key.localized.capitalizingFirstLetter()
//            reNewPasswordTextField.delegate = self
//        }
//    }
//    
//    @IBOutlet private weak var savePasswordButton: GeneralRoundedButton! {
//        didSet {
//            savePasswordButton.type = .blue
//            savePasswordButton.setTitle(R.string.localizable.saveNewPassword.key.localized.uppercased(), for: .normal)
//        }
//    }
//    
//    @IBAction private func changePasswordPressed(_ sender: UIButton) {
//        resetFieldAlert(fields: [newPasswordTextField, reNewPasswordTextField])
//        viewModel.changePassword(oldPassword: oldPasswordTextField.text, newPassword: newPasswordTextField.text, reNewPassword: reNewPasswordTextField.text)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        bindViewModel()
//        addBackButton()
//    }
//}
//
//extension ChangePasswordViewController: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        resetFieldAlert(fields: [textField])
//    }
//}
//
//private extension ChangePasswordViewController {
//    
//    func handleAuthErrors(error: LoginError) {
//        guard let fieldKeypaths = errorFieldAssociations[error] else { return }
//        let message = error.localizedDescription
//        let textFields = fieldKeypaths.compactMap { self[keyPath: $0] }
//        handleFieldError(fields: textFields, errorMessage: message)
//    }
//    
//    func handleFieldError(fields: [UITextField], errorMessage: String) {
//        credentialErrorLabel.isHidden = false
//        credentialErrorLabel.text = errorMessage
//        for textField in fields {
//            textField.layer.borderColor = UIColor.red.cgColor
//            textField.textColor = UIColor.red
//            textField.shake()
//        }
//    }
//    
//    func resetFieldAlert(fields: [UITextField]) {
//        credentialErrorLabel.isHidden = true
//        for textField in fields {
//            textField.layer.borderColor = UIColor.black.cgColor
//            textField.textColor = UIColor.black
//        }
//    }
//    
//    func bindViewModel() {
//        viewModel.stateHandler = { [weak self] state in
//            switch state {
//            case .value(let valueState):
//                switch valueState {
//                case .changedPassword:
//                    self?.navigationController?.popViewController(animated: true)
//                default: break
//                }
//            case .error(let errorType):
//                switch errorType {
//                case .passwordError(let passwordError):
//                    self?.handleAuthErrors(error: passwordError)
//                case .underlying(let error):
//                    print(error.localizedDescription)
//                default: break
//                }
//            case .loading:
//                self?.indicator.startAnimating()
//            case .idle:
//                self?.indicator.stopAnimating()
//            }
//        }
//    }
//}

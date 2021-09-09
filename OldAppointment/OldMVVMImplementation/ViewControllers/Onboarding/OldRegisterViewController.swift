////
////  RegisterViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 26.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class RegisterViewController: BaseViewController {
//    
//    typealias ViewModel = RegisterViewModel
//    
//    let viewModel = ViewModel()
//    
//    @IBOutlet private weak var scrollView: UIScrollView! {
//        didSet {
//            let bottomOffset = CGPoint(x: 0,
//                                       y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
//            self.scrollView.setContentOffset(bottomOffset,
//                                             animated: true)
//        }
//    }
//    
//    // MARK: Default Info IBOutlets
//    
//    private let errorFieldAssociations: [LoginError: [ReferenceWritableKeyPath<RegisterViewController, RoundedTextField>]] = [
//        .emptyName: [\.nameTextField],
//        .emptySurname: [\.surnameTextField],
//        .emptyEmail: [\.emailTextField],
//        .emailNotValid: [\.emailTextField],
//        .emailAddressIsAlreadyTaken: [\.emailTextField],
//        .emptyPassword: [\.passwordTextField, \.rePasswordTextField],
//        .emptyRePassword: [\.passwordTextField, \.rePasswordTextField],
//        .passwordTooShort: [\.passwordTextField, \.rePasswordTextField],
//        .passwordMustContainOneUppercase: [\.passwordTextField, \.rePasswordTextField],
//        .passwordMustContainOneLowercase: [\.passwordTextField, \.rePasswordTextField],
//        .passwordMustContainOneDigit: [\.passwordTextField, \.rePasswordTextField],
//        .passwordDontMatch: [\.passwordTextField, \.rePasswordTextField],
//        .emptyFields: [\.emailTextField, \.passwordTextField, \.rePasswordTextField]
//    ]
//    
//    @IBOutlet private weak var errorLabel: UILabel!
//    
//    @IBOutlet private var textFields: [RoundedTextField]! {
//        didSet {
//            textFields.forEach {
//                $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//            }
//        }
//    }
//    
//    @IBOutlet private weak var nameTextField: RoundedTextField! {
//        didSet {
//            nameTextField.placeholder = "name".localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var surnameTextField: RoundedTextField! {
//        didSet {
//            surnameTextField.placeholder = "surname".localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var emailTextField: RoundedTextField! {
//        didSet {
//            emailTextField.placeholder = "email".localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var passwordTextField: RoundedTextField! {
//        didSet {
//            passwordTextField.placeholder = "password".localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var rePasswordTextField: RoundedTextField! {
//        didSet {
//            rePasswordTextField.placeholder = "rePassword".localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var registerButton: GeneralRoundedButton! {
//        didSet {
//            registerButton.setTitle("register".localized.uppercased(), for: .normal)
//            registerButton.type = .blue
//        }
//    }
//    @IBOutlet private weak var alreadyHaveAccountLabel: UILabel! {
//        didSet {
//            alreadyHaveAccountLabel.text = "haveAccount".localized.uppercased()
//        }
//    }
//    
//    @IBOutlet private weak var registerLabel: UILabel! {
//        didSet {
//            registerLabel.text = "register".localized.capitalizingFirstLetter()
//        }
//    }
//    
//    @IBOutlet private weak var hintLabel: UILabel! {
//        didSet {
//            hintLabel.text = "bussinesProfile".localized.capitalizingFirstLetter()
//        }
//    }
//    
//    @IBOutlet private weak var profileStackView: UIStackView! {
//        didSet {
//            profileStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileStackViewTapped)))
//        }
//    }
//    @IBOutlet private weak var profileImageView: UIImageView! {
//        didSet {
//            profileImageView.backgroundColor = UIColor.red
//            profileImageView.layer.masksToBounds = false
//            profileImageView.clipsToBounds = true
//            profileImageView.contentMode = .scaleToFill
//        }
//    }
//    @IBOutlet private weak var addProfilePhotoLabel: UILabel! {
//        didSet {
//            addProfilePhotoLabel.text = "addProfilePhoto".localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var alreadyHaveContainerView: UIView! {
//        didSet {
//            alreadyHaveContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(alreadyHaveTapped)))
//        }
//    }
//    @IBOutlet private weak var pointerDownImage: UIImageView! {
//        didSet {
//            self.pointerDownImage.transform = CGAffineTransform(rotationAngle: .pi)
//        }
//    }
//    
//    // MARK: AditionalViewContainer IBOutlets
//    @IBOutlet private weak var jobTypeTextField: RoundedTextField! {
//        didSet {
//            jobTypeTextField.placeholder = "function".localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var kvkTextField: RoundedTextField! {
//        didSet {
//            kvkTextField.placeholder = "kvkNumber".localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var adrressTextField: RoundedTextField! {
//        didSet {
//            adrressTextField.placeholder = "address".localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var codeAndPlaceTextField: RoundedTextField! {
//        didSet {
//            codeAndPlaceTextField.placeholder = "postalCode".localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var registerAditionalContainer: UIView!
//    @IBOutlet private weak var registerAditionalHintView: UIView! {
//        didSet {
//            let tapGesture = UITapGestureRecognizer(target: self,
//                                                    action: #selector(animateAditionalView))
//            tapGesture.numberOfTouchesRequired = 1
//            registerAditionalHintView.isUserInteractionEnabled = true
//            registerAditionalHintView.addGestureRecognizer(tapGesture)
//        }
//    }
//    
//    @objc func alreadyHaveTapped() {
//        if navigationController?.viewControllers[navigationController!.viewControllers.count - 2] is LoginViewController {
//            navigationController?.popViewController(animated: true)
//        } else {
//            self.performSegue(withIdentifier: "ShowLoginVC", sender: self)
//        }
//    }
//    
//    // MARK: Variables
//    private var showAdditionalView = false
//    private var email: String?
//    private var password: String?
//    
//    private let imagePicker = UIImagePickerController()
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
//    }
//    
//    override func viewDidLoad() {
//        viewBinding()
//        super.viewDidLoad()
//        navigationItem.title = R.string.localizable.register().capitalizingFirstLetter()
//        navigationItem.rightBarButtonItem = SkipButton(color: .white)
//        imagePicker.delegate = self
//    }
//    
//    @objc private func animateAditionalView(_ sender: UITapGestureRecognizer) {
//        showAdditionalView.toggle()
//        handleAnimationForAditionalContainerView()
//        guard !showAdditionalView else { return }
//        clearTextFields()
//    }
//    
//    private func clearTextFields() {
//        jobTypeTextField.text = nil
//        kvkTextField.text = nil
//        adrressTextField.text = nil
//        codeAndPlaceTextField.text = nil
//    }
//    
//    private func handleAnimationForAditionalContainerView() {
//        self.registerAditionalContainer.isHidden.toggle()
//        UIView.animate(withDuration: 0.3,
//                       animations: {
//                        self.pointerDownImage.transform = CGAffineTransform(rotationAngle:
//                            self.showAdditionalView ? 0 : .pi)
//        }) { isCompleted in
//            guard isCompleted else { return }
//            guard self.showAdditionalView else {
//                self.scrollView.setContentOffset(.zero, animated: true)
//                return
//            }
//            let visibleRect = CGRect(x: self.scrollView.contentSize.width - 1,
//                                     y: self.scrollView.contentSize.height - 1,
//                                     width: 1,
//                                     height: 1)
//            self.scrollView.scrollRectToVisible(visibleRect, animated: true)
//        }
//    }
//    
//    @objc func profileStackViewTapped() {
//        imagePicker.allowsEditing = true
//        imagePicker.sourceType = .photoLibrary
//        
//        present(imagePicker, animated: true, completion: nil)
//    }
//    
//    @IBAction private func registerButtonTapped(_ sender: Any) {
//        do {
//            let firstName = nameTextField.text
//            let lastName = surnameTextField.text
//            let email = emailTextField.text
//            let password = passwordTextField.text
//            let rePassword = rePasswordTextField.text
//            
//            try viewModel.validate(name: firstName, surname: lastName, email: email, password: password, rePassword: rePassword)
//            
//            if showAdditionalView {
//               let function = jobTypeTextField.text
//               let kvk = kvkTextField.text
//               let address = adrressTextField.text
//               let zipCodeCity = codeAndPlaceTextField.text
//               try viewModel.validateBussines(function: function, kvk: kvk, address: address, postalCode: zipCodeCity)
//            }
//            
//            self.email = email
//            self.password = password
//            viewModel.register()
//        } catch let error as LoginError {
//            handleAuthErrors(error: error)
//        } catch {
//            print(error)
//            return
//        }
//    }
//}
//
//extension RegisterViewController {
//    private func viewBinding() {
//        viewModel.didReceivedResponse = { [weak self] result in
//            do {
//                try result.get()
//                self?.performSegue(withIdentifier: "ShowLoginVC", sender: self)
//            } catch let error as LoginError {
//                self?.handleAuthErrors(error: error)
//            } catch {
//                print(error)
//                return
//            }
//        }
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let vc = segue.destination as? LoginViewController,
//            let email = email,
//            let password = password else { return }
//        vc.viewModel.email = email
//        vc.viewModel.password = password
//        vc.viewModel.login()
//    }
//    
//    private func handleAuthErrors(error: LoginError) {
//        guard let fieldKeypaths = errorFieldAssociations[error] else { return }
//        let message = error.localizedDescription
//        let textFields = fieldKeypaths.compactMap { self[keyPath: $0] }
//        handleFieldError(fields: textFields, errorMessage: message)
//    }
//    
//    private func handleFieldError(fields: [RoundedTextField], errorMessage: String) {
//        errorLabel.isHidden = false
//        errorLabel.text = errorMessage
//        for textField in fields {
//            textField.layer.borderColor = UIColor.red.cgColor
//            textField.textColor = UIColor.red
//            textField.shake()
//        }
//    }
//    
//    private func resetFieldAlert(fields: [RoundedTextField]) {
//        errorLabel.isHidden = true
//        for textField in fields {
//            textField.layer.borderColor = UIColor.black.cgColor
//            textField.textColor = UIColor.black
//        }
//    }
//}
//
//extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//        guard let pickedImage = info[.originalImage] as? UIImage else { return }
//        profileImageView.image = pickedImage
//        viewModel.profileImage = pickedImage
//        
//        dismiss(animated: true)
//    }
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true)
//    }
//}
//
//extension RegisterViewController {
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        guard let textField = textField as? RoundedTextField,
//            let text = textField.text, !text.isEmpty else { return }
//        self.resetFieldAlert(fields: [textField])
//    }
//}

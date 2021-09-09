////
////  EditProfileViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 13.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class EditProfileViewController: BaseViewController, Storyboardable, MVVMViewController {
//    typealias ViewModel = UserViewModel
//    
//    var viewModel = UserViewModel()
//    
//    static var storyboardName: String { return "Settings" }
//    
//    static var storyboardIdentifier: String { return "EditProfileViewController" }
//    
//    lazy var imagePicker: ImagePicker = {
//        let picker = ImagePicker(presentationController: self, delegate: self, mediaTypes: ["public.image"])
//        return picker
//    }()
//    
//    @IBOutlet private weak var changePasswordButton: GeneralRoundedButton! {
//        didSet {
//            changePasswordButton.type = .blue
//            changePasswordButton.setTitle(R.string.localizable.changePassword.key.localized.uppercased(), for: .normal)
//        }
//    }
//    
//    @IBOutlet private weak var addProfilePhotoImageView: RoundedImageView! {
//        didSet {
//            addProfilePhotoImageView.contentMode = .scaleAspectFit
//            addProfilePhotoImageView.layer.borderColor = UIColor.clear.cgColor
//        }
//    }
//    
//    @IBOutlet private weak var deleteAccount: GeneralRoundedButton! {
//        didSet {
//            deleteAccount.type = .blue
//            deleteAccount.setTitle(R.string.localizable.deleteAccount.key.localized.uppercased(), for: .normal)
//        }
//    }
//    @IBOutlet private weak var functionTextField: RoundedTextField! {
//        didSet {
//            functionTextField.placeholder = R.string.localizable.function.key.localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var kvkNumberTextField: RoundedTextField! {
//        didSet {
//            kvkNumberTextField.placeholder = R.string.localizable.kvkNumber.key.localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var addressTextField: RoundedTextField! {
//        didSet {
//            addressTextField.placeholder = R.string.localizable.address.key.localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var postalCodeTextField: RoundedTextField! {
//        didSet {
//            postalCodeTextField.placeholder = R.string.localizable.postalCode.key.localized.capitalizingFirstLetter()
//        }
//    }
//    
//    @IBOutlet private weak var descriptionLabel: UILabel! {
//        didSet {
//            descriptionLabel.text = R.string.localizable.editProfileDescription.key.localized.capitalizingFirstLetter()
//            descriptionLabel.font = R.font.openSans(size: 14)
//        }
//    }
//    
//    @IBOutlet private weak var optionalLabel: UILabel! {
//        didSet {
//            optionalLabel.textColor = R.color.appGrayChateau()!
//            optionalLabel.text = R.string.localizable.optional.key.localized.capitalizingFirstLetter()
//            optionalLabel.font = R.font.openSans(size: 12)
//        }
//    }
//    
//    @IBOutlet private weak var profilePhotoDescriptionLabel: UILabel! {
//        didSet {
//            profilePhotoDescriptionLabel.text = R.string.localizable.addProfilePhoto.key.localized.capitalizingFirstLetter()
//        }
//    }
//    
//    @IBOutlet private weak var addProfilePhotoButton: UIButton! {
//        didSet {
//            addProfilePhotoButton.tintColor = ThemeService.shared.theme.highlightColor
//        }
//    }
//    
//    override func applyTheme(theme: ProductModel) {
//        super.applyTheme(theme: theme)
//        addProfilePhotoButton.tintColor = theme.highlightColor
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addBackButton()
//        bindViewModel()
//        viewModel.fetchUserProfile(user: 1)
//    }
//    
//    @IBAction private func addProfilePhotoPressed(_ sender: UIButton) {
//        self.imagePicker.present(from: sender)
//    }
//}
//
//extension EditProfileViewController: ImagePickerDelegate {
//    func didSelect(image: UIImage?) {
//        guard let image = image else { return }
//        addProfilePhotoImageView.image = image
//    }
//}
//
//private extension EditProfileViewController {
//    func bindViewModel() {
//        viewModel.stateHandler = { [weak self ] state in
//            switch state {
//            case .value(let userState):
//                switch userState {
//                case .fetchedProfile(let userProfileResponse):
//                    self?.addressTextField.text = userProfileResponse.data.business?.location.thoroughfare
//                    self?.functionTextField.text = userProfileResponse.data.business?.function
//                    self?.kvkNumberTextField.text = userProfileResponse.data.business?.registrationCode
//                    self?.postalCodeTextField.text = userProfileResponse.data.business?.location.postalCode
//                default: break
//                }
//            case .error(let error):
//                print(error.localizedDescription)
//            default:break
//            }
//        }
//    }
//}

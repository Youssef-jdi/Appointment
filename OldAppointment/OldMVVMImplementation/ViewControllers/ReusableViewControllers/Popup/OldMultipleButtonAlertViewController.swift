////
////  MultipleButtonAlertViewController.swift
////  Zodify-CustomAllert
////
////  Created by Suhaib Al Saghir on 20/12/2018.
////  Copyright © 2018 Suhaib Al Saghir. All rights reserved.
////
//
//import UIKit
//
//enum ButtonConfiguration {
//    case singleButton(
//        buttonTitle: NSAttributedString,
//        buttonColor: ButtonDoneRight.Styling)
//    case doubleButton(
//        firstButtonTitle: NSAttributedString,
//        secondButtonTitle: NSAttributedString,
//        firstButtonColor: ButtonDoneRight.Styling,
//        secondButtonColor: ButtonDoneRight.Styling)
//}
//
//class  MultipleButtonAlertViewController: CustomAlertController {
//
//    // MARK: - Outlet
//
//    @IBOutlet private weak var popupImage: UIImageView!
//    @IBOutlet private weak var firstDescription: UILabel!
//    @IBOutlet private weak var secondDescription: UILabel!
//    @IBOutlet private weak var leftButton: ButtonDoneRight! {
//        didSet {
//            leftButton.titleLabel?.numberOfLines = 2
//        }
//    }
//    @IBOutlet private weak var rightButton: ButtonDoneRight! {
//        didSet {
//             rightButton.titleLabel?.numberOfLines = 2
//        }
//    }
//
//    struct ViewModel {
//        let popupImage: UIImage
//        let firstDesctiption: NSMutableAttributedString
//        let secondDescription: NSMutableAttributedString
//        let wantedBlurViewBackground: Bool
//        let leftButtonPressed: ((MultipleButtonAlertViewController) -> Void)?
//        let rightButtonPressed: ((MultipleButtonAlertViewController) -> Void)?
//        let numberOfButton: ButtonConfiguration
//    }
//
//    var viewModel: ViewModel!//swiftlint:disable:this implicitly_unwrapped_optional
//
//    // MARK: - Life cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureAlert(withModel: viewModel)
//        ThemeService.shared.addThemeable(themable: self)
//    }
//
//    // MARK: - Configuration functions
//    /// Call this function to configure the alert with the viewModel
//    func configureAlert(withModel viewModel: ViewModel) {
//        self.modalTransitionStyle = .crossDissolve
//        self.modalPresentationStyle = .overCurrentContext
//        popupImage.image = viewModel.popupImage
//        firstDescription.attributedText = viewModel.firstDesctiption
//        secondDescription.attributedText = viewModel.secondDescription
//        isBlurViewEnabled = viewModel.wantedBlurViewBackground
//
//        if case let .singleButton(
//            buttonTitle,
//            buttonColor) = viewModel.numberOfButton {
//            buttonColor.configure(leftButton, buttonTitle)
//            rightButton.isHidden = true
//            rightButton.titleLabel?.numberOfLines = 2
//        }
//
//        if case let .doubleButton(
//            firstButtonTitle,
//            secondButtonTitle,
//            firstButtonColor,
//            secondButtonColor) = viewModel.numberOfButton {
//            firstButtonColor.configure(leftButton, firstButtonTitle)
//            secondButtonColor.configure(rightButton, secondButtonTitle)
//        }
//    }
//
//    @IBAction private func firstButtonTapped(_ sender: Any) {
//        viewModel.leftButtonPressed?(self)
//    }
//
//    @IBAction private func secondButtonTapped(_ sender: Any) {
//        viewModel.rightButtonPressed?(self)
//    }
//    
//}
//
//extension MultipleButtonAlertViewController: Themeable {
//    func applyTheme(theme: ProductModel) {
//        leftButton.backgroundColor = theme.firstColor
//        rightButton.backgroundColor = theme.highlightColor
//    }
//}
//
//extension ButtonDoneRight {
//
//    enum Styling {
//        case firstColor
//        case highlight
//        case white
//
//        var configure: (ButtonDoneRight, NSAttributedString) -> Void {
//            switch self {
//            case .firstColor: return configurePurpleButton
//            case .highlight: return configureRedButton
//            case .white: return configureWhiteButton
//            }
//        }
//    }
//}
//
//private func configurePurpleButton(_ button: ButtonDoneRight, with text: NSAttributedString) {
//    // need to change the color with the correct one
//    button.setAttributedTitle(text, for: .normal)
//    button.setTitleColor(.white, for: .normal)
//    button.fillColor = ThemeService.shared.theme.firstColor!
//    button.borderColor = .clear
//}
//
//private func configureRedButton(_ button: ButtonDoneRight, with text: NSAttributedString) {
//    button.borderColor = .clear
//    button.fillColor = ThemeService.shared.theme.highlightColor!
//    button.setTitleColor(.white, for: .normal)
//    button.setAttributedTitle(text, for: .normal)
//}
//
//private func configureWhiteButton(_ button: ButtonDoneRight, with text: NSAttributedString) {
//    button.borderColor = .darkGray
//    button.fillColor = .white
//    button.setTitleColor(.black, for: .normal)
//    button.setAttributedTitle(text, for: .normal)
//}

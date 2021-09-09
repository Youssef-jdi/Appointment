////
////  TextFieldAlertViewController.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 28/02/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class TextFieldAlertViewController: CustomAlertController {
//
//    @IBOutlet private weak var alertTitle: UILabel!
//    @IBOutlet private weak var alertTextField: RoundedTextField!
//    @IBOutlet private weak var leftButton: ButtonDoneRight!
//    @IBOutlet private weak var rightButton: ButtonDoneRight!
//
//    struct ViewModel {
//        let popupTitle: String
//        let wantedBlurViewBackground: Bool
//        let numberOfButton: ButtonConfiguration
//        let leftButtonPressed: ((TextFieldAlertViewController) -> Void)?
//        let rightButtonPressed: ((TextFieldAlertViewController) -> Void)?
//    }
//
//    var viewModel: ViewModel! //swiftlint:disable:this implicitly_unwrapped_optional
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        ThemeService.shared.addThemeable(themable: self)
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        configureAlert(withModel: viewModel)
//    }
//
//    func configureAlert(withModel viewModel: ViewModel) {
//        self.modalTransitionStyle = .crossDissolve
//        self.modalPresentationStyle = .overCurrentContext
//        alertTitle.text = viewModel.popupTitle
//        isBlurViewEnabled = viewModel.wantedBlurViewBackground
//
//        if case let .singleButton(
//            buttonTitle,
//            buttonColor) = viewModel.numberOfButton {
//            buttonColor.configure(leftButton, buttonTitle)
//            rightButton.isHidden = true
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
//    @IBAction private func leftButtonPressed(_ sender: Any) {
//        viewModel.leftButtonPressed?(self)
//    }
//    @IBAction private func rightButtonPressed(_ sender: Any) {
//        viewModel.rightButtonPressed?(self)
//    }
//}
//
//extension TextFieldAlertViewController: Themeable {
//    func applyTheme(theme: ProductModel) {
//        leftButton.backgroundColor = theme.firstColor
//        rightButton.backgroundColor = theme.highlightColor
//    }
//}

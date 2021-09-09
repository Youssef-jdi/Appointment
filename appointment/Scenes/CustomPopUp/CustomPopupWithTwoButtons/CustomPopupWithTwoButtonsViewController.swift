//
//  CustomPopupWithTwoButtons.swift
//  appointment
//
//  Created by Tran Gia Huy on 30/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol CustomPopupWithTwoButtonsDelegate: class {
    func tappedRightButton()
}

class CustomPopupWithTwoButtonsViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var overlayView: UIView! {
        didSet {
            overlayView.alpha = 0.25
            overlayView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedLeftButton)))
        }
    }
    @IBOutlet weak var topStackView: UIStackView! {
        didSet {
            topStackView.spacing = 20
        }
    }
    @IBOutlet weak var topStackViewHeight: NSLayoutConstraint!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var contentView: UIView! {
        didSet {
            contentView.backgroundColor = .white
        }
    }

    // MARK: - Properties
    private weak var delegate: CustomPopupWithTwoButtonsDelegate?
    private var popupType: TwoButtonsPopupType?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupPopup()
    }

    // MARK: - Setup
    func set(delegate: CustomPopupWithTwoButtonsDelegate) {
        self.delegate = delegate
    }

    func set(popupType: TwoButtonsPopupType) {
        self.popupType = popupType
    }

    func setupPopup() {
        guard let popupType = popupType else {
            return
        }
        switch popupType {
        case .dateConfirmed(let date):
            setButtonTitle(leftButtonTitle: "ANNULEER", rightButtonTitle: "OK")
            let textFromSystem = "Je hebt de datum voor groep \n Party geprikt op \(date.date) van \(date.start) tot \(date.end).\n De andere groepsleden ontvangen \n hier een bericht over in de app."
            let label = createLabel(with: textFromSystem, font: R.font.openSansBold(size: 15)!)
            //swiftlint:disable:next discouraged_object_literal
            topStackView.addArrangedSubview(createImageView(image: #imageLiteral(resourceName: "popUp_MemoTo_dateSuggestion"), height: 100))
            topStackView.addArrangedSubview(label)
            topStackViewHeight.constant = textFromSystem.height(withConstrainedWidth: view.frame.width, font: R.font.openSans(size: 15)!) + 150
            view.layoutIfNeeded()
        case .reminder:
            setButtonTitle(leftButtonTitle: "ANNULEER", rightButtonTitle: "VERSTUUR")
            //TODO: Localization
            let textFromSystem = "Weet je zeker dat je een \n herinnering wilt sturen naar alle \n deelnemers die nog geen reactie \n hebben gegeven? \n De deelnemers krijgen dan een \n notificatie op hun mobiel."
            //swiftlint:disable:next discouraged_object_literal
            topStackView.addArrangedSubview(createImageView(image: #imageLiteral(resourceName: "Cloud"), height: 100))
            topStackView.addArrangedSubview(createLabel(with: textFromSystem, font: R.font.openSansBold(size: 15)!))
            topStackViewHeight.constant = textFromSystem.height(withConstrainedWidth: view.frame.width, font: R.font.openSans(size: 15)!) + 170
            view.layoutIfNeeded()
        //swiftlint:disable:next empty_enum_arguments
        case .newSuggestDate(_, _): // This gonna use by later
            setButtonTitle(leftButtonTitle: "NIET TOEVOEGEN", rightButtonTitle: "TOEVOEGEN")
            #warning("TODO - Localization, 2020-31-03, Sam")
            let textFromSystem = "Er is een nieuwe datum voorgesteld \n door Kim op: \n15 Juni 2015 van 15:00 - 16:00"
            let anotherTextFromSystem = "Deze datum toevoegen aan \nbeschikbare data in de groepsgesprek?"
            //swiftlint:disable:next discouraged_object_literal
            topStackView.addArrangedSubview(createImageView(image: #imageLiteral(resourceName: "popUp_MemoTo_dateSuggestion"), height: 100))
            topStackView.addArrangedSubview(createLabel(with: textFromSystem, font: R.font.openSansBold(size: 15)!))
            topStackView.addArrangedSubview(createLabel(with: anotherTextFromSystem, font: R.font.openSans(size: 14)!))
            topStackViewHeight.constant = textFromSystem.height(withConstrainedWidth: view.frame.width, font: R.font.openSans(size: 15)!) + anotherTextFromSystem.height(withConstrainedWidth: view.frame.width, font: R.font.openSans(size: 14)!) + 150
            view.layoutIfNeeded()
        case .cancelAppointment:
            setButtonTitle(leftButtonTitle: R.string.localizable.cancelButton().uppercased(), rightButtonTitle: R.string.localizable.rejectButton().uppercased())
            let textFromSystem = R.string.localizable.cancelAppointment()
            //missing assets
            topStackView.addArrangedSubview(createImageView(image: R.image.cancel_popup_image()!, height: 150))
            topStackView.addArrangedSubview(createLabel(with: textFromSystem, font: R.font.openSansBold(size: 15)!))
            topStackViewHeight.constant = textFromSystem.height(withConstrainedWidth: view.frame.width, font: R.font.openSansBold(size: 15)!) + 250
            view.layoutIfNeeded()
        case .logoutPopup(let email):
            setButtonTitle(leftButtonTitle: R.string.localizable.yes().uppercased(), rightButtonTitle: R.string.localizable.no().uppercased())
            let text = "Weet je zeker dat je\n \(email) \nuit wilt loggen?"
            topStackView.addArrangedSubview(createImageView(image: R.image.popUp_logout()!, height: 150))
            topStackView.addArrangedSubview(createLabel(with: text, font: R.font.openSans(size: 16)!, attributedText: email, attributes: [.font: R.font.openSansBold(size: 16)!]))

            topStackViewHeight.constant = text.height(withConstrainedWidth: view.frame.width, font: R.font.openSansBold(size: 16)!) + 200
            view.layoutIfNeeded()

        default: // Add More Case
            return
        }
    }

    func setupLayout() {
        guard let popupType = popupType else {
            return
        }

        contentView.layer.cornerRadius = 4
        contentView.layer.masksToBounds = true
        rightButton.setTitleColor(.white, for: .normal)
        leftButton.setTitleColor(R.color.appDimGray(), for: .normal)
        leftButton.addTarget(self, action: #selector(tappedLeftButton), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(tappedRightButton), for: .touchUpInside)
        rightButton.addBorder(side: .top, color: R.color.appDimGray()!, width: 1)
        leftButton.addBorder(side: .top, color: R.color.appDimGray()!, width: 1)
        leftButton.addBorder(side: .right, color: R.color.appDimGray()!, width: 1)
        switch popupType {
        case .checkOff, .reminder, .addNewTask, .newSuggestDate, .dateConfirmed, .loginPopup, .dateAdded, .holidayMessage, .newIncomingMOM, .downloadChat, .notEnoughCredit, .confirmPurchase:
            //swiftlint:disable:next discouraged_object_literal
            rightButton.backgroundColor = #colorLiteral(red: 0.2470588235, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        default:
            //swiftlint:disable:next discouraged_object_literal
            rightButton.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.3137254902, blue: 0.2862745098, alpha: 1)
        }
    }
}
private extension CustomPopupWithTwoButtonsViewController {
    func createImageView(image: UIImage, height: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }

    func createLabel(with text: String, font: UIFont, attributedText: String? = nil, attributes: [NSAttributedString.Key: Any]? = nil) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = font
        label.textAlignment = .center
        label.textColor = R.color.appDimGray()
        if let attributedText = attributedText, let attributes = attributes {
            let attributedQuote = NSMutableAttributedString(string: text)
            let range = (text as NSString).range(of: attributedText)
            attributedQuote.addAttributes(attributes, range: range)
            label.attributedText = attributedQuote
        } else {
            label.text = text
        }
        return label
    }

    func setButtonTitle(leftButtonTitle: String, rightButtonTitle: String) {
        leftButton.setTitle(leftButtonTitle, for: .normal)
        rightButton.setTitle(rightButtonTitle, for: .normal)
    }

    func dismissPopup() {
        UIView.animate(withDuration: 0.3,
                       animations: { [weak self] in
            self?.overlayView.alpha = 0
        }) { _ in
            self.dismiss(animated: true, completion: nil)
        }
    }
}

@objc extension CustomPopupWithTwoButtonsViewController {

    func tappedLeftButton() {
        guard let popupType = popupType else { return }
        switch popupType {
            case .logoutPopup:
                // Should refactor naming
                delegate?.tappedRightButton()
                dismissPopup()
            default:
                dismissPopup()
        }
    }
    func tappedRightButton() {
        // maybe there are some cases that we don't dismiss the popup
        // after clicking on right button
        guard let popupType = popupType else { return }
        switch popupType {
        case .cancelAppointment, .dateConfirmed:
            delegate?.tappedRightButton()
            dismissPopup()
        case .logoutPopup:
            dismissPopup()
        default:
            delegate?.tappedRightButton()
        }
    }
}

enum TwoButtonsPopupType {
    // right Button with dark blue color
    case checkOff, reminder, addNewTask, newSuggestDate(date: String, name: String), dateConfirmed(date: AppointmentDateViewModel)
    case loginPopup, dateAdded, holidayMessage, newIncomingMOM, downloadChat, notEnoughCredit, confirmPurchase
    // right Button with Red color
    case cancelAppointment, deleteMessage, excuseFromAMeeting, deleteMOM, deleteMemo, deleteAccount, logoutPopup(email: String)

    var color: UIColor {
        switch self {
        case .checkOff, .reminder, .addNewTask, .newSuggestDate, .dateConfirmed, .loginPopup, .dateAdded, .holidayMessage, .newIncomingMOM, .downloadChat, .notEnoughCredit, .confirmPurchase:
            //swiftlint:disable:next discouraged_object_literal
            return #colorLiteral(red: 0.2470588235, green: 0.3294117647, blue: 0.6980392157, alpha: 1)
        default:
            //swiftlint:disable:next discouraged_object_literal
            return #colorLiteral(red: 0.9490196078, green: 0.3137254902, blue: 0.2862745098, alpha: 1)
        }
    }

    var image: UIImage {
        switch self {
        case .dateConfirmed:
            //swiftlint:disable:next discouraged_object_literal
            return #imageLiteral(resourceName: "img_calendar_feestdagen@1x.png")
        default:
            //swiftlint:disable:next discouraged_object_literal
            return #imageLiteral(resourceName: "img_calendar_feestdagen@1x.png")
        }
    }
}

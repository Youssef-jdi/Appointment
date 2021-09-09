////
////  InvitationPopUp.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 25.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class InvitationPopUp: UIView {
//    
//    // MARK: - Outlet
//    @IBOutlet private weak var popupImage: UIImageView!
//    @IBOutlet private weak var firstDescription: UILabel!
//    @IBOutlet private weak var secondDescription: UILabel!
//    @IBOutlet private weak var leftButton: ButtonDoneRight! {
//        didSet {
//            leftButton.titleLabel?.numberOfLines = 2
//            leftButton.fillColor = ThemeService.shared.theme.firstColor!
//        }
//    }
//    @IBOutlet private weak var rightButton: ButtonDoneRight! {
//        didSet {
//            rightButton.titleLabel?.numberOfLines = 2
//            rightButton.fillColor = ThemeService.shared.theme.highlightColor!
//        }
//    }
//    
//    func configureAlert(image: UIImage, firstDesc: NSMutableAttributedString, secondDesc: NSMutableAttributedString, firstButtonTitleKey: String, secondButtonTitleKey: String) {
//        
//        popupImage.image = image
//        firstDescription.attributedText = firstDesc
//        secondDescription.attributedText = secondDesc
//        let firstButtonTitle = NSAttributedString(
//            string: firstButtonTitleKey.localized.uppercased(),
//            attributes: PopUpFontAttributes.invitationOutGoingDateSuggestionFirstButton.value
//        )
//        leftButton.setAttributedTitle(firstButtonTitle, for: .normal)
//        let secondButtonTitle = NSAttributedString(
//            string: secondButtonTitleKey.localized.uppercased(),
//            attributes: PopUpFontAttributes.invitationOutGoingDateSuggestionSecondButton.value
//        )
//        rightButton.setAttributedTitle(secondButtonTitle, for: .normal)
//    }
//}

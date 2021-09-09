//swiftlint:disable orphaned_doc_comment
////
////  PopUpFontAttributes.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 25.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//enum PopUpFontAttributes {
//    case invitationOutGoingBoldBlack
//    case invitationOutGoingBoldAppBlue
//    case invitationOutGoingDateSuggestionFirstButton
//    case invitationOutGoingDateSuggestionSecondButton
//    case generalSecondDescriptionLightGray
//    case newMemoToCancel
//    case addDataTime
//    case addDataDate
//    case denieMeetingCancelButton
//    case denieMeetingApproveButton
//    case invitationOutgoingAddToCalendar
//    case eventsDescriptionsFirst
//    case eventsDescriptionsSecond
//    
//    var value: [NSAttributedString.Key: Any] {
//        switch self {
//        case .invitationOutGoingBoldBlack:
//            return [
//                .font: R.font.openSansBold(size: 12)!,
//                .foregroundColor: R.color.appGray()!
//            ]
//        case .invitationOutGoingBoldAppBlue:
//            return[
//                .font: R.font.openSansBold(size: 14)!,
//                .foregroundColor: R.color.appBlue()!
//            ]
//        case .invitationOutGoingDateSuggestionFirstButton:
//            return [
//                .font: R.font.openSansBold(size: 18)!,
//                .foregroundColor: UIColor.white
//            ]
//        case .invitationOutGoingDateSuggestionSecondButton:
//            return [
//                .font: R.font.openSansBold(size: 18)!,
//                .foregroundColor: UIColor.white
//            ]
//        case .generalSecondDescriptionLightGray:
//            return [
//                .font: R.font.openSans(size: 14)!,
//                .foregroundColor: R.color.appDimGray()!
//            ]
//        case .addDataTime:
//            return [
//                .foregroundColor: R.color.appGray()!,
//                .font: R.font.openSansBold(size: 16)!
//            ]
//        case .addDataDate:
//            return [
//                .foregroundColor: R.color.appBlue()!,
//                .font: R.font.openSansBold(size: 20)!
//            ]
//        case .denieMeetingCancelButton:
//            return [
//                .font: R.font.openSans(size: 20)!,
//                .foregroundColor: UIColor.white
//            ]
//        case .denieMeetingApproveButton:
//            return [
//                .font: R.font.openSans(size: 20)!,
//                .foregroundColor: UIColor.white
//            ]
//        case .invitationOutgoingAddToCalendar:
//            return [
//                .foregroundColor: R.color.appGray()!,
//                .font: R.font.openSansBold(size: 14)!
//            ]
//        case .newMemoToCancel:
//            return [
//                .foregroundColor: UIColor.white,
//                .font: R.font.openSansBold(size: 14)!
//            ]
//        case .eventsDescriptionsFirst:
//            return [
//                .foregroundColor: UIColor.black,
//                .font: R.font.openSansBold(size: 18)!
//            ]
//        case .eventsDescriptionsSecond:
//            return [
//                .foregroundColor: ThemeService.shared.theme.highlightColor!,
//                .font: R.font.openSansBold(size: 18)!
//            ]
//        }
//    }
//}

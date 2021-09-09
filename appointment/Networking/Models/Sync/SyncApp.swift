//
//  SyncApp.swift
//  appointment
//
//  Created by Rachel Polachova on 06/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

enum SyncApp: CaseIterable {
    case facebook
    case gmail
    case outlook
    case yahoo
    case contacts
    
    var image: UIImage? {
        switch self {
        case .facebook:
            return R.image.facebook()
        case .gmail:
            return R.image.gmail()
        case .outlook:
            return R.image.outlook()
        case .yahoo:
            return R.image.yahooLogo()
        case .contacts:
            return R.image.contacts()
        }
    }
    
    var color: UIColor? {
        switch self {
        case .facebook:
            return R.color.appFacebookBlue()
        case .gmail:
            return R.color.appGmailRed()
        case .outlook:
            return R.color.appOutlookBlue()
        case .yahoo:
            return R.color.appYahooPurple()
        case .contacts:
            return R.color.appContactsGray()
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .facebook:
            return "Facebook"
        case .gmail:
            return "Gmail"
        case .outlook:
            return "Outlook"
        case .yahoo:
            return "Yahoo"
        case .contacts:
            return "contacts from your device"
        }
    }
}

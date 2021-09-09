//
//  SideMenuModel.swift
//  appointment
//
//  Created by Raluca Mesterca on 26/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

class SideMenuCellModel {
    var type: SideMenuCellType
    var descriptionText: String
    var image: UIImage?
    var notificationText: String?

    init (
        type: SideMenuCellType,
        descriptionText: String,
        image: UIImage? = nil,
        notificationText: String? = nil
    ) {
        self.type = type
        self.descriptionText = descriptionText
        self.image = image
        self.notificationText = notificationText
    }
}

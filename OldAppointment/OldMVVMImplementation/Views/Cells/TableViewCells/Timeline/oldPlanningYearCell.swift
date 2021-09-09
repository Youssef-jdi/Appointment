////
////  PlanningYearCell.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 22.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class PlanningYearCell: UITableViewCell {
//    @IBOutlet private weak var dateNumberLabel: UILabel!
//    @IBOutlet private weak var dateNameLabel: UILabel!
//    @IBOutlet private weak var descriptionLabel: UILabel!
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//    func prepareCell(dateName: String, dateNumber: String, desc: String) {
//        self.dateNameLabel.text = dateName
//        self.dateNumberLabel.text = dateNumber
//        self.descriptionLabel.text = desc
//    }
//}
//extension PlanningYearCell: Themeable {
//    func applyTheme(theme: ProductModel) {
//        dateNameLabel.textColor = theme.highlightColor
//        dateNumberLabel.textColor = theme.highlightColor
//    }
//}

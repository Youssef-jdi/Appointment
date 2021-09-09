////
////  DateCell.swift
////  appointment
////
////  Created by Dylan Barteling on 18/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class DateCell: UITableViewCell {
//    
//    private var currentDate = Date()
//    
//    @IBOutlet private weak var backgroundImage: UIImageView!
//    @IBOutlet private weak var dateNumberLabel: UILabel! {
//        didSet {
//            dateNumberLabel.text = String(format: "%02d", currentDate.day)
//        }
//    }
//    @IBOutlet private weak var monthLabel: UILabel! {
//        didSet {
//            monthLabel.text = currentDate.localizedDateString(dateFormat: Date.DateFormats.monthName.rawValue)
//        }
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        selectionStyle = .none
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//    @IBOutlet private var headerLabels: [UILabel]! {
//        didSet {
//            headerLabels[0].text = "appointments".localized.uppercased()
//            headerLabels[1].text = "memos".localized.uppercased()
//            headerLabels[2].text = "standart".localized.capitalizingFirstLetter()
//            headerLabels[3].text = "forBusiness".localized.capitalizingFirstLetter()
//            headerLabels[4].text = "group".localized.capitalizingFirstLetter()
//            headerLabels[5].text = "memo".localized.capitalizingFirstLetter()
//            headerLabels[6].text = "memoToHome".localized.capitalizingFirstLetter()
//            headerLabels[7].text = "M.O.M".localized.uppercased()
//        }
//    }
//}
//
//extension DateCell: Themeable {
//    func applyTheme(theme: ProductModel) {
//        contentView.backgroundColor = theme.backgroundColor
//    }
//}

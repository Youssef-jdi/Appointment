////
////  PlanningDateViewCollectionViewCell.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 7.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import JTAppleCalendar
//class PlanningDateViewCollectionViewCell: JTAppleCell {
//    @IBOutlet private weak var dateLabel: UILabel!
//    @IBOutlet private var stateViews: [UIView]! {
//        didSet {
//            stateViews.forEach {
//                $0.layer.cornerRadius = $0.frame.width / 2
//                $0.clipsToBounds = true
//                $0.backgroundColor = ThemeService.shared.theme.firstColor
//            }
//            hasAppointmentTomorrow()
//        }
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//    func prepareCell(dateString: String) {
//        dateLabel.text = dateString
//    }
//    
//    func hideRoundedCircle() {
//        stateViews[1].isHidden = true
//    }
//    
//    func hasAppointment() {
//        stateViews[0].isHidden = true
//        stateViews[1].isHidden = false
//    }
//    
//    func hasAppointmentTomorrow() {
//        stateViews[0].layer.borderColor = ThemeService.shared.theme.firstColor!.cgColor
//        stateViews[0].layer.borderWidth = 2
//        stateViews[0].backgroundColor = .clear
//        stateViews[1].isHidden = false
//    }
//    
//    func makeTheCircleRed() {
//        stateViews[0].backgroundColor = ThemeService.shared.theme.highlightColor
//        dateLabel.textColor = ThemeService.shared.theme.firstColor
//    }
//}
//extension PlanningDateViewCollectionViewCell: Themeable {
//    func applyTheme(theme: ProductModel) {
//        dateLabel.textColor = theme.firstColor
//    }
//}

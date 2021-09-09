////
////  HomeTableViewCell.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 1.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class HomeTableViewCell: UITableViewCell {
//    
//    private var maxDayNumber = 7
//    private var minDayNumber = 1
//    private var lineViewVisibilityIsSet = false
//    
//    override var reuseIdentifier: String? { return "HomeTableViewCell" }
//    // MARK: RedStroke Views
//    
//    @IBOutlet private var strokeViews: [UIView]!
//    @IBOutlet private var lineViews: [UIView]!
//    @IBOutlet private weak var appointmentLineView: UIView!
//    @IBOutlet private weak var weekLabel: UILabel!
//    @IBOutlet private weak var currentMonthLabel: UILabel! {
//        didSet {
//            currentMonthLabel.alpha = 0
//        }
//    }
//    @IBOutlet private weak var nextMonthLabel: UILabel! {
//        didSet {
//            nextMonthLabel.alpha = 0
//        }
//    }
//    @IBOutlet private weak var stackView: UIStackView!
//    @IBOutlet private var dayStackViews: [DayStackView]!
//    @IBOutlet private weak var monthBreakerLineLeadingConstraint: NSLayoutConstraint!
//    @IBOutlet private var monthBreakerLines: [UIView]! {
//        didSet {
//            monthBreakerLines.forEach {
//                $0.isHidden = true
//                $0.backgroundColor = ThemeService.shared.theme.firstColor
//            }
//        }
//    }
//    
//    override func layoutIfNeeded() {
//        super.layoutIfNeeded()
//        lineViews.forEach {
//            $0.backgroundColor = .clear
//            $0.drawDottedLine(cgColor: ThemeService.shared.theme.firstColor!.cgColor)
//        }
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        removeCellAttributes()
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        ThemeService.shared.addThemeable(themable: self)
//        selectionStyle = .none
//    }
//    
//    func prepareCell(homeCellModel: [HomeCellModel]) {
//        for (index, item) in homeCellModel.enumerated() {
//            dayStackViews[index].prepareStackView(notificationCount: item.notificationCount, socialImage: item.syncImage, appointmentTypeImage: item.appointmentImage, dayCount: item.day.description)
//            if item.dayIndice != nil {
//                strokeViews[index].backgroundColor = .clear
//            }
//            if item.date.isEndOfMonth {
//                setConstraintConstantForMonthBreaking(index: index)
//                currentMonthLabel.text = item.date.localizedDateString(dateFormat: Date.DateFormats.monthName.rawValue)
//                handleLineVisibility(endOfWeek: item.date.isEndOfWeek)
//            } else {
//                if !lineViewVisibilityIsSet {
//                    lineViewsDefaultVisibility()
//                }
//            }
//        }
//        // this 7 and 1 checks for new begining month 7 maximum day number
//        if homeCellModel.first!.day <= maxDayNumber  && homeCellModel.first!.day >= minDayNumber {
//            nextMonthLabel.alpha = 1
//            currentMonthLabel.alpha = 0
//            nextMonthLabel.text = homeCellModel.first?.date.localizedDateString(dateFormat: Date.DateFormats.monthName.rawValue)
//            lineViews.forEach { $0.isHidden = true }
//        }
//    }
//    
//    func prepareWeekLabel(text: String?) {
//        self.weekLabel.text = text
//    }
//    
//    private func lineViewsDefaultVisibility() {
//        lineViewVisibilityIsSet = true
//        lineViews[0].isHidden = false
//        lineViews[1].isHidden = true
//    }
//    private func handleLineVisibility(endOfWeek: Bool) {
//        lineViewVisibilityIsSet = true
//        nextMonthLabel.alpha = 0
//        currentMonthLabel.alpha = 1
//        lineViews.forEach { $0.isHidden = false }
//        if endOfWeek {
//            monthBreakerLines[0].isHidden = false
//        } else {
//            monthBreakerLines.forEach { $0.isHidden = false }
//        }
//    }
//    
//    private func setConstraintConstantForMonthBreaking(index: Int) {
//        let dividedValue = self.stackView.frame.width / CGFloat(self.strokeViews.count)
//        self.monthBreakerLineLeadingConstraint.constant = CGFloat(dividedValue * CGFloat(index + 1))
//    }
//    
//    private func removeCellAttributes() {
//        currentMonthLabel.alpha = 0
//        nextMonthLabel.alpha = 0
//        dayStackViews.forEach { $0.removeAllProperties() }
//        strokeViews.forEach { $0.backgroundColor = ThemeService.shared.theme.highlightColor }
//        monthBreakerLineLeadingConstraint.constant = 0
//        monthBreakerLines.forEach { $0.isHidden = true }
//        lineViews.forEach { $0.isHidden = false }
//        lineViewVisibilityIsSet = false
//    }
//}
//
//extension HomeTableViewCell: Themeable {
//    func applyTheme(theme: ProductModel) {
//        weekLabel.textColor = theme.highlightColor
//        nextMonthLabel.textColor = theme.highlightColor
//        currentMonthLabel.textColor = theme.highlightColor
//        appointmentLineView.backgroundColor = theme.firstColor
//        lineViews.forEach { $0.backgroundColor = theme.highlightColor }
//        monthBreakerLines.forEach { $0.backgroundColor = theme.firstColor }
//        strokeViews.forEach { $0.backgroundColor = theme.highlightColor }
//        lineViews.forEach {
//            $0.layer.sublayers?.popLast()
//            $0.backgroundColor = .clear
//            $0.drawDottedLine(cgColor: theme.firstColor!.cgColor)
//        }
//    }
//}

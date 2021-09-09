////
////  PlanningDateView.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 7.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import JTAppleCalendar
//
//protocol PlanningDateViewDelegate: class {
//    func scrollToDate(date: Date)
//}
//
//class PlanningDateView: UIView {
//    
//    @IBOutlet private weak var contentView: UIView!
//    @IBOutlet private var weekIndexLabels: [UILabel]!
//    @IBOutlet private weak var weekDayContainerView: UIView! {
//        didSet {
//            weekDayContainerView.backgroundColor = ThemeService.shared.theme.firstColor
//        }
//    }
//    @IBOutlet private weak var calendarCollection: JTAppleCalendarView! {
//        didSet {
//            calendarCollection.register(UINib(resource: R.nib.planningDateViewCollectionViewCell), forCellWithReuseIdentifier: R.reuseIdentifier.planningDateViewCollectionViewCell.identifier)
//            calendarCollection.minimumLineSpacing = 0
//            calendarCollection.minimumInteritemSpacing = 0
//        }
//    }
//    
//    var currentSection = 0
//    
//    weak var delegate: PlanningDateViewDelegate?
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.commontInit()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.commontInit()
//    }
//    
//    private func commontInit() {
//        Bundle.main.loadNibNamed(R.nib.planningDateView.name, owner: self, options: nil)
//        addSubview(contentView)
//        contentView.frame = self.bounds
//        contentView.autoresizingMask = [
//            .flexibleWidth,
//            .flexibleHeight
//        ]
//        ThemeService.shared.addThemeable(themable: self)
//    }
//}
//
//extension PlanningDateView: Themeable {
//    func applyTheme(theme: ProductModel) {
//        weekIndexLabels.forEach { $0.textColor = theme.highlightColor }
//        weekDayContainerView.backgroundColor = theme.firstColor
//    }
//}
//extension PlanningDateView: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
//    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
//        guard let cell = calendar.cellForItem(at: indexPath) as? PlanningDateViewCollectionViewCell  else { return }
//        cell.prepareCell(dateString: cellState.text)
//    }
//    
//    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
//        let date = Date().firstDayOfTheYear()
//        let endDate = date.addingComponent(value: 1, for: .year)
//        let parameters = ConfigurationParameters(startDate: date, endDate: endDate)
//        return parameters
//    }
//    
//    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
//        guard let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: R.reuseIdentifier.planningDateViewCollectionViewCell.identifier, for: indexPath) as?  PlanningDateViewCollectionViewCell  else { return JTAppleCell() }
//        cell.prepareCell(dateString: cellState.text)
//        return cell
//    }
//    
//    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
//        self.delegate?.scrollToDate(date: date)
//    }
//    
//    func calendarDidScroll(_ calendar: JTAppleCalendarView) {
//        guard let current = calendar.currentSection() else { return }
//        
//        for (index, weekLabel) in weekIndexLabels.enumerated() {
//            if current == 0 {
//                weekLabel.text = (index + 1).description
//            } else {
//                weekLabel.text = "\((current * 5) + (index + 1))"
//            }
//        }
//    }
//}

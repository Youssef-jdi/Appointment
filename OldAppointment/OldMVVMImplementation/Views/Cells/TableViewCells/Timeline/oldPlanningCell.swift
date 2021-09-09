////
////  PlanningCell.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 7.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class PlanningCell: UITableViewCell {
//    
//    @IBOutlet private weak var stackView: UIStackView!
//    @IBOutlet private weak var lineView: UIView! {
//        didSet {
//            lineView.backgroundColor = ThemeService.shared.theme.highlightColor
//        }
//    }
//    @IBOutlet private weak var dayNameLabel: UILabel! {
//        didSet {
//            dayNameLabel.textColor = ThemeService.shared.theme.firstColor
//        }
//    }
//    @IBOutlet private weak var dayNumberLabel: UILabel! {
//        didSet {
//            dayNumberLabel.textColor = ThemeService.shared.theme.firstColor
//        }
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        clearViewsOnReUse()
//    }
//    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
//    
//    func prepareDateLabel(dayNumber: String, dayName: String) {
//        dayNumberLabel.text = dayNumber
//        dayNameLabel.text = dayName
//    }
//    
//    func prepareViews(delegate: PlanningViewDelegate, model: [PlanningAppointmentModel]) {
//        let views = model.compactMap { (item: PlanningAppointmentModel) -> UIView in
//            let view = OldPlanningView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width * 0.6, height: 100))
//            view.dataModel = item
//            view.delegate = delegate
//            view.prepareColorAndImage(color: item.color, image: item.image)
//            view.prepareView()
//            return view
//        }
//        views.forEach(stackView.addArrangedSubview)
//    }
//    
//    private func clearViewsOnReUse() {
//        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
//    }
//}
//
//extension PlanningCell: Themeable {
//    func applyTheme(theme: ProductModel) {
//        dayNameLabel.textColor = theme.highlightColor
//        dayNumberLabel.textColor = theme.highlightColor
//        lineView.backgroundColor = ThemeService.shared.theme.highlightColor
//    }
//}

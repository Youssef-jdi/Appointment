////
////  PlanningYearHeaderView.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 2.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class PlanningYearHeaderView: UIView, Themeable {
//    
//    @IBOutlet private weak var monthLabel: UILabel! {
//        didSet {
//            monthLabel.textColor = ThemeService.shared.theme.highlightColor
//            monthLabel.font = R.font.openSansBold(size: 18)!
//        }
//    }
//    
//    @IBOutlet private weak var contentView: UIView!
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
//        Bundle.main.loadNibNamed(R.nib.planningYearHeaderView.name, owner: self, options: nil)
//        addSubview(contentView)
//        contentView.frame = self.bounds
//        contentView.autoresizingMask = [
//            .flexibleWidth,
//            .flexibleHeight
//        ]
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//    func setMonth(text: String) {
//        monthLabel.text = text
//    }
//    
//    func applyTheme(theme: ProductModel) {
//        monthLabel.textColor = theme.highlightColor
//    }
//}

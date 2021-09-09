////
////  TimelineMenu.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 7.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//protocol TimelineDelegate: class {
//    func timelinePressed()
//    func yearPressed()
//    func monthPressed()
//    func dayPressed()
//    func planningPressed()
//    func searchPressed()
//}
//
//class TimelineMenu: UIView {
//    
//    @IBOutlet private weak var contentView: UIView!
//    @IBOutlet private var menuItems: [UIButton]! {
//        didSet {
//            menuItems[0].setTitle("timeline".localized.uppercased(), for: .normal)
//            menuItems[1].setTitle("year".localized.uppercased(), for: .normal)
//            menuItems[2].setTitle("month".localized.uppercased(), for: .normal)
//            menuItems[3].setTitle("day".localized.uppercased(), for: .normal)
//            menuItems[4].setTitle("planning".localized.uppercased(), for: .normal)
//            menuItems[5].setTitle("search".localized.uppercased(), for: .normal)
//        }
//    }
//    
//    weak var delegate: TimelineDelegate?
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
//        Bundle.main.loadNibNamed(R.nib.timelineMenu.name, owner: self, options: nil)
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
//extension TimelineMenu {
//    
//    @IBAction private  func timelinePressed(_ sender: UIButton) {
//        self.delegate?.timelinePressed()
//    }
//    
//    @IBAction private  func yearPressed(_ sender: UIButton) {
//        self.delegate?.yearPressed()
//    }
//    
//    @IBAction private  func monthPressed(_ sender: UIButton) {
//        self.delegate?.monthPressed()
//    }
//    
//    @IBAction private  func dayPressed(_ sender: UIButton) {
//        self.delegate?.dayPressed()
//    }
//    
//    @IBAction private  func planningPressed(_ sender: UIButton) {
//        self.delegate?.planningPressed()
//    }
//    
//    @IBAction private  func searchPressed(_ sender: UIButton) {
//        self.delegate?.searchPressed()
//    }
//}
//
//extension TimelineMenu: Themeable {
//    func applyTheme(theme: ProductModel) {
//        menuItems.forEach {
//            $0.tintColor = theme.firstColor
//            $0.setTitleColor(theme.firstColor, for: .normal)
//        }
//    }
//}

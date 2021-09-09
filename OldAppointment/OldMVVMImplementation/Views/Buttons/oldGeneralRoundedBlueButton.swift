////
////  GeneralRoundedBlueButton.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 26.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//enum GeneralRoundedButtonType {
//    case blue, noBackground
//    
//    var backgroundColor: UIColor? {
//        switch self {
//        case .blue:
//            return ThemeService.shared.theme.highlightColor
//        case .noBackground:
//            return ThemeService.shared.theme.firstColor
//        }
//    }
//    
//    var borderColor: CGColor? {
//        switch self {
//        case .blue, .noBackground:
//            return nil
//        }
//    }
//    
//    var titleColor: UIColor {
//        switch self {
//        case .blue, .noBackground:
//            return .white
//        }
//    }
//    
//    var image: UIImage? {
//        switch self {
//        case .blue:
//            return nil
//        case .noBackground:
//            return R.image.arrow_Right_Black()!
//        }
//    }
//}
//
//class GeneralRoundedButton: UIButton {
//    
//    var type: GeneralRoundedButtonType! {
//        didSet {
//            backgroundColor = type.backgroundColor
//            tintColor = .white
//            setTitleColor(type.titleColor, for: .normal)
//            guard let image = type.image else { return }
//            setImage(image, for: .normal)
//        }
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.setupButton()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupButton()
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupButton()
//    }
//    
//    /// setups the current view
//    private func setupButton() {
//        ThemeService.shared.addThemeable(themable: self)
//        clipsToBounds = true
//        layer.cornerRadius = layer.frame.height / 2
//        self.imageEdgeInsets.left = self.layer.frame.width * 0.9
//        self.target(forAction: #selector(touchPressed), withSender: nil)
//    }
//    
//    @objc private func touchPressed() {
//        let generator = UISelectionFeedbackGenerator()
//        generator.selectionChanged()
//    }
//}
//
//extension GeneralRoundedButton: Themeable {
//    func applyTheme(theme: ProductModel) {
//        guard let type = type else { return }
//        switch type {
//        case .blue:
//            backgroundColor = theme.highlightColor
//        case .noBackground:
//            backgroundColor = theme.firstColor
//        }
//    }
//}

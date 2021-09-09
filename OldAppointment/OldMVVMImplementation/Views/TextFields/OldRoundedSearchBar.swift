////
////  RoundedSearchBar.swift
////  appointment
////
////  Created by Dylan Barteling on 28/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//@IBDesignable
//class RoundedSearchBar: UISearchBar {
//    
//    private var themeColor: UIColor = R.color.appDimGray()!
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupTextField()
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupTextField()
//    }
//    
//    /// setups the TextField
//    private func setupTextField() {
//        ThemeService.shared.addThemeable(themable: self)
//        returnKeyType = .search
//        tintColor = .white
//        barTintColor = .white
//        backgroundColor = themeColor
//        
//        guard let textfield = value(forKey: "searchField") as? UITextField,
//            let backgroundview = textfield.subviews.first else { return }
//        textfield.superview!.subviews.first!.alpha = 0
//        
//        // Background color
//        backgroundview.backgroundColor = themeColor
//        
//        // Rounded corner
//        backgroundview.layer.cornerRadius = 10
//        backgroundview.clipsToBounds = true
//    }
//}
//
//extension RoundedSearchBar: Themeable {
//    func applyTheme(theme: ProductModel) {
//        themeColor = theme.firstColor!
//    }
//}

////
////  LoadingView.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 4.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class OldLoadingView: UIView {
//    @IBOutlet private weak var contentView: UIView!
//    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView! {
//        didSet {
//            activityIndicator.style = .whiteLarge
//            activityIndicator.hidesWhenStopped = true
//            activityIndicator.startAnimating()
//            activityIndicator.color = ThemeService.shared.theme.firstColor
//        }
//    }
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
//    func addToWindow() {
//        guard let window = UIApplication.shared.keyWindow else { return }
//        window.addSubview(self)
//    }
//    
//    func removeFromWindow() {
//        guard let window = UIApplication.shared.keyWindow else { return }
//        for view in window.subviews where view is OldLoadingView {
//            view.removeFromSuperview()
//        }
//    }
//    
//    private func commontInit() {
//        Bundle.main.loadNibNamed(R.nib.oldLoadingView.name, owner: self, options: nil)
//        addSubview(contentView)
//        contentView.frame = self.bounds
//        contentView.autoresizingMask = [
//            .flexibleWidth,
//            .flexibleHeight
//        ]
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//}
//
//extension OldLoadingView: Themeable {
//    func applyTheme(theme: ProductModel) {
//        activityIndicator.color = theme.firstColor
//    }
//}

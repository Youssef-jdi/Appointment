////
////  SideMenuHeaderView.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 2.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class SideMenuHeaderView: UITableViewCell {
//    
//    @IBOutlet private weak var profileImageView: RoundedImageView! {
//        didSet {
//            profileImageView.color = R.color.appGray()!
//        }
//    }
//    @IBOutlet private weak var emailLabel: UILabel! {
//        didSet {
//            emailLabel.textColor = .white
//            emailLabel.font = R.font.openSans(size: 16)
//        }
//    }
//    @IBOutlet private weak var fullNameLabel: UILabel! {
//        didSet {
//            fullNameLabel.textColor = .white
//            fullNameLabel.font = R.font.openSansBold(size: 18)
//        }
//    }
//    
//    public func prepareHeaderData(image: UIImage?, email: String, fullname: String) {
//        self.profileImageView.image = image
//        self.emailLabel.text = email
//        self.fullNameLabel.text = fullname
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        selectionStyle = .none
//        ThemeService.shared.addThemeable(themable: self)
//    }
//}
//
//extension SideMenuHeaderView: Themeable {
//    func applyTheme(theme: ProductModel) {
//        
//        profileImageView.color = theme.highlightColor
//        contentView.backgroundColor = theme.backgroundColor
//    }
//}

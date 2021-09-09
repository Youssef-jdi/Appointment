////
////  InvitationTableViewCell.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 06/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class InvitationTableViewCell: UITableViewCell {
//
//    @IBOutlet private weak var cellImage: UIImageView!
//    @IBOutlet private weak var cellTitle: UILabel!
//    @IBOutlet private weak var cellSubtitle: UILabel!
//    @IBOutlet private weak var cellDescription: UILabel!
//    @IBOutlet private weak var arrowImageView: UIImageView! {
//        didSet {
//            arrowImageView.tintColor = ThemeService.shared.theme.firstColor
//            arrowImageView.contentMode = .scaleAspectFit
//        }
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        ThemeService.shared.addThemeable(themable: self)
//    }
//    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    
//    func prepareCell(title: String) {
//        cellTitle.text = title
//    }
//}
//
//extension InvitationTableViewCell: Themeable {
//    func applyTheme(theme: ProductModel) {
//        arrowImageView.tintColor = theme.firstColor
//    }
//}

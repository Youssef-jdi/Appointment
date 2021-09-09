////
////  UpgradeCollectionViewCell.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 13.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import Nuke
//
//enum UpgradeCellState {
//    case upgrade(Bool)
//    case theme(Bool)
//    case background(Bool)
//}
//
//class UpgradeCollectionViewCell: UICollectionViewCell {
//    override var reuseIdentifier: String? { return "UpgradeCollectionViewCell" }
//    
//    @IBOutlet private weak var creditLabel: UILabel! {
//        didSet {
//            creditLabel.font = R.font.notoSans(size: 14)
//            creditLabel.textColor = R.color.appDimGray()
//        }
//    }
//    @IBOutlet private weak var themeNameLabel: UILabel! {
//        didSet {
//            themeNameLabel.font = R.font.notoSans(size: 15)
//        }
//    }
//    
//    @IBOutlet private weak var themeImageView: UIImageView! {
//        didSet {
//            themeImageView.contentMode = .scaleAspectFit
//        }
//    }
//    
//    @IBOutlet private weak var  isInUseImageView: UIImageView! {
//        didSet {
//            isInUseImageView.layer.cornerRadius = isInUseImageView.frame.width / 2
//            isInUseImageView.clipsToBounds = true
//            isInUseImageView.isHidden = true
//            isInUseImageView.layer.borderWidth = 1
//            isInUseImageView.layer.borderColor = R.color.appBlue()!.cgColor
//            isInUseImageView.backgroundColor = .white
//        }
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        clearCell()
//    }
//    
//    private func clearCell() {
//        creditLabel.textColor = nil
//        themeNameLabel.textColor = nil
//    }
//    
//    func configure(state: UpgradeCellState, product: ProductModel) {
//        creditLabel.text = product.price.localizedPrice
//        themeNameLabel.text = product.name
//        switch state {
//        case .upgrade(let isAvailable):
//            if isAvailable {
//                creditLabel.text = "bought".localized.capitalizingFirstLetter()
//                creditLabel.font = R.font.notoSans(size: 16)
//                creditLabel.textColor = R.color.appDimGray()
//            } else {
//                isInUseImageView.isHidden = true
//                creditLabel.font = R.font.openSansBold(size: 16)
//                creditLabel.textColor = R.color.appBlue()
//            }
//        case .theme(let isInUse):
//            self.themeOrBackgroundConfiguration(isInUse: isInUse)
//        case .background(let isInUse):
//            self.themeOrBackgroundConfiguration(isInUse: isInUse)
//        }
//        setImage(product: product)
//    }
//    
//    private func setImage(product: ProductModel) {
//        if let imageUrl = product.backgroundImageUrl, let url = URL(string: imageUrl) {
//            Nuke.loadImage(
//                with: url,
//                options: ImageLoadingOptions(
//                    placeholder: R.image.sample_upgrade()!,
//                    transition: .fadeIn(duration: 0.33)
//                ),
//                into: themeImageView
//            )
//        } else {
//            switch product.type {
//            case .theme:
//                themeImageView.image = R.image.sample_upgrade()!
//            case .background:
//                themeImageView.image = nil
//            }
//        }
//    }
//    
//    private func themeOrBackgroundConfiguration(isInUse: Bool) {
//        isInUseImageView.isHidden = false
//        creditLabel.textColor = R.color.appDimGray()
//        if isInUse {
//            isInUseImageView.image = R.image.checkbox_On()!
//            creditLabel.text = "selected".localized.capitalizingFirstLetter()
//        } else {
//            isInUseImageView.image = R.image.checkbox_Off()!
//            creditLabel.text = String()
//            isInUseImageView.image = nil
//        }
//    }
//}

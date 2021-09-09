////
////  ThemeDetailViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 13.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class ThemeDetailViewController: BaseViewController, Storyboardable {
//    static var storyboardName: String { return "Upgrades" }
//    
//    static var storyboardIdentifier: String { return "ThemeDetailViewController" }
//    
//    @IBOutlet private weak var creditCountLabel: UILabel! {
//        didSet {
//            creditCountLabel.text = R.string.localizable.myCredits.key.localizedWithCount(count: 2) .uppercased()
//            creditCountLabel.font = R.font.notoSans(size: 16)
//            creditCountLabel.textColor = R.color.appGray()
//        }
//    }
//    
//    @IBOutlet private weak var themeNameLabel: UILabel! {
//        didSet {
//            themeNameLabel.font = R.font.notoSans(size: 16)
//            themeNameLabel.textColor = R.color.appGray()
//        }
//    }
//    @IBOutlet private weak var priceLabel: UILabel! {
//        didSet {
//            priceLabel.font = R.font.notoSans(size: 16)
//            priceLabel.text = R.string.localizable.price.key.localized.uppercased()+":"
//            priceLabel.textColor = R.color.appDimGray()
//        }
//    }
//    @IBOutlet private weak var buyOrUseButton: GeneralRoundedButton! {
//        didSet {
//            buyOrUseButton.type = .blue
//            buyOrUseButton.setTitle("".localized.uppercased(), for: .normal)
//        }
//    }
//    @IBOutlet private weak var themeImage: UIImageView! {
//        didSet {
//            themeImage.contentMode = .scaleAspectFit
//        }
//    }
//    
//    var product: ProductModel?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addBackButton()
//        prepareViewForState()
//    }
//    
//    private func prepareViewForState() {
//        guard let product = product else { return }
//        themeNameLabel.text = product.name
//        switch product.cellType {
//        case .theme(let isAvailable):
//            if isAvailable {
//                priceLabel.text = R.string.localizable.price.key.localized.capitalizingFirstLetter()
//                buyOrUseButton.setTitle(R.string.localizable.buyThemeButtonTitle.key.localized.uppercased(), for: .normal)
//                buyOrUseButton.addTarget(self, action: #selector(buyTheme), for: .touchUpInside)
//            } else {
//                priceLabel.text = R.string.localizable.bought.key.localized.capitalizingFirstLetter()
//                buyOrUseButton.setTitle(R.string.localizable.useThemeButtonTitle.key.localized.uppercased(), for: .normal)
//                buyOrUseButton.addTarget(self, action: #selector(useTheme), for: .touchUpInside)
//            }
//        default: break
//        }
//    }
//    
//    @objc private func buyTheme(_ sender: UIButton) {
//        // here should be the alert controlls but its not merged
//    }
//    
//    @objc private func needCredits() {
//        let viewController = R.storyboard.upgrades.buyCreditsViewController()!
//        self.navigationController?.pushViewController(viewController, animated: true)
//    }
//    
//    @objc private func useTheme(_ sender: UIButton) {
//        guard let product = product else { return }
//        ThemeService.shared.theme = product
//        self.navigationController?.popViewController(animated: true)
//    }
//}

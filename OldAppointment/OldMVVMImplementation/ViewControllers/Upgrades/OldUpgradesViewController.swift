////
////  UpgradesViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 6.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class UpgradesViewController: BaseViewController, Storyboardable, MVVMViewController {
//    
//    static var storyboardName: String { return "Upgrades" }
//    static var storyboardIdentifier: String { return "UpgradesViewController" }
//    
//    typealias ViewModel = UpgradeViewModel
//    
//    var viewModel = UpgradeViewModel()
//    
//    @IBOutlet private weak var collectionView: UICollectionView! {
//        didSet {
//            collectionView.delegate = self
//            collectionView.dataSource = self
//        }
//    }
//    
//    @IBOutlet private weak var myCreditsLabel: UILabel! {
//        didSet {
//            myCreditsLabel.text = R.string.localizable.myCredits.key.localized.uppercased()+": 2"
//            myCreditsLabel.font = R.font.notoSans(size: 16)
//            myCreditsLabel.textColor = R.color.appGray()
//        }
//    }
//    
//    @IBOutlet private weak var buyCreditButton: GeneralRoundedButton! {
//        didSet {
//            buyCreditButton.type = .blue
//            buyCreditButton.setTitle(R.string.localizable.buyCredits.key.localized.uppercased(), for: .normal)
//            buyCreditButton.titleLabel?.font = R.font.notoSans(size: 16)
//        }
//    }
//    @IBOutlet private weak var myThemesButton: UIButton! {
//        didSet {
//            myThemesButton.setTitle(R.string.localizable.myThemes.key.localized.uppercased(), for: .normal)
//            myThemesButton.titleLabel?.font = R.font.notoSans(size: 16)
//            myThemesButton.titleLabel?.textColor = R.color.appGray()
//        }
//    }
//    @IBOutlet private weak var chatBackgroundButton: UIButton! {
//        didSet {
//            chatBackgroundButton.setTitle(R.string.localizable.chatBackground.key.localized.uppercased(), for: .normal)
//            chatBackgroundButton.titleLabel?.font = R.font.notoSans(size: 16)
//            chatBackgroundButton.titleLabel?.textColor = R.color.appGray()
//        }
//    }
//    @IBOutlet private weak var buyThemeLabel: UILabel! {
//        didSet {
//            buyThemeLabel.text = R.string.localizable.buyTheme.key.localized
//            buyThemeLabel.font = R.font.notoSans(size: 16)
//            buyThemeLabel.textColor = R.color.appGray()
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addSideMenuButton()
//        bindViewModel()
//        viewModel.fetchProductByType(product: .theme(false))
//    }
//    
//    @IBAction private func myThemesPressed(_ sender: UIButton) {
//        let viewController = R.storyboard.upgrades.productsViewController()!
//        viewController.configType = .theme(false)
//        self.show(viewController, sender: nil)
//    }
//    
//    @IBAction private func myBackgroundsPressed(_ sender: UIButton) {
//        let viewController = R.storyboard.upgrades.productsViewController()!
//        viewController.configType = .background(false)
//        self.show(viewController, sender: nil)
//    }
//}
//
//extension UpgradesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.products.products.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.upgradeCollectionViewCell.identifier, for: indexPath) as? UpgradeCollectionViewCell else { return UICollectionViewCell() }
//        let product = viewModel.products.products[indexPath.row]
//        cell.configure(state: .upgrade(product.owned), product: product)
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        guard let cell = cell as? UpgradeCollectionViewCell else { return }
//        let product = viewModel.products.products[indexPath.row]
//        cell.configure(state: .upgrade(product.owned), product: product)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let viewController = R.storyboard.upgrades.themeDetailViewController()!
//        viewController.product = viewModel.products.products[indexPath.row]
//        self.show(viewController, sender: nil)
//    }
//}
//
//private extension UpgradesViewController {
//    func bindViewModel() {
//        viewModel.stateHandler = { [weak self] state in
//            switch state {
//            case .value(let upgradeState):
//                switch upgradeState {
//                case .fetchedProductsByType:
//                    self?.collectionView.reloadData()
//                default: break
//                }
//            default:break
//            }
//        }
//    }
//}

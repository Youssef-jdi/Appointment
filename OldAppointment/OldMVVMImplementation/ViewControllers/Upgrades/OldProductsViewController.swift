////
////  ProductsViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 13.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class ProductsViewController: BaseViewController, Storyboardable, MVVMViewController {
//    
//    static var storyboardName: String { return "Upgrades" }
//    
//    static var storyboardIdentifier: String { return "ProductsViewController" }
//    
//    typealias ViewModel = UpgradeViewModel
//    
//    var viewModel = UpgradeViewModel()
//    var currentTheme = ThemeService.shared.theme
//    
//    @IBOutlet private weak var collectionView: UICollectionView! {
//        didSet {
//            collectionView.delegate = self
//            collectionView.dataSource = self
//            collectionView.contentInset.top = 16
//        }
//    }
//    
//    var configType: UpgradeCellState!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        bindViewModel()
//        addBackButton()
//        viewModel.fetchProductByType(product: configType)
//        
//        // Do any additional setup after loading the view.
//    }
//}
//
//extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.products.products.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.upgradeCollectionViewCell.identifier, for: indexPath) as? UpgradeCollectionViewCell else { return UICollectionViewCell() }
//        let product = viewModel.products.products[indexPath.row]
//        let isSelectedTheme = viewModel.checkIsCurrentTheme(for: indexPath)
//        if isSelectedTheme {
//            cell.configure(state: UpgradeCellState.theme(isSelectedTheme), product: product)
//        } else {
//            cell.configure(state: UpgradeCellState.background(isSelectedTheme), product: product)
//        }
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let products = viewModel.products else { return }
//        self.viewModel.selectProduct(index: indexPath.row)
//        switch products.products[indexPath.row].type {
//        case .theme:
//            ThemeService.shared.theme = products.products[indexPath.row]
//        case .background:
//            ThemeService.shared.chatBackground = products.products[indexPath.row]
//        }
//    }
//}
//
//private extension ProductsViewController {
//    func bindViewModel() {
//        viewModel.stateHandler = { [weak self] state in
//            switch state {
//            case .value(let upgradeState):
//                switch upgradeState {
//                case .fetchedProductsByType:
//                    self?.collectionView.reloadData()
//                case .selectedProduct:
//                    self?.collectionView.reloadData()
//                default: break
//                }
//            default:break
//            }
//        }
//    }
//}

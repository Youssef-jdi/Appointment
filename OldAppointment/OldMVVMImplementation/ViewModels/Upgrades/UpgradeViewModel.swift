////
////  UpgradeViewModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 14.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//typealias UpgradePresentationState = PresentationState<UpgradeState, ProductsError>
//
//enum UpgradeState {
//    case bought
//    case fetchedAllProducts
//    case selectedProduct
//    case fetchedProductsByType
//}
//
//class UpgradeViewModel: MVVMViewModel {
//    typealias Service = ProductService
//    
//    var service = ProductService()
//    
//    var stateHandler: ((UpgradePresentationState) -> Void)?
//    private(set) var currentState: UpgradePresentationState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//    
//    var products: ProductsModel!
//}
//
//extension UpgradeViewModel {
//    
//    func fetchAllProducts() {
//        service.fetchAllProducts { result in
//            switch result {
//            case .success(let value):
//                self.products = value
//                self.currentState = .value(UpgradeState.fetchedAllProducts)
//            case .failure(let error):
//                self.currentState = .error(ProductsError.underlying(error))
//            }
//        }
//    }
//    
//    func fetchProductByType(product type: UpgradeCellState) {
//        service.fetchProductsByType(type: type) { result in
//            switch result {
//            case .success(let value):
//                self.products = value
//                switch type {
//                case .background:
//                    self.products.products.insert(defaultBackground, at: 0)
//                default:
//                    self.products.products.insert(defaultTheme, at: 0)
//                }
//                self.currentState = .value(UpgradeState.fetchedProductsByType)
//            case .failure(let error):
//                self.currentState = .error(ProductsError.underlying(error))
//            }
//        }
//    }
//    
//    func buyProduct(product id: Int) {
//        service.buyProduct(product: id) { result in
//            switch result {
//            case .success:
//                self.currentState = .value(UpgradeState.bought)
//            case .failure(let error):
//                self.currentState = .error(ProductsError.underlying(error))
//            }
//        }
//    }
//    
//    func selectProduct(index: Int) {
//        let product = products.products[index]
//        for (i, item) in products.products.enumerated() where item.id != product.id {
//            products!.products[i].owned = false
//        }
//        self.products!.products[index].owned = true
//        self.currentState = .value(UpgradeState.selectedProduct)
//    }
//    
//    func checkIsCurrentTheme(for indexPath: IndexPath) -> Bool {
//        guard let product = self.products?.products[indexPath.row] else { return false }
//        switch product.type {
//        case .theme:
//            return product.id == ThemeService.shared.theme.id
//        case .background:
//            return product.id == ThemeService.shared.chatBackground.id
//        }
//    }
//}

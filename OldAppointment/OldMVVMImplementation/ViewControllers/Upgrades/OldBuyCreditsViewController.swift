////
////  BuyCreditsViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 13.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import SwiftyStoreKit
//
//class BuyCreditsViewController: BaseViewController, Storyboardable, MVVMViewController {
//    static var storyboardName: String { return "Upgrades" }
//    static var storyboardIdentifier: String { return "BuyCreditsViewController" }
//
//    typealias ViewModel = BuyCreditsViewModel
//
//    var viewModel = BuyCreditsViewModel()
//    var iAPService = IAPService()
//    
//    @IBOutlet private var priceLabels: [UILabel]! {
//        didSet {
//            priceLabels.forEach {
//                $0.textColor = UIColor.white.withAlphaComponent(0.4)
//                $0.font = R.font.notoSans(size: 16)
//            }
//        }
//    }
//    
//    @IBOutlet private weak var containerView: UIView!
//    
//    @IBOutlet private var priceButtons: [GeneralRoundedButton]! {
//        didSet {
//            priceButtons.forEach {
//                $0.type = .blue
//                $0.setTitle("", for: .normal)
//            }
//        }
//    }
//    
//    @IBOutlet private weak var imageView: UIImageView! {
//        didSet {
//            imageView.image = R.image.credits_kopen()!
//            imageView.contentMode = .scaleAspectFit
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        bind()
//        viewModel.fetchCreditBalance()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        iAPService.fetchAllProducts()
//    }
//    
//    @IBAction private func buyButtonPressed(_ sender: UIButton) {
//        switch sender {
//        case priceButtons[0]:iAPService.purchase(.credit10, atomically: true)
//        case priceButtons[1]:iAPService.purchase(.credit20, atomically: true)
//        case priceButtons[2]:iAPService.purchase(.credit30, atomically: true)
//        default: break
//        }
//    }
//}
//
//private extension BuyCreditsViewController {
//    // siwftlint:disable cyclomatic_complexity
//    func bind() {
//        iAPService.stateHandler = { [weak self] state in
//            switch state {
//            case .value(let valueType):
//                switch valueType {
//                case .fetchProductInfo(let result):
//                    result.retrievedProducts.forEach {
//                        guard let index = self?.viewModel.getTypeIndex(for: $0.productIdentifier) else { return }
//                        guard let localizedPrice = $0.localizedPrice else { return }
//                        self?.handleViewAppearanceOnType(index: index, localizedPrice: localizedPrice, localizedTitle: $0.localizedTitle)
//                    }
//                case .alertForPurchase(let result):
//                    if let alert = self?.alertForPurchaseResult(result) {
//                        self?.showAlert(alert)
//                    }
//                default: break
//                }
//            case .idle:
//                self?.loadingView.removeFromWindow()
//            case .loading:
//                self?.loadingView.addToWindow()
//            case .error(let error):
//                print(error.localizedDescription)
//            }
//        }
//        
//        viewModel.stateHandler = { [weak self] state in
//            switch state {
//            case .value(let valueType):
//                switch valueType {
//                case .fetchedCredits:break
//                }
//            case .error(let error):
//                print(error.localizedDescription)
//            default:break
//            }
//        }
//    }
//    
//    private func handleViewAppearanceOnType(index: Int,localizedPrice: String, localizedTitle:String) {
//        self.priceButtons[index].setTitle(localizedPrice, for: .normal)
//        self.priceLabels[index].text = localizedTitle.uppercased()
//    }
//}

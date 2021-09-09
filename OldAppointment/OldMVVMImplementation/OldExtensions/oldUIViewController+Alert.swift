////
////  UIViewController+Alert.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 26.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import SwiftyStoreKit
//
//extension UIViewController {
//    func alertWithTitle(_ title: String, message: String) -> UIAlertController {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: R.string.localizable.ok.key.localized.uppercased(), style: .cancel, handler: nil))
//        return alert
//    }
//    
//    func showAlert(_ alert: UIAlertController) {
//        guard self.presentedViewController != nil else {
//            self.present(alert, animated: true, completion: nil)
//            return
//        }
//    }
//    
//    func alertForProductRetrievalInfo(_ result: RetrieveResults) -> UIAlertController {
//        if let product = result.retrievedProducts.first {
//            let priceString = product.localizedPrice!
//            return alertWithTitle(product.localizedTitle, message: "\(product.localizedDescription) - \(priceString)")
//        } else if let invalidProductId = result.invalidProductIDs.first {
//            return alertWithTitle(R.string.localizable.couldNotRetrieveProductInfo.key.localized.firstCapitalized, message: R.string.localizable.invalidProductIdentifier.key.localized.firstCapitalized+"\(invalidProductId)")
//        } else {
//            let errorString = result.error?.localizedDescription ?? R.string.localizable.unkownError.key.localized.firstCapitalized
//            return alertWithTitle(R.string.localizable.couldNotRetrieveProductInfo.key.localized.firstCapitalized, message: errorString)
//        }
//    }
//    
//    // swiftlint:disable cyclomatic_complexity
//    func alertForPurchaseResult(_ result: PurchaseResult) -> UIAlertController? {
//        switch result {
//        case .success(let purchase):
//            print(R.string.localizable.purchaseSuccess.key.localized.firstCapitalized,"\(purchase.productId)")
//            return nil
//        case .error(let error):
//            let failed = R.string.localizable.purchaseSuccess.key.localized.firstCapitalized
//            print(failed,"\(error)")
//            switch error.code {
//            case .unknown: return alertWithTitle(failed, message: error.localizedDescription)
//            case .clientInvalid: // client is not allowed to issue the request, etc.
//                return alertWithTitle(failed, message: R.string.localizable.clientNotAllowedMakePayment.key.localized.firstCapitalized)
//            case .paymentCancelled: // user cancelled the request, etc.
//                return nil
//            case .paymentInvalid: // purchase identifier was invalid, etc.
//                return alertWithTitle(failed, message: R.string.localizable.purchaseIdentifierInvalid.key.localized.firstCapitalized)
//            case .paymentNotAllowed: // this device is not allowed to make the payment
//                return alertWithTitle(failed, message: R.string.localizable.notAllowedMakePurchase.key.localized.firstCapitalized)
//            case .storeProductNotAvailable: // Product is not available in the current storefront
//                return alertWithTitle(failed, message: R.string.localizable.productNotAvailable.key.localized.firstCapitalized)
//            case .cloudServicePermissionDenied: // user has not allowed access to cloud service information
//                return alertWithTitle(failed, message: R.string.localizable.cloudServiceinformationNotAllowed.key.localized.firstCapitalized)
//            case .cloudServiceNetworkConnectionFailed: // the device could not connect to the nework
//                return alertWithTitle(failed, message: R.string.localizable.networkError.key.localized.firstCapitalized)
//            case .cloudServiceRevoked: // user has revoked permission to use this cloud service
//                return alertWithTitle(failed, message: R.string.localizable.cloudServiceRevoked.key.localized.firstCapitalized)
//            default:
//                return alertWithTitle(failed, message: (error as NSError).localizedDescription)
//            }
//        }
//    }
//    
//    func alertForRestorePurchases(_ results: RestoreResults) -> UIAlertController {
//        
//        if results.restoreFailedPurchases.count > 0 {
//            print("Restore Failed: \(results.restoreFailedPurchases)")
//            return alertWithTitle(R.string.localizable.restoreFailed.key.localized.firstCapitalized, message: R.string.localizable.unkownError.key.localized.firstCapitalized)
//        } else if results.restoredPurchases.count > 0 {
//            print("Restore Success: \(results.restoredPurchases)")
//            return alertWithTitle(R.string.localizable.purchaseRestored.key.localized.firstCapitalized, message: R.string.localizable.allPurchasesRestored.key.localized.firstCapitalized)
//        } else {
//            print("Nothing to Restore")
//            return alertWithTitle(R.string.localizable.nothingToRestore.key.localized.firstCapitalized, message: R.string.localizable.noPreviousPurchase.key.localized.firstCapitalized)
//        }
//    }
//    
//    func alertForVerifyReceipt(_ result: VerifyReceiptResult) -> UIAlertController {
//        switch result {
//        case .success(let receipt):
//            print("Verify receipt Success: \(receipt)")
//            return alertWithTitle(R.string.localizable.recieptVerified.key.localized.firstCapitalized, message: R.string.localizable.receiptVerifiedRemotely.key.localized.firstCapitalized)
//        case .error(let error):
//            print("Verify receipt Failed: \(error)")
//            switch error {
//            case .noReceiptData:
//                return alertWithTitle(R.string.localizable.receiptverification.key.localized.firstCapitalized, message: R.string.localizable.noReceiptData.key.localized.firstCapitalized)
//            case .networkError(let error):
//                return alertWithTitle(R.string.localizable.receiptverification.key.localized.firstCapitalized, message: R.string.localizable.networkErrorWhileVerifyingReceipt.key.localized.firstCapitalized+" \(error)")
//            default:
//                return alertWithTitle(R.string.localizable.receiptverification.key.localized.firstCapitalized, message: R.string.localizable.receiptVerificationFailed.key.localized.firstCapitalized+" \(error)")
//            }
//        }
//    }
//    
//    func alertForVerifyPurchase(_ result: VerifyPurchaseResult, productId: String) -> UIAlertController {
//        switch result {
//        case .purchased:
//            print("\(productId) is purchased")
//            return alertWithTitle(R.string.localizable.productIsPurchased.key.localized.firstCapitalized, message: R.string.localizable.productWillNotExpire.key.localized.firstCapitalized)
//        case .notPurchased:
//            print("\(productId) has never been purchased")
//            return alertWithTitle(R.string.localizable.productIsNotPurchased.key.localized.firstCapitalized, message: R.string.localizable.productNeverPurchased.key.localized.firstCapitalized)
//        }
//    }
//}

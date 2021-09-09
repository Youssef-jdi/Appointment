////
////  AppDelegate.swift
////  AmsterdamDiscoveryChallenge
////
////  Created by Fabian on 30-12-16.
////  Copyright © 2016 DTT. All rights reserved.
////
//
//import UIKit
//import Swinject
//import SwinjectStoryboard
//import Moya
//import p2_OAuth2
//import Firebase
//import FirebaseDynamicLinks
//import GooglePlaces
//import SwiftyStoreKit
//import SideMenuSwift
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    static var adapter: AuthManagerProtocol?
//
//    var window: UIWindow?
//    // swiftlint:disable all
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//        DynamicLinks.performDiagnostics()
//        setupIAP()
//        prepareTheme()
//        GMSPlacesClient.provideAPIKey("AIzaSyAKIBGDn1-0PUftqYfDP8eu01Q1MMwbsyE")
//        // configureSideMenu()
//        return true
//    }
//
//    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
//        guard let _ = UIApplication.shared.keyWindow?.topViewController() as? Rotateable else { return .portrait }
//        return .landscapeRight
//    }
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        return handle(url: url)
//    }
//
//    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
//        guard let webpageURL = userActivity.webpageURL else { return false }
//        return handle(url: webpageURL)
//    }
//
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        return handle(url: url)
//    }
//
//    private func configureSideMenu() {
//        SideMenuController.preferences.basic.menuWidth = window!.screen.bounds.width * 0.7
//        SideMenuController.preferences.basic.defaultCacheKey = "0"
//        SideMenuController.preferences.basic.statusBarBehavior = .hideOnMenu
//        SideMenuController.preferences.basic.enableRubberEffectWhenPanning = false
//        SideMenuController.preferences.basic.hideMenuWhenEnteringBackground = true
//        let menuViewController = R.storyboard.sideMenu().instantiateInitialViewController()!
//        let contentViewController = R.storyboard.sideMenu.sideMenuController()!
//        window?.rootViewController = SideMenuController(contentViewController: contentViewController, menuViewController: menuViewController)
//    }
//
//    private func prepareTheme() {
//        guard let theme = UserDefaults.standard.object(forKey: "currentTheme") as? Data else { return }
//        let decoder = JSONDecoder()
//        if let savedTheme = try? decoder.decode(ProductModel.self, from: theme) {
//            ThemeService.shared.theme = savedTheme
//        }
//    }
//
//}
//
//private extension AppDelegate {
//
//    func handle(url: URL) -> Bool {
//
//        func tryHandleRedirect(url: URL) -> Bool {
//            return AppDelegate.adapter?.handleRedirection(url) ?? false
//        }
//
//        let _ = DynamicLinks.dynamicLinks().handleUniversalLink(url) { (dynamicLink, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//        }
//
//        return tryHandleRedirect(url: url)
//
//    }
//
//    func setupIAP() {
//        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
//            for purchase in purchases {
//                switch purchase.transaction.transactionState {
//                case .purchased, .restored:
//                    let downloads = purchase.transaction.downloads
//                    if !downloads.isEmpty {
//                        SwiftyStoreKit.start(downloads)
//                    } else if purchase.needsFinishTransaction {
//                        // Deliver content from server, then:
//                        SwiftyStoreKit.finishTransaction(purchase.transaction)
//                    }
//                    print("\(purchase.transaction.transactionState.debugDescription): \(purchase.productId)")
//                case .failed, .purchasing, .deferred:
//                    break
//                }
//            }
//        }
//        SwiftyStoreKit.updatedDownloadsHandler = { downloads in
//            let contentURLs = downloads.compactMap { $0.contentURL }
//            if contentURLs.count == downloads.count {
//                print("Saving: \(contentURLs)")
//                SwiftyStoreKit.finishTransaction(downloads[0].transaction)
//            }
//        }
//    }
//}
//
//extension SwinjectStoryboard {
//
//    private class func resolveProvider<C: UIViewController>(
//        _ resolver: Resolver,
//        _ controller: C
//        ) where C: MVVMViewController {
//
//        let service = controller.viewModel.service
//        service.provider = resolver.resolve(AuthenticatedProvider<MultiTarget, C.ViewModel.Service.AuthTarget>.self)
//    }
//
//    private class func resolveSyncProvider<C: UIViewController>(
//        _ resolver: Resolver,
//        _ controller: C
//        ) where C: MVVMSyncViewController {
//
//        let googleService = controller.viewModel.googleService
//        let outlookService = controller.viewModel.outlookService
//        let yahooService = controller.viewModel.yahooService
//        let facebookService = controller.viewModel.facebookService
//
//        googleService.provider = resolver.resolve(AuthenticatedProvider<MultiTarget, C.ViewModel.GoogleServiceType.AuthTarget>.self)
//        outlookService.provider = resolver.resolve(AuthenticatedProvider<MultiTarget, C.ViewModel.OutlookServiceType.AuthTarget>.self)
//        yahooService.provider = resolver.resolve(AuthenticatedProvider<MultiTarget, C.ViewModel.YahooServiceType.AuthTarget>.self)
//        facebookService.provider = resolver.resolve(AuthenticatedProvider<MultiTarget, C.ViewModel.FacebookServiceType.AuthTarget>.self)
//    }
//
//    class func setup() {
//
//        defaultContainer.storyboardInitCompleted(
//            LoginViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            ChatViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            HomeViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            InvitationViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            PlanningViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            PlanningTimelineViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            PlanningSearchViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            EditProfileViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            BuyCreditsViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            UpgradesViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            AppointmentViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            ProductsViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            NewChatMeetingViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            NewParticipantsViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            InvitationDetailViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            SyncViewController.self,
//            initCompleted: resolveSyncProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            SideMenuViewController.self,
//            initCompleted: resolveSyncProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            ChangePasswordViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            EventsViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.storyboardInitCompleted(
//            ParticipantDiagramViewController.self,
//            initCompleted: resolveProvider)
//
//        defaultContainer.register(AuthenticatedProvider<MultiTarget, ApiTarget>.self) { resolver in
//            return AuthenticatedProvider<MultiTarget, ApiTarget> (
//                stubClosure: MoyaProvider.immediatelyStub,
//                plugins: [
//                    NetworkLoggerPlugin(),
//                    NetworkActivityPlugin(networkActivityClosure: { change, _ in
//                        switch change {
//                        case .began:
//                            UIApplication.shared
//                                .isNetworkActivityIndicatorVisible = true
//                        case .ended:
//                            UIApplication.shared
//                                .isNetworkActivityIndicatorVisible = false
//                        }
//                    })
//                ])
//            }
//            .inObjectScope(.container)
//
//        defaultContainer.register(AuthenticatedProvider<MultiTarget, GoogleTarget>.self) { resolver in
//            return AuthenticatedProvider<MultiTarget, GoogleTarget> (
//                stubClosure: MoyaProvider.neverStub,
//                plugins: [
//                    NetworkLoggerPlugin(),
//                    NetworkActivityPlugin(networkActivityClosure: { change, _ in
//                        switch change {
//                        case .began:
//                            UIApplication.shared
//                                .isNetworkActivityIndicatorVisible = true
//                        case .ended:
//                            UIApplication.shared
//                                .isNetworkActivityIndicatorVisible = false
//                        }
//                    })
//                ])
//            }
//            .inObjectScope(.container)
//
//        defaultContainer.register(AuthenticatedProvider<MultiTarget, OutlookTarget>.self) { resolver in
//            return AuthenticatedProvider<MultiTarget, OutlookTarget> (
//                stubClosure: MoyaProvider.neverStub,
//                plugins: [
//                    NetworkLoggerPlugin(),
//                    NetworkActivityPlugin(networkActivityClosure: { change, _ in
//                        switch change {
//                        case .began:
//                            UIApplication.shared
//                                .isNetworkActivityIndicatorVisible = true
//                        case .ended:
//                            UIApplication.shared
//                                .isNetworkActivityIndicatorVisible = false
//                        }
//                    })
//                ])
//            }
//            .inObjectScope(.container)
//
//        defaultContainer.register(AuthenticatedProvider<MultiTarget, YahooTarget>.self) { resolver in
//            return AuthenticatedProvider<MultiTarget, YahooTarget> (
//                stubClosure: MoyaProvider.neverStub,
//                plugins: [
//                    NetworkLoggerPlugin(),
//                    NetworkActivityPlugin(networkActivityClosure: { change, _ in
//                        switch change {
//                        case .began:
//                            UIApplication.shared
//                                .isNetworkActivityIndicatorVisible = true
//                        case .ended:
//                            UIApplication.shared
//                                .isNetworkActivityIndicatorVisible = false
//                        }
//                    })
//                ])
//            }
//            .inObjectScope(.container)
//
//        defaultContainer.register(AuthenticatedProvider<MultiTarget, FacebookTarget>.self) { resolver in
//            return AuthenticatedProvider<MultiTarget, FacebookTarget> (
//                stubClosure: MoyaProvider.neverStub,
//                plugins: [
//                    NetworkLoggerPlugin(),
//                    NetworkActivityPlugin(networkActivityClosure: { change, _ in
//                        switch change {
//                        case .began:
//                            UIApplication.shared
//                                .isNetworkActivityIndicatorVisible = true
//                        case .ended:
//                            UIApplication.shared
//                                .isNetworkActivityIndicatorVisible = false
//                        }
//                    })
//                ])
//            }
//            .inObjectScope(.container)
//    }
//
//}
//
//private func + <MVVMViewController: UIViewController>(
//    leftFunction: @escaping (Resolver, _ c: MVVMViewController) -> Void,
//    rightFunction: @escaping (Resolver, _ c: MVVMViewController) -> Void
//    ) -> (Resolver, MVVMViewController) -> Void {
//    func combine(resolver: Resolver, mVVMViewController: MVVMViewController) {
//        leftFunction(resolver, mVVMViewController)
//        rightFunction(resolver, mVVMViewController)
//    }
//    return combine
//}
//
//extension UIApplication {
//
//    var statusBarView: UIView? {
//        return value(forKey: "statusBar") as? UIView
//    }
//}
//

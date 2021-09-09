////
////  SyncViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 26.02.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import SideMenuSwift
//
//class SyncViewController: BaseViewController, Storyboardable, MVVMSyncViewController {
//    var viewModel = SyncViewModel()
//    
//    typealias ViewModel = SyncViewModel
//
//    static var storyboardName: String = "Login"
//    static var storyboardIdentifier: String = "SyncViewController"
//    
//    @IBOutlet private weak var titleLabel: UILabel! {
//        didSet {
//            titleLabel.text = R.string.localizable.synchronise.key.localized.uppercased()
//        }
//    }
//    
//    @IBOutlet private weak var descriptionLabel: UILabel!
//    @IBOutlet private weak var facebookButton: ButtonDoneRight!
//    @IBOutlet private weak var gmailButton: ButtonDoneRight!
//    @IBOutlet private weak var outlookButton: ButtonDoneRight!
//    @IBOutlet private weak var yahooButton: ButtonDoneRight!
//    @IBOutlet private weak var contactButton: ButtonDoneRight!
//    @IBOutlet private weak var nextButton: GeneralRoundedButton! {
//        didSet {
//            nextButton.type = .blue
//            nextButton.setTitle(R.string.localizable.next.key.localized.uppercased(), for: .normal)
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        bind()
//    }
//    
//    @IBAction private func facebookButtonPressed(_ sender: Any) {
//        viewModel.fetchFacebookContacts()
//    }
//    
//    @IBAction private func gmailButtonPressed(_ sender: Any) {
//        viewModel.fetchGoogleContacts()
//    }
//    
//    @IBAction private func outlookButtonPressed(_ sender: Any) {
//        viewModel.fetchOutlookContacts()
//    }
//    
//    @IBAction private func yahooButtonPressed(_ sender: Any) {
//        viewModel.fetchYahooContacts()
//    }
//    
//    @IBAction private func contactButtonPressed(_ sender: Any) {
//        viewModel.fetchDeviceContacts()
//    }
//    
//    @IBAction private func skipButtonPressed(_ sender: Any) {
//        configureSideMenu()
//    }
//    
//    private func configureSideMenu() {
//        SideMenuController.preferences.basic.menuWidth = view.bounds.width * 0.7
//        SideMenuController.preferences.basic.defaultCacheKey = "0"
//        SideMenuController.preferences.basic.statusBarBehavior = .hideOnMenu
//        SideMenuController.preferences.basic.enableRubberEffectWhenPanning = false
//        SideMenuController.preferences.basic.hideMenuWhenEnteringBackground = true
//        let menuViewController = R.storyboard.sideMenu().instantiateInitialViewController()!
//        let contentViewController = R.storyboard.sideMenu.sideMenuController()!
//        let sideMenuVC = SideMenuController(contentViewController: contentViewController, menuViewController: menuViewController)
//        self.present(sideMenuVC, animated: true, completion: nil)
//    }
//}
//
//private extension SyncViewController {
//    func bind() {
//        viewModel.stateHandler = { [weak self] state in
//            switch state {
//            case .value(let valueType):
//                switch valueType {
//                case .fetchedGoogle(let value):
//                    print(value)
//                case .fetchedFacebook(let value):
//                    print(value)
//                case .fetchedOutlook(let value):
//                    print(value)
//                case .fetchedYahoo(let value):
//                    print(value)
//                case .fetchedDeviceContacts(let value):
//                    print(value)
//                @unknown default: break // @unkown default is a swift 5 feature and  now switch cases can warn us if there is any other new implemented case :)
//                }
//                self?.configureSideMenu()
//            case .error(let errorType):
//                switch errorType {
//                case .underlying(let error):
//                    print(error.localizedDescription)
//                case .unableToFetchDeviceContacts(let error):
//                    print(error.localizedDescription)
//                case .notAuthenticated(let error):
//                    print(error.localizedDescription)
//                }
//            @unknown default: break
//            }
//        }
//    }
//}

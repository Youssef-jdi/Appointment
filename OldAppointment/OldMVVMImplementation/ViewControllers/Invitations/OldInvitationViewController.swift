////
////  InvitationViewController.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 06/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import XLPagerTabStrip
//
//class InvitationViewController: ButtonBarPagerTabStripViewController, MVVMViewController {
//
//    typealias ViewModel = InvitationViewModel
//
//    var viewModel = InvitationViewModel()
//    
//    #warning("this is for testing it will be removed on login state handling Awaiting API")
//    var isUserLoggedIn = true
//    
//    lazy var notLoggedInPopUp: MultipleButtonAlertViewController = {
//        let viewController = R.storyboard.popup.twoButtonAlert()!
//        let firstButtonTitle = NSAttributedString(
//            string: R.string.localizable.cancel.key.localized.uppercased(),
//            attributes: [
//                .font: R.font.openSansBold(size: 20)!
//                ]
//        )
//        let secondButtonTitle = NSAttributedString(
//            string: R.string.localizable.login.key.localized.uppercased(),
//            attributes: [
//                .font: R.font.openSansBold(size: 20)!
//            ]
//        )
//        let viewModel = MultipleButtonAlertViewController.ViewModel(
//            popupImage: R.image.credits_kopen()!,
//            firstDesctiption: NSMutableAttributedString(string: "newAppointmentNotLoggedInFirstDescription".localized.firstCapitalized),
//            secondDescription: NSMutableAttributedString(string: "newAppointmentNotLoggedInSecondDescription".localized.firstCapitalized),
//            wantedBlurViewBackground: false,
//            leftButtonPressed: cancelPressed,
//            rightButtonPressed: loginPressed,
//            numberOfButton: ButtonConfiguration.doubleButton(
//                firstButtonTitle: firstButtonTitle,
//                secondButtonTitle: secondButtonTitle,
//                firstButtonColor: .white,
//                secondButtonColor: .highlight))
//        viewController.viewModel = viewModel
//        return viewController
//    }()
//    
//    lazy var createAppointmentPopUp: TableAlertViewController = {
//        let viewController = R.storyboard.popup.tableViewAlert()!
//        let viewModel = TableAlertViewController.ViewModel(
//            alertTitle: "create".localized.firstCapitalized,
//            alertImage: R.image.credits_kopen()!,
//            wantedBlurViewBackground: false,
//            tableViewDataSource: [
//                (R.string.localizable.standart.key.localized.uppercased(), R.image.menu_Standard()!),
//                (R.string.localizable.forBusiness.key.localized.uppercased(), R.image.menu_Business()!),
//                (R.string.localizable.group.key.localized.uppercased(), R.image.menu_Group()!),
//                (R.string.localizable.memo.key.localized.uppercased(), R.image.menu_Memo()!)
//            ], cellPressed: createAppointmentCellPressed,
//               buttonTitle: R.string.localizable.cancel.key.localized.uppercased())
//        viewController.viewModel = viewModel
//        return viewController
//    }()
//    
//    @IBOutlet private weak var addButton: ButtonDoneRight!
//
//    override func viewDidLoad() {
//        configureTopBar()
//        viewModel.fetchInvitation()
//        prepareNavigationBar()
//        addSideMenuButton()
//        super.viewDidLoad()
//        view.layoutIfNeeded()
//    }
//
//    func configureTopBar() {
//        navigationItem.title = R.string.localizable.invitations().capitalizingFirstLetter()
//        ThemeService.shared.addThemeable(themable: self)
//        settings.style.selectedBarBackgroundColor = ThemeService.shared.theme.highlightColor!
//        settings.style.selectedBarHeight = 3.0
//        settings.style.buttonBarItemBackgroundColor = ThemeService.shared.theme.firstColor!
//        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
//        settings.style.buttonBarItemTitleColor = .white
//        settings.style.buttonBarMinimumLineSpacing = 0
//
//        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
//            guard changeCurrentIndex == true else { return }
//
//            newCell?.label.font = UIFont.boldSystemFont(ofSize: 16.0)
//            oldCell?.label.font = UIFont.systemFont(ofSize: 16)
//        }
//    }
//    
//    @IBAction private func addAppointmentPressed(_ sender: UIButton) {
//        self.present(createAppointmentPopUp, animated: true, completion: nil)
//    }
//    
//    private func loginPressed(_ alert: UIViewController) {
//        alert.dismiss(animated: true) {
//            let viewController = R.storyboard.login.login()!
//            UIApplication.shared.keyWindow?.rootViewController = viewController
//        }
//    }
//    
//    func createAppointmentCellPressed(_ alert: UIViewController, _ index: Int) {
//        alert.dismiss(animated: true) {
//            switch index {
//            case 0:
//                if self.isUserLoggedIn {
//                    self.show(R.storyboard.invitation.newInvitationTableViewController()!, sender: nil)
//                } else {
//                    self.present(self.notLoggedInPopUp, animated: true, completion: nil)
//                }
//            case 1: break
//            case 2:break
//            case 3:break
//            default: break
//            }
//        }
//    }
//    
//    private func cancelPressed(_ alert: UIViewController) {
//        alert.dismiss(animated: true) {
//            self.present(self.createAppointmentPopUp, animated: true, completion: nil)
//        }
//    }
//
//    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
//        let outgoingTableView = InvitationChildViewController.instantiate()
//        outgoingTableView.vieModel = InvitationChildViewController.ViewModel(itemInfo: IndicatorInfo(title: R.string.localizable.outgoing.key.localized.uppercased()),
//                                                                             dataSource: viewModel.outgoingDataSource)
//
//        let incomingTableView = InvitationChildViewController.instantiate()
//        incomingTableView.vieModel = InvitationChildViewController.ViewModel(itemInfo: IndicatorInfo.init(title: R.string.localizable.incoming.key.localized.uppercased()),
//                                                                             dataSource: viewModel.incomingDataSource)
//
//        return [outgoingTableView, incomingTableView]
//    }
//}
//
//extension InvitationViewController: Themeable {
//    func applyTheme(theme: ProductModel) {
//        settings.style.selectedBarBackgroundColor = theme.highlightColor!
//        settings.style.buttonBarItemBackgroundColor = theme.firstColor!
//        addButton.fillColor = theme.highlightColor!
//        addButton.tintColor = theme.firstColor
//    }
//}

////
////  LoggedInSettingViewController.swift
////  appointment
////
////  Created by Tran Gia Huy on 3/12/19.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class LoggedInSettingsTableViewController: UITableViewController, Storyboardable {
//    
//    static var storyboardName: String { return "Settings" }
//    
//    static var storyboardIdentifier: String { return "LoggedInSettingTableViewController" }
//    
//    weak var delegate: LoggedInSettingTableViewControllerPopup?
//    @IBOutlet private var arrowViews: [UIImageView]! {
//        didSet {
//            arrowViews.forEach {
//                $0.tintColor = ThemeService.shared.theme.highlightColor
//            }
//        }
//    }
//    @IBOutlet private var otherLabels: [UILabel]! {
//        didSet {
//            otherLabels.forEach {
//                $0.font = R.font.openSans(size: 16)
//                $0.textColor = R.color.appGray()
//            }
//            otherLabels[0].text = R.string.localizable.timeFormat.key.localized.uppercased()
//            otherLabels[1].text = R.string.localizable.timelineType.key.localized.uppercased()
//            otherLabels[2].text = R.string.localizable.timelineStatus.key.localized.uppercased()
//            otherLabels[3].text = R.string.localizable.dateNotation.key.localized.uppercased()
//        }
//    }
//    
//    @IBOutlet private weak var accountLabel: UILabel! {
//        didSet {
//            accountLabel.text = R.string.localizable.editAccount.key.localized.uppercased()
//            accountLabel.font = R.font.openSans(size: 16)
//            accountLabel.textColor = R.color.appGray()
//        }
//    }
//    
//    @IBOutlet private weak var connectedLabel: UILabel! {
//        didSet {
//            connectedLabel.text = R.string.localizable.connectedSettings.key.localized.uppercased()
//            connectedLabel.font = R.font.openSans(size: 16)
//            connectedLabel.textColor = R.color.appGray()
//        }
//    }
//    
//    @IBOutlet private var otherSwitches: [UISwitch]! {
//        didSet {
//            otherSwitches.forEach {
//                $0.tintColor = ThemeService.shared.theme.highlightColor
//                $0.onTintColor = ThemeService.shared.theme.highlightColor
//            }
//        }
//    }
//
//    @IBOutlet private weak var dateFormatStackView: UIStackView! {
//        didSet {
//            dateFormatStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openDateFormatView)))
//        }
//    }
//    
//    @IBOutlet private weak var logoutButton: GeneralRoundedButton! {
//        didSet {
//            logoutButton.type = .blue
//            logoutButton.setTitle("logout".localized.uppercased(), for: .normal)
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        ThemeService.shared.addThemeable(themable: self)
//    }
//
//    @IBAction private func switchChanged(_ sender: UIControl) {
//        switch sender {
//        case otherSwitches[0]:print("first Switch turned")
//        case otherSwitches[1]:print("second Switch turned")
//        case otherSwitches[2]:print("third Switch turned")
//        default: break
//        }
//    }
//    
//    @IBAction private func logoutPressed(_ sender: UIButton) {
//        ThemeService.shared.theme = defaultTheme
//        UIApplication.shared.keyWindow?.rootViewController = R.storyboard.start.instantiateInitialViewController()
//    }
//}
//
//extension LoggedInSettingsTableViewController: Themeable {
//    @objc func openDateFormatView() {
//        delegate?.showPopup()
//    }
//    func applyTheme(theme: ProductModel) {
//        otherSwitches.forEach {
//            $0.tintColor = theme.highlightColor
//            $0.onTintColor = theme.highlightColor
//        }
//        arrowViews.forEach { $0.tintColor = theme.highlightColor }
//        logoutButton.backgroundColor = theme.highlightColor
//    }
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return R.string.localizable.general.key.localized.uppercased()
//        case 1: return R.string.localizable.account.key.localized.uppercased()
//        case 2: return R.string.localizable.other.key.localized.uppercased()
//        default: return nil
//        }
//    }
//}

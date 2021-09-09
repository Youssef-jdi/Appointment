////
////  SideMenuViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 2.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//protocol SideMenuViewControllerDelegate: class {
//    func cellSelectedFor(indexPath index: IndexPath)
//}
//
//class SideMenuViewController: UIViewController {
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.delegate = self
//            tableView.dataSource = self
//            tableView.showsVerticalScrollIndicator = false
//            tableView.rowHeight = 100
//            tableView.backgroundColor = R.color.appDimGray()!
//            tableView.register(UINib(nibName: R.reuseIdentifier.sideMenuTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: R.reuseIdentifier.sideMenuTableViewCell.identifier)
//            tableView.register(UINib(nibName: R.reuseIdentifier.sideMenuSubItemTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: R.reuseIdentifier.sideMenuSubItemTableViewCell.identifier)
//        }
//    }
//    
//    weak var delegate: SideMenuViewControllerDelegate?
//    var viewModel = SideMenuViewModel()
//    lazy var sideMenuHeaderView: SideMenuHeaderView = {
//        let view = SideMenuHeaderView(frame: CGRect(x: 0,
//                                                    y: 0,
//                                                    width: self.tableView.frame.width,
//                                                    height: 200))
//        return view
//    }()
//    /// Current Navigation Color
//    var currentColor: UIColor?
//    
//    /// cell height
//    var cellHeight: CGFloat = 80
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.sideMenuHeaderView.prepareHeaderData(image: nil, email: "sanne@email.com", fullname: "SANNE BAKKER")
//        self.currentColor = UIApplication.shared.statusBarView?.backgroundColor
//        UIApplication.shared.statusBarView?.backgroundColor = R.color.appDimGray()!
//    }
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        UIApplication.shared.statusBarView?.backgroundColor = self.currentColor
//    }
//}
//
//extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return sideMenuHeaderView
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.sideMenuModel.count
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return sideMenuHeaderView.frame.height
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let row = indexPath.row
//        guard let type = SideMenuCellType(rawValue: row) else { return cellHeight }
//        // +1 is for the header view that contains the header label
//        return CGFloat(viewModel.getSubItemCount(for: type) + 1) * cellHeight
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let row = indexPath.row
//        let sideMenuModel = viewModel.sideMenuModel[indexPath.row]
//        guard let type = SideMenuCellType(rawValue: row) else {
//            return UITableViewCell()
//        }
//        switch type {
//        case .appointments, .linkedWith, .meetings, .memories:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.sideMenuSubItemTableViewCell.identifier) as? SideMenuSubItemTableViewCell else { return UITableViewCell() }
//            cell.dataModal = viewModel.getSubItems(type: type)
//            cell.cellType = type
//            cell.prepareHeader(image: sideMenuModel.image!, text: sideMenuModel.descriptionText)
//            return cell
//        case .legend, .about, .settings, .upgrades:
//            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//            cell.textLabel?.text = sideMenuModel.descriptionText
//            return cell
//        case .events, .invitations, .agenda, .holidays:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.sideMenuTableViewCell.identifier) as? SideMenuTableViewCell else { return UITableViewCell() }
//            cell.cellType = type
//            cell.prepareCell(image: sideMenuModel.image, subText: sideMenuModel.descriptionText, notificationCount: nil, font: R.font.robotoRegular(size: 16))
//            return cell
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let row = indexPath.row
//        guard let type = SideMenuCellType(rawValue: row) else {
//            return
//        }
//        var viewController: UIViewController!
//        switch type {
//        case .events:
//            self.delegate?.cellSelectedFor(indexPath: indexPath)
//            viewController = R.storyboard.home().instantiateInitialViewController()!
//        case .invitations:
//            viewController = R.storyboard.invitation().instantiateInitialViewController()!
//        case .agenda:
//            viewController = R.storyboard.home.yearCalendarViewController()!
//        case .appointments, .linkedWith, .meetings, .memories:
//            return
//        case .holidays:
//            viewController = R.storyboard.home.yearCalendarViewController()!
//        case .legend:
//            viewController = R.storyboard.home.legendViewController()!
//        case .settings:
//            viewController = R.storyboard.settings().instantiateInitialViewController()!
//        case .upgrades:
//            viewController = R.storyboard.upgrades().instantiateInitialViewController()!
//        case .about:
//            viewController = R.storyboard.about().instantiateInitialViewController()!
//        }
//        
//        let window = UIApplication.shared.keyWindow!
//        
//        window.topViewController()?.dismiss(animated: true, completion: {
//            window.rootViewController = viewController
//        })
//    }
//}

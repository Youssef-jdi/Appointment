////
////  InvitationSinglePageViewController.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 06/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import XLPagerTabStrip
//
//class InvitationChildViewController: BaseViewController, IndicatorInfoProvider, Storyboardable {
//    static var storyboardName: String { return "Invitation" }
//    static var storyboardIdentifier: String { return "InvitationChildViewController" }
//
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.dataSource = self
//            tableView.delegate = self
//        }
//    }
//    @IBOutlet private weak var dataStackView: UIStackView!
//    
//    var vieModel: ViewModel?
//
//    struct ViewModel {
//        let itemInfo: IndicatorInfo
//        let dataSource: [Datum]
//    }
//    // TODO: This will change on userstate we have to redirect user if it tries to create an invitation 
//    var isUserLoggedIn: Bool = true
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addSideMenuButton()
//    }
//    
//    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
//        return vieModel!.itemInfo
//    }
//}
//
//extension InvitationChildViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return vieModel!.dataSource.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.invitationTableViewCell.identifier) as? InvitationTableViewCell else { return UITableViewCell() }
//        cell.prepareCell(title: vieModel!.dataSource[indexPath.row].name)
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.show(R.storyboard.invitation.invitationDetailViewController()!, sender: nil)
//    }  
//}

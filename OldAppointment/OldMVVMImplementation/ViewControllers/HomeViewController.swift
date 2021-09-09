////
////  HomeViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 1.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import SideNavigation
//
//class HomeViewController: BaseViewController, Storyboardable {
//    
//    static var storyboardName: String { return "Home" }
//    
//    static var storyboardIdentifier: String { return "HomeViewController" }
//    
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            self.tableView.delegate = self
//            self.tableView.dataSource = self
//            self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
//            self.tableView.rowHeight = 300
//        }
//    }
//
//   private lazy var homeHeaderView: HomeHeaderView = {
//        var view = HomeHeaderView()
//        view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height * 0.5)
//        return view
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addSideMenuButton()
//        self.tableView.reloadData()
//    }
//}
//
//extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return self.homeHeaderView
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return self.homeHeaderView.frame.height
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 15
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 300
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.homeTableViewCell.identifier) as? HomeTableViewCell else { return UITableViewCell() }
//        return cell
//    }
//}

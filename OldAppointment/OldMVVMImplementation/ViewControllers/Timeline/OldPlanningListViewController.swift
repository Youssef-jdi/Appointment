////
////  PlanningListViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 7.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import ExpandableCell
//class PlanningListViewController: UIViewController {
//    
//    @IBOutlet private weak var tableView: ExpandableTableView! {
//        didSet {
//            tableView.expandableDelegate = self
//            tableView.animation = .automatic
//            tableView.register(UINib(resource: R.nib.planningMonthDetailTableViewCell), forCellReuseIdentifier: R.reuseIdentifier.planningMonthDetailTableViewCell.identifier)
//            tableView.register(UINib(resource: R.nib.planningMonthExpandableTableViewCell), forCellReuseIdentifier: R.reuseIdentifier.planningMonthExpandableTableViewCell.identifier)
//        }
//    }
//    var parrentCells: [[String]] = [
//        [
//            R.reuseIdentifier.planningMonthExpandableTableViewCell.identifier
//        ],
//        [
//            R.reuseIdentifier.planningMonthExpandableTableViewCell.identifier
//        ]
//    ]
//    
//    var subCells: [UITableViewCell] {
//        let identifier = R.reuseIdentifier.planningMonthDetailTableViewCell.identifier
//        let itemCount = [1, 2, 3]
//        let cells = itemCount.compactMap { index -> PlanningMonthDetailTableViewCell in
//            let cell =
//                self.tableView.dequeueReusableCell(withIdentifier: identifier) as? PlanningMonthDetailTableViewCell
//            if index == 1 {
//                cell?.heightConstraint.constant = 40
//            } else {
//                cell?.heightConstraint.constant = 0
//            }
//            cell?.separatorInset.left = 62 // total image width and constraint constant equals to 62
//            return cell!
//        }
//        return cells
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.tableView.reloadData()
//    }
//}
//
//extension PlanningListViewController: ExpandableDelegate {
//    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
//        switch indexPath.section {
//        default: return [90, 50, 50]
//        }
//    }
//    
//    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
//        return subCells
//    }
//    
//    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 44
//    }
//    
//    func numberOfSections(in expandableTableView: ExpandableTableView) -> Int {
//        return parrentCells.count
//    }
//    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = expandableTableView.cellForRow(at: indexPath) as? PlanningMonthExpandableTableViewCell else { return }
//        cell.animator.startAnimation()
//        cell.isExpanded.toggle()
//    }
//    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
//        return parrentCells[section].count
//    }
//    
//    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: parrentCells[indexPath.section][indexPath.row]) else { return UITableViewCell() }
//        cell.separatorInset.left = 0
//        return cell
//    }
//}

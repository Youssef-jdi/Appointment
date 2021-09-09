////
////  PlanningViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 7.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class PlanningViewController: BaseViewController, Storyboardable, MVVMViewController {
//    
//    static var storyboardName: String { return "Timeline" }
//    
//    static var storyboardIdentifier: String { return "PlanningViewController" }
//    
//    var viewModel = PlanningViewModel()
//    
//    typealias ViewModel = PlanningViewModel
//    
//    lazy var planningDateView: PlanningDateView = {
//        let view = PlanningDateView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height * 0.5))
//        view.delegate = self
//        view.alpha = 0
//        return view
//    }()
//    
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.delegate = self
//            tableView.dataSource = self
//            tableView.separatorStyle = .none
//            tableView.rowHeight = UITableView.automaticDimension
//            tableView.estimatedRowHeight = 130
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.bindViewModel()
//        addRightButton()
//        addSideMenuButton()
//        self.viewModel.getPlannings()
//    }
//    
//    func addRightButton() {
//        let dateButton = UIBarButtonItem(image: R.image.landing_Dots()!,
//                                         style: .plain,
//                                         target: self,
//                                         action: #selector(dateButtonPressed))
//        navigationItem.rightBarButtonItem = dateButton
//        navigationItem.rightBarButtonItem!.tintColor = .white
//        view.addSubview(planningDateView)
//    }
//    
//    @objc func dateButtonPressed() {
//        let value: CGFloat = self.planningDateView.alpha == 0 ? 1 : 0
//        UIView.animate(withDuration: 0.3) {
//            self.planningDateView.alpha = value
//        }
//    }
//}
//
//extension PlanningViewController: PlanningDateViewDelegate {
//    func scrollToDate(date: Date) {
//        if let index = viewModel.monthDates.firstIndex(of: date) {
//            self.tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
//        }
//    }
//}
//
//extension PlanningViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.monthDates.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.planningCell.identifier) as? PlanningCell else { return UITableViewCell() }
//        let row = indexPath.row
//        cell.selectionStyle = .none
//        return viewModel.prepareCell(for: row, cell: cell, delegate: self)
//    }
//    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row + 1 == viewModel.monthDates.count {
//            let nextMonthIndex = viewModel.currentMonth + 1
//            viewModel.changeMonth(for: nextMonthIndex)
//        }
//    }
//}
//
//extension PlanningViewController: PlanningViewDelegate {
//    func appointmentTouched(appointment model: PlanningAppointmentModel) {
//        print(model.title)
//    }
//}
//
//extension PlanningViewController {
//    func bindViewModel() {
//        self.viewModel.stateHandler = { [weak self] in
//            switch $0 {
//            case .value(let currentState):
//                switch currentState {
//                case .monthChanged:
//                    self?.tableView.reloadData()
//                }
//            default:
//                break
//            }
//        }
//    }
//}

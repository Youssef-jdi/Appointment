////
////  PlanningYearViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 12.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import EventKit
//
//class PlanningYearViewController: BaseViewController, Storyboardable {
//    static var storyboardName: String { return "Timeline" }
//    
//    static var storyboardIdentifier: String { return "PlanningYearViewController" }
//    
//    let holidayViewModel = HolidaysViewModel()
//    
//    private var year = Date().year {
//        didSet {
//            tableView.reloadSections(IndexSet(0..<1), with: .automatic)
//        }
//    }
//    
//    private var homeTitleView: HomeTitleView {
//        let view = HomeTitleView(frame: .zero)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        view.delegate = self
//        return view
//    }
//    
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.registerHeaderFooterView(R.nib.yearMonthHeaderView)
//            tableView.delegate = self
//            tableView.dataSource = self
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        bind()
//        navigationController?.viewControllers.first is PlanningYearViewController ? addSideMenuButton() : addBackButton()
//        navigationItem.titleView = homeTitleView
//        holidayViewModel.requestAccesToCalendar()
//    }
//    
//    @objc func handleYearChange(gesture: UISwipeGestureRecognizer) {
//        print("Direction:", gesture.direction)
//        switch gesture.direction {
//        case .right:
//            year -= 1
//        case .left:
//            year += 1
//        default:
//            break
//        }
//    }
//}
//
//extension PlanningYearViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return section == 0 ? 550 : tableView.sectionHeaderHeight
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard section == 0 else { return nil }
//        let yearCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.reuseIdentifier.yearMonthTableViewCell)!
//        yearCell.configure(year: year, holidays: holidayViewModel.model)
//        yearCell.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(handleYearChange)))
//        return yearCell
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return section == 0 ? 0 : holidayViewModel.model[section - 1].holidays.count
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return holidayViewModel.model.count + 1
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return section == 0 ? nil : holidayViewModel.model[section - 1].holidays.first?.date.localizedDateString(dateFormat: Date.DateFormats.monthName.rawValue)?.uppercased()
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.planningYearCell.identifier) as? PlanningYearCell else { return UITableViewCell() }
//        let monthLyHolidays = holidayViewModel.model[indexPath.section - 1].holidays
//        let holiday = monthLyHolidays[indexPath.row]
//        let number = holiday.date.day.description
//        let name = holiday.date.localizedDayName()!.uppercased()
//        cell.prepareCell(dateName: name, dateNumber: number, desc: holiday.header)
//        return cell
//    }
//}
//
//private extension PlanningYearViewController {
//    func bind() {
//        holidayViewModel.stateHandler = { [weak self] state in
//            switch state {
//            case .value(let valueType):
//                switch valueType {
//                case .authorized:
//                    self?.tableView.reloadData()
//                }
//            case .error(let errorType):
//                switch errorType {
//                case .denied:
//                    print("User Denied")
//                case .restricted:
//                    print("User Restricted")
//                case .underlying(let error):
//                    print(error.localizedDescription)
//                }
//            @unknown default: break
//            }
//        }
//    }
//}
//
//extension PlanningYearViewController: HomeTitleViewDelegate {
//    
//    func didEndEditing(with year: Int) {
//        self.year = year
//    }
//}

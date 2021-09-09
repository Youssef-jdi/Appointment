////
////  CalendarTableViewController.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 07/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class CalendarTableViewController: UIViewController, UITableViewDelegate, Storyboardable {
//
//    static var storyboardName: String = "Invitation"
//    static var storyboardIdentifier: String = "CalendarTableViewController"
//
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.delegate = self
//            tableView.dataSource = self
//        }
//    }
//
//    @IBOutlet private weak var selectedDateLabel: UILabel!
//    @IBOutlet private weak var evenName: UILabel!
//
//    struct ViewModel {
//        let calendarDate: Date
//        let scheduledEvents: [ScheduledEvent]
//    }
//
//    var viewModel: ViewModel?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        updateSelectedDateLabel()
//        updateRow(viewModel!.calendarDate)
//    }
//
//    func updateRow(_ date: Date) {
//        let currentRow = currentTimeExtractor(date)
//        tableView.scrollToRow(at: IndexPath(row: currentRow, section: 0), at: .middle, animated: true)
//    }
//
//    func updateSelectedDateLabel() {
//        selectedDateLabel.text = currentDayExtractor()
//    }
//
//    func currentDayExtractor() -> String {
//        let dateFormatter = DateFormatter()
//
//        dateFormatter.dateFormat = "dd.MM.yyyy"
//        return dateFormatter.string(from: viewModel!.calendarDate)
//    }
//
//    func currentTimeExtractor(_ date: Date) -> Int {
//        let dateFormatter = DateFormatter()
//
//        dateFormatter.dateFormat = "HH"
//        return Int(dateFormatter.string(from: date))!
//    }
//}
//
//extension CalendarTableViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 24
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.pickerDateTableViewCell.identifier) as? PickerDateTableViewCell else { return UITableViewCell() }
//        cell.viewModel = PickerDateTableViewCell.ViewModel(time: indexPath.row, scheduledEvents: viewModel!.scheduledEvents)
//        cell.configure()
//        return cell
//    }
//}

////
////  PlanningTimelineViewController.swift
////  appointment
////
////  Created by Dylan Barteling on 29/04/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class PlanningTimelineViewController: BaseViewController, Storyboardable, MVVMViewController {
//    
//    static var storyboardName: String { return "Timeline" }
//    
//    static var storyboardIdentifier: String { return "PlanningTimelineViewController" }
//    
//    typealias ViewModel = EventViewModel
//    
//    var viewModel = EventViewModel()
//    
//    private let cellHeight: CGFloat = 150
//    private let headerCellHeight: CGFloat = 175
//    private let headerHeight: CGFloat = 75
//    
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.register(R.nib.dateCell)
//            tableView.registerHeaderFooterView(R.nib.dateHeaderCell)
//            tableView.delegate = self
//            tableView.dataSource = self
//            tableView.rowHeight = 130
//            tableView.backgroundColor = ThemeService.shared.theme.firstColor
//            tableView.separatorStyle = .none
//            tableView.scrollsToTop = false
//        }
//    }
//    
//    lazy var popUpSend: TableAlertViewController = {
//        let viewController = R.storyboard.popup.tableViewAlert()!
//        let viewModel = TableAlertViewController.ViewModel(
//            alertTitle: R.string.localizable.select.key.localized.firstCapitalized,
//            alertImage: R.image.popUp_new_MemoTo()!,
//            wantedBlurViewBackground: false,
//            tableViewDataSource: [
//                (R.string.localizable.messages.key.localized.uppercased(), R.image.menu_Messages()!),
//                (R.string.localizable.memoTo.key.localized.uppercased(), R.image.menu_MemoTo()!),
//                (R.string.localizable.meetings.key.localized.uppercased(), R.image.menu_Meeting()!)
//            ], cellPressed: createMemoToCellPressed,
//               buttonTitle: R.string.localizable.cancel.key.localized.uppercased())
//        viewController.viewModel = viewModel
//        return viewController
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.bindViewModel()
//        self.viewModel.getHomeAppointments()
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        // viewWillDisappear with an active animation will cause a crash,
//        // So it needs to be stopped first
//        guard let headerCell = tableView.headerView(forSection: 1) as? DateHeaderCell else { return }
//        headerCell.stopAnimation()
//    }
//    
//    func createMemoToCellPressed(_ alert: UIViewController, _ index: Int) {
//        var viewController: NewChatMeetingViewController?
//        switch index {
//        case 0:
//            viewController = R.storyboard.newChat.newChatMeetingViewController()!
//            viewController!.newType = .group
//        case 1:
//            viewController = R.storyboard.newChat.newChatMeetingViewController()!
//            viewController!.newType = .memoTo
//        case 2:
//            viewController = R.storyboard.newChat.newChatMeetingViewController()!
//            viewController!.newType = .MOM
//        case 3: break
//        default: break
//        }
//        
//        guard let vc = viewController else { return }
//        alert.dismiss(animated: true) {
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
//}
//
////extension PlanningTimelineViewController: PlanningDateViewDelegate {
////    func scrollToDate(date: Date) {
////        if let index = viewModel.monthDates.firstIndex(of: date) {
////            self.tableView.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
////        }
////    }
////}
//
//extension PlanningTimelineViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return section == 0 ? 1 : viewModel.yearDatesGroupedByWeekAndMonth[viewModel.currentYear]?.count ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.dateHeaderCell)!
//        headerCell.changeDate(date: Date())
//        headerCell.delegate = self
//        headerCell.layer.shadowOffset = CGSize(width: 0, height: 1)
//        headerCell.layer.shadowRadius = 1
//        return section == 0 ? nil : headerCell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return section == 0 ? 0 : headerHeight
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return indexPath.section == 0 ? headerCellHeight : cellHeight
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard indexPath.section > 0 else {
//            return tableView.dequeueReusableCell(withIdentifier: R.nib.dateCell, for: indexPath)!
//        }
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.homeTableViewCell.identifier) as? HomeTableViewCell else { return UITableViewCell() }
//        let row = indexPath.row
//        let weekIndex = viewModel.yearDatesGroupedByWeekAndMonth[viewModel.currentYear]?[row]?.first?.weekOfYear
//        cell.prepareCell(homeCellModel: viewModel.getCellAttributes(for: row))
//        cell.prepareWeekLabel(text: weekIndex?.description)
//        return cell
//    }
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if let headerCell = tableView.headerView(forSection: 1) as? DateHeaderCell {
//            let buttonHeight: CGFloat = 60
//            let headerPosition = scrollView.contentOffset.y - headerCellHeight
//            let progress = (headerPosition + (buttonHeight / 2)) / buttonHeight
//            headerCell.fadeButtons(progress: progress)
//            headerCell.layer.shadowOpacity = headerPosition < 0 ? 0 : 0.5
//        }
//        
//        if scrollView.isDragging || scrollView.isDecelerating {
//            guard let cellIndexPath = self.tableView.indexPathsForVisibleRows?.first,
//                cellIndexPath.section > 0 else { return }
//            guard let date = viewModel.determineForEndOfMonth(for: cellIndexPath.row) else { return }
//            changeDate(date)
//        }
//    }
//    
//    private func changeDate(_ date: Date) {
//        guard let headerCell = tableView.headerView(forSection: 1) as? DateHeaderCell else { return }
//        headerCell.changeDate(date: date)
//    }
//}
//
//extension PlanningTimelineViewController: DateHeaderDelegate {
//    
//    func addButtonPressed() {
//        // TODO: - addButtonPressed
//    }
//    
//    func messageButtonPressed() {
//        self.present(popUpSend, animated: true)
//    }
//    
//    func previousMonthPressed() {
//        switch viewModel.currentDate.month {
//        case 1:
//            let index = IndexPath(row: 0, section: 0)
//            tableView.scrollToRow(at: index, at: .top, animated: true)
//        default:
//            changeMonthAndScroll(isNext: false)
//        }
//    }
//    
//    func nextMonthPressed() {
//        guard viewModel.currentDate.month < 12 else { return }
//        changeMonthAndScroll(isNext: true)
//    }
//    
//    private func changeMonthAndScroll(isNext: Bool) {
//        let newDate = viewModel.changeMonth(isNext: isNext)
//        let index = IndexPath(row: newDate.weekOfYear - 1, section: 1)
//        tableView.scrollToRow(at: index, at: .top, animated: true)
//        
//        changeDate(newDate)
//    }
//}
//
//extension PlanningTimelineViewController {
//    func bindViewModel() {
//        self.viewModel.stateHandler = { [weak self] state in
//            switch state {
//            case .value(let val):
//                guard let date = self?.viewModel.currentDate else { return }
//                self?.changeDate(date)
//                self?.tableView.reloadData()
//                let indexPath: IndexPath
//                switch val {
//                case .normal:
//                    indexPath = IndexPath(row: Date().weekOfYear - 1, section: 1)
//                case .yearChanged:
//                    indexPath = IndexPath(row: 0, section: 0)
//                }
//                // Put short delay because it wasn't scrolling accurate
//                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
//                    self?.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
//                }
//            case .error(let error):
//                print(error.localizedDescription)
//            default: break
//            }
//        }
//    }
//}

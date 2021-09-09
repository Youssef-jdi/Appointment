////
////  AppointmentsViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 6.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class AppointmentViewController: BaseViewController, Storyboardable, MVVMViewController, HasDataSource {
//    static var storyboardName: String { return "Appointment" }
//    static var storyboardIdentifier: String { return "AppointmentViewController" }
//
//    typealias ViewModel = EventViewModel
//    typealias DataSource = AppointmentDataSource
//    
//    var viewModel = EventViewModel()
//    var dataSource = AppointmentDataSource()
//    
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.dataSource = self.dataSource
//            tableView.delegate = self
//            tableView.register(R.nib.appointmentTableViewCell)
//            tableView.rowHeight = 60
//            tableView.separatorStyle = .none
//        }
//    }
//    var fetchType: SideMenuCellType?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        bindViewModel()
//        addSideMenuButton()
//        if let type = fetchType {
//            viewModel.getAppointmentBy(type: type)
//        }
//        // Do any additional setup after loading the view.
//    }
//}
//
//extension AppointmentViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.dataSource.dataSourceManager.navigateWithEvent(at: indexPath)
//    }
//}
//
//private extension AppointmentViewController {
//    func bindViewModel() {
//        viewModel.stateHandler = { [weak self] state in
//            guard let self = self else { return }
//            switch state {
//            case .value(let valueType):
//                switch valueType {
//                case .normal:
//                    self.dataSource.dataSourceManager.eventModel = self.viewModel.model
//                    self.tableView.reloadData()
//                default: break
//                }
//            case .error(let error):
//                print(error.localizedDescription)
//            default: break
//            }
//        }
//    }
//}

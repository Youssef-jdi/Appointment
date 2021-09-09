////
////  PlanningSearchViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 12.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class PlanningSearchViewController: BaseViewController, Storyboardable, MVVMViewController {
//    static var storyboardName: String { return "Timeline" }
//    static var storyboardIdentifier: String { return "PlanningSearchViewController" }
//    
//    typealias ViewModel = PlanningSearchViewModel
//    
//    var viewModel = ViewModel()
//    
//    @IBOutlet private weak var searchBar: RoundedSearchBar! {
//        didSet {
//            searchBar.delegate = self
//            searchBar.placeholder = R.string.localizable.search().capitalizingFirstLetter()
//            searchBar.backgroundColor = ThemeService.shared.theme.firstColor
//        }
//    }
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.delegate = self
//            tableView.rowHeight = 70
//            tableView.dataSource = self
//            tableView.register(UINib(resource: R.nib.appointmentTableViewCell), forCellReuseIdentifier: R.reuseIdentifier.appointmentTableViewCell.identifier)
//        }
//    }
//    
//    override func applyTheme(theme: ProductModel) {
//        super.applyTheme(theme: theme)
//        searchBar.backgroundColor = theme.firstColor
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addBackButton()
//        bind()
//        prepareView()
//    }
//    
//    func prepareView() {
//        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(singleTap))
//        singleTapGestureRecognizer.numberOfTapsRequired = 1
//        singleTapGestureRecognizer.isEnabled = true
//        singleTapGestureRecognizer.cancelsTouchesInView = false
//        self.view.addGestureRecognizer(singleTapGestureRecognizer)
//    }
//    
//    @objc func singleTap(sender: UITapGestureRecognizer) {
//        self.searchBar.resignFirstResponder()
//    }
//}
//
//extension PlanningSearchViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.endEditing(true)
//        guard let text = searchBar.text, !text.isEmpty else {
//            self.viewModel.invitationModel = nil
//            self.tableView.reloadData()
//            return
//        }
//        viewModel.searchAppointments(name: text)
//    }
//}
//
//extension PlanningSearchViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let model = viewModel.invitationModel else { return 0 }
//        return model.data.appointments.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.appointmentTableViewCell.identifier) as? AppointmentTableViewCell else { return UITableViewCell() }
//        let row = indexPath.row
//        if let model = viewModel.invitationModel?.data.appointments[row] {
//            cell.prepareCell(title: model.title, time: model.durationTimeDescription, image: model.appointmentTypeImage)
//        }
//        return cell
//    }
//}
//
//private extension PlanningSearchViewController {
//    func bind() {
//        viewModel.stateHandler = { [weak self] state in
//            switch state {
//            case .value(let valueType):
//                switch valueType {
//                case .gotResultForSearch:
//                    print("geting some data")
//                    self?.tableView.reloadData()
//                }
//            case .error(let error):
//                print(error.localizedDescription)
//            default:break
//            }
//        }
//    }
//}

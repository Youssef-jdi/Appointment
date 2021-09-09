////
////  EventsViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//class EventsViewController: BaseViewController, Storyboardable, MVVMViewController {
//    static var storyboardName: String { return "Events" }
//    static var storyboardIdentifier: String { return "EventsViewController" }
//    
//    typealias ViewModel = EventsViewModel
//    
//    var viewModel = ViewModel()
//    
//    lazy var invitationDetailViewController: InvitationDetailViewController = {
//        let vc =  R.storyboard.invitation.invitationDetailViewController()!
//        return vc
//    }()
//    
//    lazy var refresher: UIRefreshControl = {
//        let ref = UIRefreshControl()
//        ref.tintColor = ThemeService.shared.theme.firstColor
//        ref.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
//        return ref
//    }()
//    
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.rowHeight = UITableView.automaticDimension
//            tableView.delegate = self
//            tableView.dataSource = self
//            tableView.refreshControl = refresher
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigationItem.title = R.string.localizable.events().capitalizingFirstLetter()
//        bind()
//        prepareNavigationBar()
//        addSideMenuButton()
//        viewModel.fetchEvents(user: 1)
//    }
//    
//    @objc private func pullToRefresh(_ sender: UIRefreshControl) {
//        viewModel.fetchEvents(user: 1)
//    }
//}
//
//private extension EventsViewController {
//    func bind() {
//        viewModel.stateHandler = { [weak self] state in
//            switch state {
//            case .value(let valueType):
//                switch valueType {
//                case .fetchedEvents, .didSelectRow:
//                    self?.tableView.reloadData()
//                }
//            case .idle:
//                self?.refresher.endRefreshing()
//                self?.loadingView.removeFromWindow()
//            case .loading:
//                self?.refresher.beginRefreshing()
//                self?.loadingView.addToWindow()
//            case .error(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//}
//
//extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.events.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.eventTableViewCell.identifier, for: indexPath) as? EventTableViewCell else { return UITableViewCell() }
//        cell.selectionStyle = .none
//        let model = viewModel.events[indexPath.row]
//        let description = viewModel.getDescription(for: indexPath)
//        cell.prepareCell(description: description, interactionTypeImage: model.interactionImage, dateString: model.dateString, isRead: model.isRead)
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.handleReadState(for: indexPath)
//        let id = viewModel.events[indexPath.row].appointmentID
//        invitationDetailViewController.eventId = id
//        self.show(invitationDetailViewController, sender: nil)
//    }
//}

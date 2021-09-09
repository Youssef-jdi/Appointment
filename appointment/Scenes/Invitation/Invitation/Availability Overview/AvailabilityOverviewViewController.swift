//
//  AvailabilityOverviewViewController.swift
//  appointment
//
//  Created by Tran Gia Huy on 28/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

// swiftlint:disable superfluous_disable_command
import UIKit

//sourcery: AutoMockable
protocol AvailabilityOverviewViewControllerProtocol: class, UIViewControllerRouting {

}

class AvailabilityOverviewViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var interactor: AvailabilityOverviewInteractorProtocol?
    private var router: AvailabilityOverviewRouterProtocol?
    private let datasource = AvailabilityOverviewDatasource()

    func set(interactor: AvailabilityOverviewInteractorProtocol?) {
        self.interactor = interactor
    }

    func set(router: AvailabilityOverviewRouterProtocol?) {
        self.router = router
    }

    func set(date: AppointmentDate) {
        datasource.set(date: date)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
        setupNavigationBar()
    }

    private func prepare() {
        tableView.register(UINib(nibName: "AvailablityOverviewCell", bundle: nil), forCellReuseIdentifier: "AvailablityOverviewCell")
        tableView.delegate = self
        tableView.dataSource = datasource
    }

    private func setupNavigationBar() {
        navigationItem.title = R.string.localizable.outgoing()
    }

    @objc func goBack() {
        router?.route(to: .goBack)
    }
}

extension AvailabilityOverviewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = AvailabilityHeaderView()
        headerView.backgroundColor = R.color.appLightGray()
        guard let date = datasource.date else {
            assertionFailure("Date is nil")
            return nil
        }

        guard let responseCount = date.responseCount else {
            assertionFailure()
            return nil
        }
        
        switch section {
        case 0:
            headerView.setUp(viewModel: .init(
                state: .available,
                count: responseCount.available))
        case 1:
            headerView.setUp(viewModel: .init(
                state: .maybe,
                count: responseCount.unsure))
        case 2:
            headerView.setUp(viewModel: .init(
                state: .unavailable,
                count: responseCount.unavailable))
        default:
            headerView.setUp(viewModel: .init(
                state: .unknown,
                count: responseCount.unknown))
        }
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension AvailabilityOverviewViewController: AvailabilityOverviewViewControllerProtocol {
}

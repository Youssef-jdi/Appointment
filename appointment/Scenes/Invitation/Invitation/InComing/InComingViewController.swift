//
//  InComingViewController.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/24/20.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

//sourcery: AutoMockable
protocol InComingViewControllerProtocol: class, UIViewControllerRouting {
    func set(interactor: InComingInteractorProtocol)
    func set(router: InComingRouterProtocol)
    func set(incomingDataSource: [Appointment])
    
    func displayLoadingView(display: Bool)
}

class InComingViewController: UIViewController, InComingViewControllerProtocol {

    // MARK: DI
    var interactor: InComingInteractorProtocol?
    var router: InComingRouterProtocol?

    var dataSource: InvitationDataSourceProtocol?

    func set(interactor: InComingInteractorProtocol) {
        self.interactor = interactor
    }

    func set(router: InComingRouterProtocol) {
        self.router = router
    }
    
    func set(dataSource: InvitationDataSourceProtocol) {
        self.dataSource = dataSource
    }

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet { prepareTableView() }
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        interactor?.getInvitations()
    }
}

// MARK: Methods
extension InComingViewController {

    func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
    }
    
    func set(incomingDataSource: [Appointment]) {
        dataSource?.set(data: incomingDataSource)
        tableView.reloadData()
    }

    func displayLoadingView(display: Bool) {
        display ? showLoadingView() : hideLoadingView()
    }

    func showLoadingView() {
        UIViewController.showActivityIndicator()
        tableView.separatorStyle = .none
    }

    func hideLoadingView() {
        UIViewController.removeActivityIndicator()
        tableView.separatorStyle = .singleLine
    }
}

extension InComingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let invitation = dataSource?.data[indexPath.row]
        router?.route(to: .invitationDetail(invitation: invitation))
    }
}

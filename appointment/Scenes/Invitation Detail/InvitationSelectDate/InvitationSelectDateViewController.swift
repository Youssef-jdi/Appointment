//
//  InvitationSelectDateViewController.swift
//  appointment
//
//  Created by Tran Gia Huy on 11/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol FinalDateDelegateProtocol {
    func handleFinalDateSet(_ date: AppointmentDate)
}

//sourcery: AutoMockable
protocol InvitationSelectDateViewControllerProtocol: class, UIViewControllerRouting {
    func set(interactor: InvitationSelectDateInteractorProtocol)
    func set(router: InvitationSelectDateRouterProtocol)
    func set(dataSource: InvitationSelectDataSourceProtocol)
    func set(appointment: Appointment)
    func set(appointmentDateViewModelProvider: AppointmentViewModelProviderProtocol)
    func set(delegate: FinalDateDelegateProtocol?)

    func displaySelectFinalDate(_ date: AppointmentDate)
}

class InvitationSelectDateViewController: UIViewController, InvitationSelectDateViewControllerProtocol {

    // MARK: - Outlet
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - DI
    private var interactor: InvitationSelectDateInteractorProtocol?
    private var router: InvitationSelectDateRouterProtocol?
    private var dataSource: InvitationSelectDataSourceProtocol?
    private var appointmentDateViewModelProvider: AppointmentViewModelProviderProtocol?
    private var delegate: FinalDateDelegateProtocol?

    private var appointment: Appointment?

    func set(interactor: InvitationSelectDateInteractorProtocol) {
        self.interactor = interactor
    }

    func set(router: InvitationSelectDateRouterProtocol) {
        self.router = router
    }

    func set(dataSource: InvitationSelectDataSourceProtocol) {
        self.dataSource = dataSource
    }

    func set(appointment: Appointment) {
        self.appointment = appointment
    }

    func set(appointmentDateViewModelProvider: AppointmentViewModelProviderProtocol) {
        self.appointmentDateViewModelProvider = appointmentDateViewModelProvider
    }
    
    func set(delegate: FinalDateDelegateProtocol?) {
        self.delegate = delegate
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigation()
        setupDataSource()
    }

    func displaySelectFinalDate(_ date: AppointmentDate) {
        delegate?.handleFinalDateSet(date)
        router?.route(to: .goBack)
    }
}

// MARK: - Privates
private extension InvitationSelectDateViewController {
    func setupCollectionView() {
        collectionView.register(UINib(nibName: InvitationSelectDateCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: InvitationSelectDateCollectionCell.identifier)
        collectionView.register(UINib(nibName: InvitationSelectDateHeaderView.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: InvitationSelectDateHeaderView.identifier)
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        setUpCollectionFlowLayout()
    }

    func setUpCollectionFlowLayout() {
        guard let flow = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flow.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        flow.minimumLineSpacing = 15
        flow.minimumInteritemSpacing = 10
        flow.itemSize = CGSize(width: view.frame.width, height: 180)
        flow.headerReferenceSize = CGSize(width: view.frame.width, height: 55)
    }   

    func setupNavigation() {
        navigationItem.title = "Datum kiezen" // TODO: Localize
        let rightItem = UIBarButtonItem(title: "PRIKKEN", style: .plain, target: self, action: #selector(confirmButtonTapped))
        navigationItem.rightBarButtonItem = rightItem
    }

    func setupDataSource() {
        guard let appointment = appointment,
            let dates = appointment.dates else { return }
        dataSource?.set(collectionView: self.collectionView)
        dataSource?.set(dates: dates)
    }
}

@objc extension InvitationSelectDateViewController {
    func confirmButtonTapped() {
        guard let dateViewModel = dataSource?.getSelectedDate() else { print("no date chosen"); return }
        router?.route(to: .chooseDate(date: dateViewModel, delegate: self))
    }
}

// MARK: - CustomPopupWithTwoButtonsDelegate
extension InvitationSelectDateViewController: CustomPopupWithTwoButtonsDelegate {
    func tappedRightButton() {
        dataSource?.data().forEach({ date, val in
            guard val else { return }
            interactor?.setFinalDate(date: date)
        })
    }
}

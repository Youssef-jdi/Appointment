//
//  AddDateViewController.swift
//  appointment
//
//  Created by Tran Gia Huy on 30/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit
//sourcery: AutoMockable
protocol AddDateDelegate: class {
    func didAdd(date: AppointmentDate)
}

//sourcery: AutoMockable
protocol AddDateViewControllerProtocol: class, UIViewControllerRouting {
    func set(invitation: Appointment)

    func displayStartDate(_ date: String)
    func displayEndTime(_ time: String)
    
    func displayCalendar(_ viewController: DayCalendarViewController)
    func displayCalendar(for date: Date)
    
    func displayDateAdded(_ date: AppointmentDate)
}

class AddDateViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var startDayLabel: UILabel!
    
    @IBOutlet weak var calendarContainerView: UIView!
    @IBOutlet weak var startDateStackView: UIStackView! {
        didSet {
            startDateStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(startDateTapped)))
        }
    }
    @IBOutlet weak var startDatePicker: UIDatePicker! {
        didSet {
            startDatePicker.addTarget(self, action: #selector(didSelectStartDate), for: .valueChanged)
        }
    }

    @IBOutlet weak var endDatePicker: UIDatePicker! {
        didSet {
            endDatePicker.addTarget(self, action: #selector(didSelectEndTime), for: .valueChanged)
        }
    }

    @IBOutlet weak var endDateStackView: UIStackView! {
        didSet {
            endDateStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endDateTapped)))
        }
    }
    @IBOutlet weak var startDateSeperator: UIStackView!
    @IBOutlet weak var endDatePickerContainer: UIStackView!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    // MARK: - Properties
    var isShowingStartDatePicker = false
    var isShowingEndDatePicker = false
    var invitation: Appointment?
    
    // MARK: - DI
    private var router: AddDateRouterProtocol?
    private var interactor: AddDateInteractorProtocol?
    private weak var delegate: AddDateDelegate?

    func set(interactor: AddDateInteractorProtocol) {
        self.interactor = interactor
    }

    func set(router: AddDateRouterProtocol) {
        self.router = router
    }
    
    func set(delegate: AddDateDelegate?) {
        self.delegate = delegate
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        interactor?.handleViewDidLoad()
    }
}

// MARK: - Privates
private extension AddDateViewController {
    func setupNavigation() {
        navigationItem.title = R.string.localizable.newProposal()
        let suggestButton = UIBarButtonItem(
            title: R.string.localizable.suggest().uppercased(),
            style: .plain,
            target: self,
            action: #selector(suggestDayTapped)
        )
        navigationItem.rightBarButtonItem = suggestButton
    }
}

// MARK: - Actions
@objc extension AddDateViewController {
    func didSelectStartDate(sender: UIDatePicker) {
        if sender.date.timeIntervalSinceNow.sign == .minus {
            sender.date = Date()
        } else {
            interactor?.handleSelectStartDate(date: sender.date)
        }
    }

    func suggestDayTapped() {
        interactor?.handleSuggestDayTapped()
    }

    func didSelectEndTime(sender: UIDatePicker) {
        interactor?.handleSelectEndDate(date: sender.date)
    }

    func startDateTapped() {
        self.isShowingStartDatePicker.toggle()
        self.isShowingEndDatePicker = false
        startDatePicker.isHidden = !isShowingStartDatePicker
        startDateSeperator.isHidden = !isShowingStartDatePicker
        endDatePickerContainer.isHidden = true
    }

    func endDateTapped() {
        self.isShowingEndDatePicker.toggle()
        startDatePicker.isHidden = true
        startDateSeperator.isHidden = true
        endDatePickerContainer.isHidden = !isShowingEndDatePicker
    }
}

// MARK: - Protocol Methods
extension AddDateViewController: AddDateViewControllerProtocol {
    func set(invitation: Appointment) {
        self.invitation = invitation
        interactor?.handleSetInvitation(invitation)
    }

    func displayStartDate(_ date: String) {
        startDayLabel.text = date
        view.layoutIfNeeded()
    }

    func displayEndTime(_ time: String) {
        endTimeLabel.text = time
        view.layoutIfNeeded()
    }
    
    func displayCalendar(_ viewController: DayCalendarViewController) {
        addChild(viewController)
        calendarContainerView.addSubview(viewController.view)
        viewController.view.frame = calendarContainerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    
    func displayCalendar(for date: Date) {
        guard let calendar = self.children.first as? DayCalendarViewController else { return }
        calendar.setNew(date: date)
    }
    
    func displayDateAdded(_ date: AppointmentDate) {
        delegate?.didAdd(date: date)
        router?.route(to: .goBack)
    }
}

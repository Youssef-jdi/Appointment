//
//  NewInvitationDetailViewController.swift
//  appointment
//
//  Created by Irina Filkovskaya on 29/06/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import MapKit

protocol NewInvitationDetailViewControllerProtocol: UIViewControllerRouting, AddDateDelegate {
    func set(interactor: NewInvitationDetailInteractorProtocol)
    func set(router: NewInvitationDetailRouterProtocol)
    func set(dataSource: NewInvitationDetailDataSourceProtocol)
    func set(invitation: Appointment?, isOutgoing: Bool)
    
    /// Displays the basic info (title, creator, address, nr on invitees)
    func displayBasicInfo(_ viewModel: AppointmentBasicViewModel)
    /// Hides the basic info and displays a dialogue (for the Outgoing invitation,
    /// if one of the invitees has proposed a new possible date)
    func displayProposedDate(dateString: String)

    func displaySuggestedDates(_ dates: [AppointmentDate])
    
    /// Displays the final date selected for the invitation + toggles the controls
    /// related to the dates management (suggesting/proposing and selecting final)
    func displaySelectedDate(_ date: AppointmentDate)
    func displayAddFinalDateToCalendarDialogue(creator: Bool, title: String)
    
    func displayCalendarStatusSet(isAdded: Bool)
    
    func displayLocation(_ coordinate: CLLocationCoordinate2D)
    func displayEmptyLocation()
    
    func displayAddons(_ data: [InvitationAddon])
    func displayChats(_ chats: [InvitationAddon])

    func displayCancelInvitationSuccess()

    func displayIncomingFinalDate(date: String, isConflicted: Bool, title: String)
}

class NewInvitationDetailViewController: UIViewController {
    
    // MARK: - Properties
    private var isBeingEdited = false
    private var invitation: Appointment?
    private var isOutgoing: Bool = true
    private var dateStatus: AppointmentDateStatus = .suggested
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var basicInfoView: InvitationBasicInfoView!
    @IBOutlet weak var topDialogueView: TopDialogueView! {
        didSet {
            topDialogueView.isHidden = true
        }
    }
    
    @IBOutlet weak var datesTableView: UITableView!
    @IBOutlet weak var tableViewHightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var dataStackView: UIStackView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var bottomButtonsStackView: UIStackView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var suggestDateButton: UIButton!
    
    // MARK: - DI
    private var interactor: NewInvitationDetailInteractorProtocol?
    private var router: NewInvitationDetailRouterProtocol?
    private var dataSource: NewInvitationDetailDataSourceProtocol?

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        isOutgoing ? setupNavigationOutgoing() : setupNavigationIncoming()
        topDialogueView.delegate = self
        setupTableView()
        setupBottomButtons()
        interactor?.handleViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.handleViewWillAppear()
        checkIncomingFinalDate()
    }

    private func checkIncomingFinalDate() {
        guard let invitation = invitation, !self.isOutgoing else { return }
        interactor?.handleDateIsSelected(incoming: invitation)
    }
}

// MARK: - Privates
private extension NewInvitationDetailViewController {
    // MARK: Bottom Buttons
    func setupBottomButtons() {
        cancelButton.setTitle(
            R.string.localizable.denyInvitation().uppercased(),
            for: .normal
        )
        suggestDateButton.setTitle(
            R.string.localizable.suggestDateInvitation().uppercased(),
            for: .normal
        )
        if invitation?.appointmentStatus == .cancelled {
            bottomButtonsStackView.removeFromSuperview()
            navigationItem.rightBarButtonItems?.removeLast()
        }
    }
    
    // MARK: Table View
    func setupTableView() {
        datesTableView.register(UINib(resource: R.nib.invitationProposedDateCell), forCellReuseIdentifier: R.nib.invitationProposedDateCell.identifier)
        datesTableView.register(UINib(resource: R.nib.invitationDetailDateTitleView), forCellReuseIdentifier: R.nib.invitationDetailDateTitleView.identifier )
        datesTableView.delegate = self
        datesTableView.dataSource = dataSource
        datesTableView.isScrollEnabled = false
    }
    
    func updateTableView() {
        datesTableView.reloadData()
        tableViewHightConstraint.constant = datesTableView.contentSize.height
    }
    
    // MARK: Navigation
    func setupNavigationEditing() {
        navigationItem.title = R.string.localizable.editInvitation()
        let checkItem = UIBarButtonItem(
            image: R.image.inv??tationItems.icn_check_white(),
            style: .plain,
            target: self,
            action: #selector(saveInvitation)
        )
        navigationItem.rightBarButtonItems = [checkItem]
        navigationItem.leftBarButtonItems = []
    }

    func setupNavigationOutgoing() {
        navigationItem.title = R.string.localizable.outgoing()
        let menuItem = UIBarButtonItem(
            image: R.image.menu_Button(),
            style: .plain,
            target: self,
            action: #selector(menuClicked))
        let pinItem = UIBarButtonItem(
            image: R.image.inv??tationItems.pin1(),
            style: .plain,
            target: self,
            action: #selector(pinTapped)
        )
        let pencilItem = UIBarButtonItem(
            image: R.image.inv??tationItems.icn_pencil(),
            style: .plain,
            target: self,
            action: #selector(pencilButtonTapped)
        )
        navigationItem.leftBarButtonItem = menuItem
        navigationItem.rightBarButtonItems = [pencilItem, pinItem]
    }

    func setupNavigationIncoming() {
        navigationItem.title = R.string.localizable.incoming()
        let menuItem = UIBarButtonItem(
            image: R.image.menu_Button(),
            style: .plain,
            target: self,
            action: #selector(menuClicked)
        )
        navigationItem.leftBarButtonItem = menuItem
    }
}

// MARK: - Actions
extension NewInvitationDetailViewController {
    @IBAction func cancelClicked(_ sender: Any) {
        router?.route(to: .cancel(delegate: self))
    }

    @IBAction func newDateButtonTapped(_ sender: Any) {
        guard let invitation = invitation else { return }
        router?.route(to: .addDate(invitation: invitation))
    }
}

@objc extension NewInvitationDetailViewController {
    func pinTapped() {
        guard let appointment = invitation else { return }
        router?.route(to: .selectDate(appointment: appointment))
    }

    func menuClicked() {
        sideMenuController?.revealMenu()
    }
    
    func pencilButtonTapped() {
//        isBeingEdited = true
        basicInfoView.edit()
        setupNavigationEditing()
    }
    
    func saveInvitation() {
        isOutgoing ? setupNavigationOutgoing() : setupNavigationIncoming()
        // TODO: saving the edited description and/or location
//        interactor.handleSaveDescription()
        let newDescription = basicInfoView.description()
        basicInfoView.update(description: newDescription)
    }
}

// MARK: - Protocol methods
extension NewInvitationDetailViewController: NewInvitationDetailViewControllerProtocol {
    func set(interactor: NewInvitationDetailInteractorProtocol) {
        self.interactor = interactor
    }

    func set(router: NewInvitationDetailRouterProtocol) {
        self.router = router
    }
    
    func set(dataSource: NewInvitationDetailDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func set(invitation: Appointment?, isOutgoing: Bool) {
        self.invitation = invitation
        self.isOutgoing = isOutgoing // TODO
        dataSource?.set(invitation: invitation)
        interactor?.handleSet(invitation: invitation, isOutgoing: isOutgoing)
    }

    func displayIncomingFinalDate(date: String, isConflicted: Bool, title: String) {
        basicInfoView.isHidden = true
        topDialogueView.isHidden = false
        topDialogueView.configure(for: .finalDateSetIncoming(date, isConflicted, title))
    }
    
    func displayBasicInfo(_ viewModel: AppointmentBasicViewModel) {
        basicInfoView.configure(for: viewModel)
        basicInfoView.isHidden = false
        topDialogueView.isHidden = true
    }
    
    func displayProposedDate(dateString: String) {
        basicInfoView.isHidden = true
        topDialogueView.isHidden = false
        topDialogueView.configure(for: .newProposedDate(dateString))
    }
    
    func displayAddons(_ data: [InvitationAddon]) {
        data.forEach { addon in
            let view = InvitationAddonView()
            view.isUserInteractionEnabled = true
            view.set(delegate: self)
            view.configure(for: addon)
            dataStackView.addArrangedSubview(view)
        }
    }
    
    func displayChats(_ chats: [InvitationAddon]) {
        chats.forEach { chat in
            let view = InvitationAddonView()
            view.isUserInteractionEnabled = true
            view.set(delegate: self)
            view.configure(for: chat)
            dataStackView.addArrangedSubview(view)
        }
    }
    
    func displayCancelInvitationSuccess() {
        router?.route(to: .backToInvitations) // TODO
    }
    
    func didAdd(date: AppointmentDate) { // TODO
        guard var dates = dataSource?.data() else { return }
        dates.append(date)
        dates.sort { ($0.startTime ?? 0) < ($1.startTime ?? 0) }
        var updatedInvitation = self.invitation
        updatedInvitation?.dates = dates
        
        set(invitation: updatedInvitation, isOutgoing: isOutgoing)
        dataSource?.set(dates: dates)
        updateTableView()
    }
    
    func displaySuggestedDates(_ dates: [AppointmentDate]) {
        self.dateStatus = .suggested
        dataSource?.set(dates: dates)
        updateTableView()
    }
    
    func displaySelectedDate(_ date: AppointmentDate) {
        self.dateStatus = .finalized
        dataSource?.set(dates: [date])
        updateTableView()
        suggestDateButton.removeFromSuperview()
        navigationItem.rightBarButtonItems?.removeLast()
    }
    
    func displayAddFinalDateToCalendarDialogue(creator: Bool, title: String) {
        basicInfoView.isHidden = true
        topDialogueView.isHidden = false
        creator
            ? topDialogueView.configure(for: .finalDateSetOutgoing(title))
            : ()
        // TODO: add configuraing for an invitee instead of : ()
    }
    
    func displayCalendarStatusSet(isAdded: Bool) {
        basicInfoView.isHidden = false
        topDialogueView.isHidden = true
        isAdded ? router?.route(to: .setReminder) : ()
    }

    func displayLocation(_ coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.setRegion(MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500), animated: false)
        mapView.addAnnotation(annotation)
    }
    
    func displayEmptyLocation() {
        mapView.isHidden = true
    }
}

// MARK: - CustomPopupWithTwoButtonsDelegate
extension NewInvitationDetailViewController: CustomPopupWithTwoButtonsDelegate {
    func tappedRightButton() {
        guard let invitation = invitation else { return }

        let asAdmin: ()? = interactor?.cancelAsCreator(invitation: invitation)
        let asInvited: ()? = interactor?.cancelAsInvitee(invitation: invitation)

        isOutgoing ? asAdmin : asInvited
    }
}

// MARK: - Addon View Delegate
extension NewInvitationDetailViewController: InvitationAddonViewDelegate {
    func handleTap(sender: InvitationAddon?) {
        guard let sender = sender else { return }
        
        switch sender {
        case .attachments(let data):
            router?.route(to: .attachments(title: "\(data?.count ?? 0) " + sender.title)) // TODO: update routing to pass the attachments
        case .todo(let data):
            router?.route(to: .todo(title: sender.title)) // TODO: update routing to pass the TODOs
        case .newChat:
            guard let invitation = invitation else { return }
            router?.route(to: .newChat(title: sender.title, invitation: invitation))
        case .chatGroup(let title), .chatPrivate(let title): // TODO
            guard let invitation = invitation else { return }
            router?.route(to: .chat(title: title, invitation: invitation))
        }
    }
}

// MARK: - Table View Delegate
extension NewInvitationDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableCell(withIdentifier: R.nib.invitationDetailDateTitleView.identifier) as? InvitationDetailDateTitleView else { return UIView(frame: .zero) }
        headerView.configure(for: dateStatus)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let date = dataSource?.data()[indexPath.row] else {
            return assertionFailure("dates is nil")
        }
        guard !self.isOutgoing else {
            router?.route(to: .availabilityOverview(appointmentDate: date))
            return
        }
        var countDates = 0
        countDates = dataSource?.data().count ?? 0
        let pageNumber = "\(indexPath.row + 1)" + "/" + "\(String(describing: countDates))"
        router?.route(to: .setAvailability(appointmentDate: date, pageNumber: pageNumber))
        // TODO: add check for the respondedTo and no routing then? Because now the app
        // crashed if trying to open availabilityOverview for a newly added proposed date
    }
}

// MARK: - TopDialogueViewDelegate
extension NewInvitationDetailViewController: TopDialogueViewDelegate {
    func cancelButtonTapped(at sender: TopDialogueType?) {
        guard let invitation = invitation else { return }
        switch sender {
        case .newProposedDate:
            interactor?.handleRejectProposedDate(invitation: invitation)
        case .finalDateSetOutgoing:
            interactor?.handleHideFromTimeline(invitation)
        default: break
        }
    }
    
    func confirmButtonTapped(at sender: TopDialogueType?) {
        guard let invitation = invitation else { return }
        switch sender {
        case .newProposedDate:
            interactor?.handleAcceptProposedDate(invitation: invitation)
        case .finalDateSetOutgoing, .finalDateSetIncoming:
            interactor?.handleAddToTimeline(invitation)
        default: break
        }
    }
}

// MARK: - FinalDateDelegateProtocol
extension NewInvitationDetailViewController: FinalDateDelegateProtocol {
    func handleFinalDateSet(_ date: AppointmentDate) {
        interactor?.handleSetFinalDate(date)
    }
}

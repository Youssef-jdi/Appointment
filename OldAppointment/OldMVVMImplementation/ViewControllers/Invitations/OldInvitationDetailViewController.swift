////
////  InvitationDetailViewController.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 16.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//import MapKit
//
//class InvitationDetailViewController: BaseViewController, Storyboardable, MVVMViewController {
//    static var storyboardName: String { return "Invitation" }
//    static var storyboardIdentifier: String { return "InvitationDetailTableViewController" }
//    
//    typealias ViewModel = InvitationsViewModel
//    
//    // MARK: Variables
//    var heightObservation: NSKeyValueObservation?
//    var viewModel = ViewModel()
//    var eventId: String!
//
//    // MARK: IBOutlets
//    @IBOutlet private weak var tableViewHeightConstraint: NSLayoutConstraint!
//    @IBOutlet private weak var tableView: UITableView! {
//        didSet {
//            tableView.delegate = self
//            tableView.dataSource = self
//            tableView.separatorStyle = .none
//            tableView.register(UINib(resource: R.nib.invitationDateTableViewCell), forCellReuseIdentifier: R.reuseIdentifier.invitationDateTableViewCell.identifier)
//            tableView.register(UINib(resource: R.nib.invitationGeneralTableViewCell), forCellReuseIdentifier: R.reuseIdentifier.invitationGeneralTableViewCell.identifier)
//            tableView.rowHeight = UITableView.automaticDimension
//            tableView.isScrollEnabled = false
//            heightObservation = tableView.observe(\.contentSize) { [weak self] table, _ in
//                let height = table.contentSize.height
//                self?.tableViewHeightConstraint.constant = height
//                self?.view.layoutIfNeeded()
//            }
//        }
//    }
//    @IBOutlet private weak var invitationDateSuggestionPopUp: InvitationPopUp!
//    @IBOutlet private weak var roundedViewDateSuggestion: RoundedView!
//    @IBOutlet private weak var invitationTypeImageView: UIImageView! {
//        didSet {
//            invitationTypeImageView.contentMode = .scaleAspectFit
//        }
//    }
//    @IBOutlet private weak var mapView: MKMapView! {
//        didSet {
//            mapView.delegate = self
//            mapView.isScrollEnabled = false
//            mapView.isRotateEnabled = false
//            mapView.isZoomEnabled = false
//        }
//    }
//    @IBOutlet private weak var titleLabel: UILabel!
//    @IBOutlet private weak var adressLabel: UILabel!
//    @IBOutlet private weak var timeLabel: UILabel!
//    @IBOutlet private weak var ownerLabel: UILabel!
//    @IBOutlet private weak var dataLabel: UILabel! {
//        didSet {
//            dataLabel.font = R.font.openSansBold(size: 16)
//            dataLabel.text = "\t"+R.string.localizable.data.key.localized.firstCapitalized
//        }
//    }
//    @IBOutlet private weak var denieLabel: UILabel! {
//        didSet {
//            denieLabel.text = R.string.localizable.denieMeeting.key.localized.uppercased()
//        }
//    }
//    @IBOutlet private weak var changeDateLabel: UILabel! {
//        didSet {
//            changeDateLabel.text = R.string.localizable.changeDateInvitation.key.localized.uppercased()
//        }
//    }
//    @IBOutlet private weak var totalPersonCountLabel: UILabel! {
//        didSet {
//            totalPersonCountLabel.text = R.string.localizable.totalPersonCount.key.localizedWithCount(count: 3)
//        }
//    }
//    @IBOutlet private weak var descriptionTextView: UITextView!
//    @IBOutlet private weak var reminderNotificationLabel: UILabel! {
//        didSet {
//            reminderNotificationLabel.text = R.string.localizable.reminderNotification.key.localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private weak var notReactedNotificationLabel: UILabel! {
//        didSet {
//            notReactedNotificationLabel.text = R.string.localizable.notReactedNotification.key.localized.capitalizingFirstLetter()
//        }
//    }
//    @IBOutlet private var buttonBackgroundViews: [UIView]!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigationItem.title = R.string.localizable.invitations().capitalizingFirstLetter()
//        bindViewModel()
//        createBarButtons()
//        viewModel.getDetails(id: 1)
//        //self.prepareDateSuggestionView(image: R.image.popUp_dateSugesstion_outgoing()!, ownerName: "Onur H. Cantay", appointmentName: "Party", dateName: "25 12 1996", timeName: "21:00 - 22:30")
//        self.prepareAddAppointmentToAgenda()
//    }
//    
//    override func applyTheme(theme: ProductModel) {
//        super.applyTheme(theme: theme)
//        buttonBackgroundViews[0].backgroundColor = theme.firstColor
//        buttonBackgroundViews[1].backgroundColor = theme.highlightColor
//    }
//    
//    // MARK: PopUp Variables
//    lazy var sendReminderPopUp: MultipleButtonAlertViewController = {
//        let viewController = R.storyboard.popup.twoButtonAlert()!
//        let firstButtonTitle = NSAttributedString(
//            string: R.string.localizable.cancel.key.localized.uppercased(),
//            attributes: PopUpFontAttributes.denieMeetingCancelButton.value
//        )
//        let secondButtonTitle = NSAttributedString(
//            string: R.string.localizable.send.key.localized.uppercased(),
//            attributes: PopUpFontAttributes.denieMeetingApproveButton.value
//        )
//        
//        let viewModel = MultipleButtonAlertViewController.ViewModel(
//            popupImage: R.image.popUp_send_reminder()!,
//            firstDesctiption: NSMutableAttributedString(string: R.string.localizable.sendReminderPopUpFirstDescription.key.localized.firstCapitalized),
//            secondDescription: NSMutableAttributedString(string: R.string.localizable.sendReminderPopUpSecondDescription.key.localized.firstCapitalized),
//            wantedBlurViewBackground: false,
//            leftButtonPressed: sendReminderPopUpCancel,
//            rightButtonPressed: sendReminderPopUpSend,
//            numberOfButton: ButtonConfiguration.doubleButton(
//                firstButtonTitle: firstButtonTitle,
//                secondButtonTitle: secondButtonTitle,
//                firstButtonColor: .highlight,
//                secondButtonColor: .firstColor))
//        viewController.viewModel = viewModel
//        return viewController
//    }()
//    
//    lazy var denieInvitationPopUp: MultipleButtonAlertViewController = {
//        let viewController = R.storyboard.popup.twoButtonAlert()!
//        let firstButtonTitle = NSAttributedString(
//            string: R.string.localizable.no.key.localized.uppercased(),
//            attributes: PopUpFontAttributes.denieMeetingCancelButton.value
//        )
//        let secondButtonTitle = NSAttributedString(
//            string: R.string.localizable.yes.key.localized.uppercased(),
//            attributes: PopUpFontAttributes.denieMeetingApproveButton.value
//        )
//        let firstLocalized = R.string.localizable.cancelAppointmentPopUpFirst.key.localized.firstCapitalized
//        guard let title = self.viewModel.invitationModel?.title else { return  MultipleButtonAlertViewController() }
//        let firstLocalizedWithFormat = NSMutableAttributedString(string: String.localizedStringWithFormat(firstLocalized, ".\n"+title))
//        let rangeName = (firstLocalizedWithFormat.description as NSString).range(of: "\n"+title)
//        firstLocalizedWithFormat.addAttributes(PopUpFontAttributes.invitationOutGoingBoldAppBlue.value, range: rangeName)
//        let secondDesc = NSMutableAttributedString(string: R.string.localizable.cancelAppointmentPopUpSecond.key.localized.firstCapitalized, attributes:
//            PopUpFontAttributes.generalSecondDescriptionLightGray.value)
//        let viewModel = MultipleButtonAlertViewController.ViewModel(
//            popupImage: R.image.popUp_cancel_appointment_outgoing()!,
//            firstDesctiption: firstLocalizedWithFormat,
//            secondDescription: secondDesc,
//            wantedBlurViewBackground: false,
//            leftButtonPressed: denieInvitationPopUpCancel,
//            rightButtonPressed: denieInvitationPopUpAprove,
//            numberOfButton: ButtonConfiguration.doubleButton(
//                firstButtonTitle: firstButtonTitle,
//                secondButtonTitle: secondButtonTitle,
//                firstButtonColor: .highlight,
//                secondButtonColor: .firstColor))
//        viewController.viewModel = viewModel
//        return viewController
//    }()
//    
//    lazy var denieInvitationIncomingPopUp: MultipleButtonAlertViewController = {
//        let viewController = R.storyboard.popup.twoButtonAlert()!
//        let firstButtonTitle = NSAttributedString(
//            string: R.string.localizable.cancel.key.localized.uppercased(),
//            attributes: PopUpFontAttributes.denieMeetingCancelButton.value
//        )
//        let secondButtonTitle = NSAttributedString(
//            string: R.string.localizable.cancel.key.localized.uppercased(),
//            attributes: PopUpFontAttributes.denieMeetingApproveButton.value
//        )
//        let secondDesc = NSMutableAttributedString(string: R.string.localizable.invitationIncomingPopUpCancelAppointmentSecond.key.localized.firstCapitalized, attributes:
//            PopUpFontAttributes.generalSecondDescriptionLightGray.value)
//        let firstDesc = NSMutableAttributedString(string: R.string.localizable.invitationIncomingPopUpCancelAppointmentFirst.key.localized.firstCapitalized, attributes:
//            PopUpFontAttributes.invitationOutgoingAddToCalendar.value)
//        let viewModel = MultipleButtonAlertViewController.ViewModel(
//            popupImage: R.image.popUp_cancel_appointment_outgoing()!,
//            firstDesctiption: firstDesc,
//            secondDescription: secondDesc,
//            wantedBlurViewBackground: false,
//            leftButtonPressed: denieInvitationIncomingPopUpCancel,
//            rightButtonPressed: denieInvitationIncomingPopUpReject,
//            numberOfButton: ButtonConfiguration.doubleButton(
//                firstButtonTitle: firstButtonTitle,
//                secondButtonTitle: secondButtonTitle,
//                firstButtonColor: .white,
//                secondButtonColor: .firstColor))
//        viewController.viewModel = viewModel
//        return viewController
//    }()
//    
//    // MARK: IBActions
//    @IBAction private func denieButtonPressed(_ sender: UIButton) {
//        self.present(denieInvitationPopUp, animated: true, completion: nil)
//    }
//    
//    @IBAction private func newDateSuggestionPressed(_ sender: UIButton) {
//        print("choose date pressed")
//    }
//    
//    @IBAction private func sendReminderToParticipants(_ sender: UIButton) {
//        self.present(sendReminderPopUp, animated: true, completion: nil)
//    }
//    
//    @IBAction private func dateSuggestionCancel(_ sender: UIButton) {
//        roundedViewDateSuggestion.isHidden = true
//    }
//    
//    @IBAction private func dateSuggestionApprove(_ sender: UIButton) {
//        roundedViewDateSuggestion.isHidden = true
//    }
//    
//    // MARK: Preparation Functions
//    // swiftlint:disable function_parameter_count
//    func prepareHeaderView(title: String, createdDate: String, locationName: String, invitedTotalPersonCount: Int, descriptionText: String, image: UIImage) {
//        titleLabel.text = title
//        timeLabel.text = createdDate
//        adressLabel.text = locationName
//        totalPersonCountLabel.text = R.string.localizable.totalPersonCount.key.localizedWithCount(count: invitedTotalPersonCount)
//        descriptionTextView.text = descriptionText
//        invitationTypeImageView.image = image
//    }
//    
//    private func prepareDateSuggestionView(image: UIImage, ownerName: String, appointmentName: String, dateName: String, timeName: String) {
//        let firstLocalized = R.string.localizable.invitationOutgoingPopUpDateSuggestionFirst.key.localized
//        let firstFormattedLocalized = NSMutableAttributedString(
//            string: String.localizedStringWithFormat(
//                firstLocalized,
//                "\n"+ownerName,
//                appointmentName,
//                dateName,
//                timeName
//            )
//        )
//        let secondLocalized = R.string.localizable.memoToPopUpDateSuggestionSecond.key.localized
//        let rangeName = (firstFormattedLocalized.description as NSString).range(of: ownerName)
//        let groupName = (firstFormattedLocalized.description as NSString).range(of: appointmentName)
//        let dateName = (firstFormattedLocalized.description as NSString).range(of: dateName)
//        let timeName = (firstFormattedLocalized.description as NSString).range(of: timeName)
//        firstFormattedLocalized.addAttributes(PopUpFontAttributes.invitationOutGoingBoldBlack.value, range: rangeName)
//        firstFormattedLocalized.addAttributes(PopUpFontAttributes.invitationOutGoingBoldBlack.value, range: groupName)
//        firstFormattedLocalized.addAttributes(PopUpFontAttributes.invitationOutGoingBoldAppBlue.value, range: NSRange((dateName.lowerBound...timeName.upperBound - 1)))
//        invitationDateSuggestionPopUp.configureAlert(
//            image: R.image.popUp_dateSugesstion_outgoing()!,
//            firstDesc: firstFormattedLocalized,
//            secondDesc: NSMutableAttributedString(
//                string: secondLocalized,
//                attributes: PopUpFontAttributes.generalSecondDescriptionLightGray.value
//            ),
//            firstButtonTitleKey: R.string.localizable.dontAdd.key,
//            secondButtonTitleKey: R.string.localizable.add.key
//        )
//    }
//    
//    private func prepareAddAppointmentToAgenda() {
//        guard let title = viewModel.invitationModel?.title else { return }
//        let firstLocalized = NSMutableAttributedString(
//            string: String.localizedStringWithFormat(R.string.localizable.invitationPopUpOutgoingAddToCalendarFirst.key.localized, title),
//            attributes: PopUpFontAttributes.invitationOutgoingAddToCalendar.value
//        )
//        invitationDateSuggestionPopUp.configureAlert(
//            image: R.image.popUp_dateSugesstion_outgoing()!,
//            firstDesc: firstLocalized,
//            secondDesc: NSMutableAttributedString(
//                string: R.string.localizable.invitationPopUpOutgoingAddToCalendarSecond.key.localized,
//                attributes: PopUpFontAttributes.generalSecondDescriptionLightGray.value
//            ),
//            firstButtonTitleKey: R.string.localizable.cancel.key,
//            secondButtonTitleKey: R.string.localizable.addToCalendar.key
//        )
//        self.invitationDateSuggestionPopUp.isHidden = false
//    }
//    
//    private func createBarButtons() {
//        let editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//        editButton.addTarget(self, action: #selector(editPressed), for: .touchUpInside)
//        editButton.imageView?.contentMode = .scaleAspectFit
//        editButton.setImage(R.image.icn_pencil(), for: .normal)
//        editButton.translatesAutoresizingMaskIntoConstraints = false
//        editButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
//        editButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        let chooseDateButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//        chooseDateButton.imageView?.contentMode = .scaleAspectFit
//        chooseDateButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
//        chooseDateButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
//        chooseDateButton.addTarget(self, action: #selector(chooseDatePressed), for: .touchUpInside)
//        chooseDateButton.setImage(R.image.icn_pin_white(), for: .normal)
//        let editBarButton = UIBarButtonItem(customView: editButton)
//        let chooseDateBarButton = UIBarButtonItem(customView: chooseDateButton)
//        navigationItem.rightBarButtonItems = [editBarButton, chooseDateBarButton]
//        editButton.tintColor = .white
//        chooseDateButton.tintColor = .white
//    }
//}
//
//// MARK: Tableview Methods
//extension InvitationDetailViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let row = indexPath.row
//        switch viewModel.cellTypes[row] {
//        case .chat(let conversation):
//            let chatParentViewController = R.storyboard.chat.instantiateInitialViewController()!
//            chatParentViewController.chatType = conversation.chatType
//            navigationController!.pushViewController(chatParentViewController, animated: true)
//        case .newChat:
//            let newChatViewController = R.storyboard.newChat.instantiateInitialViewController()!
//            newChatViewController.newType = .group
//            navigationController!.pushViewController(newChatViewController, animated: true)
//            return
//        case .proposedDate:
//            let availabilityVc = R.storyboard.invitation.participantDiagramViewController()!
//            self.present(availabilityVc, animated: true)
//        default: break
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.cellTypes.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let row = indexPath.row
//        switch viewModel.cellTypes[row] {
//        case .giveAvailability:
//            return prepareAvailabilityCell()
//        case .proposedDate:
//            guard let invitationModel = viewModel.invitationModel else { return UITableViewCell() }
//            return prepareProposedDateCell(for: invitationModel, row: row)
//        case .todoList:
//            return prepareTodoListCell()
//        case .attachment:
//            return prepareAttachmentCell()
//        case .chat(let conversation):
//            return prepareChatCell(with: conversation)
//        case .newChat:
//            return prepareNewChatCell()
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let row = indexPath.row
//        switch viewModel.cellTypes[row] {
//        case .proposedDate:
//            guard let invitationModel = viewModel.invitationModel else { return }
//            guard let cell = cell as? InvitationDateTableViewCell else { return }
//            cell.updateConstraintOfRoundedView(with: invitationModel.proposedDates[indexPath.row].attendance.availabilityProccent)
//        default: break
//        }
//    }
//    private func prepareAvailabilityCell() -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.invitationGeneralTableViewCell.identifier) as? InvitationGeneralTableViewCell else { return UITableViewCell() }
//        cell.prepareCell(image: R.image.appointment_Attachment_Blue()!, title: R.string.localizable.giveAvailability.key.localized.capitalizingFirstLetter(), desc: nil )
//        return cell
//    }
//    
//    private func prepareProposedDateCell(for invitationModel: InvitationModel, row: Int) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.invitationDateTableViewCell.identifier) as? InvitationDateTableViewCell else { return UITableViewCell() }
//        let proposedDate = invitationModel.proposedDates[row]
//        let titleDate = proposedDate.formattedDateString
//        let timeText = proposedDate.formattedTimeString
//        let availabilityProccent = proposedDate.attendance.availabilityProccent
//        cell.prepareCell (
//            dateString: titleDate,
//            timeString: timeText,
//            confirmed: proposedDate.attendance.confirmed.count.description,
//            unsure: proposedDate.attendance.unsure.count.description,
//            cancelled: proposedDate.attendance.cancelled.count.description,
//            notResponded: proposedDate.attendance.notResponded.count.description,
//            availableProcent: availabilityProccent
//        )
//        return cell
//    }
//    
//    private func prepareTodoListCell() -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.invitationGeneralTableViewCell.identifier) as? InvitationGeneralTableViewCell else { return UITableViewCell() }
//        let cellDesc = viewModel.getTodoListDescription()
//        cell.prepareCell(image: R.image.appointment_Todo_List()!, title: R.string.localizable.todoList.key.localized.capitalizingFirstLetter(), desc: cellDesc )
//        return cell
//    }
//    
//    private func prepareAttachmentCell() -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.invitationGeneralTableViewCell.identifier) as? InvitationGeneralTableViewCell else { return UITableViewCell() }
//        let cellDesc = viewModel.invitationModel?.attachmentNamesSeperatedByComa
//        guard let invitationModel = viewModel.invitationModel else { return UITableViewCell() }
//        cell.prepareCell(
//            image: R.image.appointment_Attachment_Blue()!,
//            title: R.string.localizable.attachments.key.localizedWithCount(count: invitationModel.attachments.count).capitalizingFirstLetter(),
//            desc: cellDesc
//        )
//        return cell
//    }
//    
//    private func prepareChatCell(with conversation: Conversation) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.invitationGeneralTableViewCell.identifier) as? InvitationGeneralTableViewCell else { return UITableViewCell() }
//        let cellDesc = conversation.countParticipants.description
//        cell.prepareCell(image: R.image.comment()!, title: conversation.name.localized.firstCapitalized, desc: cellDesc)
//        return cell
//    }
//    
//    private func prepareNewChatCell() -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.invitationGeneralTableViewCell.identifier) as? InvitationGeneralTableViewCell else { return UITableViewCell() }
//        cell.prepareCell(image: R.image.appointment_Attachment_Blue()!, title: R.string.localizable.openNewChat.key.localized.capitalizingFirstLetter(), desc: nil )
//        return cell
//    }
//}
//// MARK: MAPViewDelegate
//extension InvitationDetailViewController: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard annotation is MKPointAnnotation else { return nil }
//        
//        let identifier = "Annotation"
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//        
//        if annotationView == nil {
//            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView!.canShowCallout = true
//        } else {
//            annotationView!.annotation = annotation
//        }
//        
//        return annotationView
//    }
//    func addPin(title: String, latitude: Double, longtitude: Double) {
//        let annotation = MKPointAnnotation()
//        let centerCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
//        annotation.coordinate = centerCoordinate
//        annotation.title = title
//        mapView.addAnnotation(annotation)
//    }
//    func focusMapView(latitude: Double, longtitude: Double) {
//        let mapCenter = CLLocationCoordinate2DMake(latitude, longtitude)
//        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//        let region = MKCoordinateRegion(center: mapCenter, span: span)
//        self.mapView.region = region
//    }
//}
//
//// MARK: PopUp Functions
//private extension InvitationDetailViewController {
//    @objc func editPressed() {
//        self.roundedViewDateSuggestion.isHidden = false
//    }
//    
//    @objc func chooseDatePressed() {
//    }
//    
//    // MARK: PopUp Functions
//    func sendReminderPopUpCancel(_ alert: UIViewController) {
//        alert.dismiss(animated: true, completion: nil)
//    }
//    
//    func sendReminderPopUpSend(_ alert: UIViewController) {
//        alert.dismiss(animated: true) {
//            print("something")
//        }
//    }
//    
//    func sendReminderNotReactedPopUpCancel(_ alert: UIViewController) {
//        alert.dismiss(animated: true, completion: nil)
//    }
//    
//    func sendReminderNotReactedPopUpSend(_ alert: UIViewController) {
//        alert.dismiss(animated: true) {
//            print("something more different")
//        }
//    }
//    
//    func denieInvitationPopUpCancel(_ alert: UIViewController) {
//        alert.dismiss(animated: true, completion: nil)
//    }
//    
//    func denieInvitationPopUpAprove(_ alert: UIViewController) {
//        alert.dismiss(animated: true) {
//            print("something more different")
//        }
//    }
//    func denieInvitationIncomingPopUpCancel(_ alert: UIViewController) {
//        alert.dismiss(animated: true, completion: nil)
//    }
//    
//    func denieInvitationIncomingPopUpReject(_ alert: UIViewController) {
//        alert.dismiss(animated: true) {
//            print("something more different as a reject")
//        }
//    }
//}
//
//private extension InvitationDetailViewController {
//    func bindViewModel() {
//        self.viewModel.stateHandler = { [weak self] state in
//            guard let self = self else { return }
//            switch state {
//            case .value(let valueType):
//                switch valueType {
//                case .fetchedDetails:
//                    let headerImage = self.viewModel.getInvitationTypeImage()
//                    let invitationModel = self.viewModel.invitationModel!
//                    let createdDate = invitationModel.createdDateString
//                    self.prepareHeaderView (
//                        title: invitationModel.title,
//                        createdDate: createdDate,
//                        locationName: invitationModel.location.locality,
//                        invitedTotalPersonCount: invitationModel.participantUserIDS.count,
//                        descriptionText: invitationModel.description,
//                        image: headerImage!
//                    )
//                    self.tableView.reloadData()
//                    let latitude = invitationModel.location.latitude
//                    let longtitude = invitationModel.location.longitude
//                    self.addPin(title: invitationModel.title, latitude: latitude, longtitude: longtitude)
//                    self.focusMapView(latitude: latitude, longtitude: longtitude)
//                    // TODO: - Localize
//                    let isIncomming = invitationModel.isIncoming
//                        ? " - \(R.string.localizable.incoming().capitalizingFirstLetter())"
//                        : " - \(R.string.localizable.outgoing().capitalizingFirstLetter())"
//                    self.navigationItem.title = R.string.localizable.invitations().capitalizingFirstLetter()
//                        + isIncomming
//                    //self.view.layoutIfNeeded()
//                }
//            case .error(let errorType):
//                switch errorType {
//                case .underlying(let error):
//                    print(error.localizedDescription)
//                default: break
//                }
//            default: break
//            }
//        }
//    }
//}

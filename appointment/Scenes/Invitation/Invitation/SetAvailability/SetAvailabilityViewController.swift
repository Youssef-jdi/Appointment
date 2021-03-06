//
//  SetAvailabilityViewController.swift
//  appointment
//
//  Created by Jihen on 09/07/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

//sourcery: AutoMockable
protocol SetAvailabilityViewControllerProtocol: class, UIViewControllerRouting {
    func set(interactor: SetAvailabilityInteractorProtocol)
    func set(router: SetAvailabilityRouterProtocol)
    func set(date: AppointmentDate)
    func set(pageNumber: String)
    
    func displayAvailabilitySet()
    func displayDateTime(date: String, time: String)
}

class SetAvailabilityViewController: UIViewController, SetAvailabilityViewControllerProtocol {
    
    // MARK: - Properties
    private var date: AppointmentDate?
    private var buttonState : AvailabilityTypeModel?
    private var isAvailableClicked = false
    private var isUnavailableClicked = false
    private var isUnknownClicked = false
    private var isCommentClicked = false
    private var commentText = ""
    private var pageNumber = ""
    
    // MARK: - DI
    private var interactor: SetAvailabilityInteractorProtocol?
    private var router: SetAvailabilityRouterProtocol?
    private let datasource = AvailabilityOverviewDatasource()
    
    func set(interactor: SetAvailabilityInteractorProtocol) {
        self.interactor = interactor
    }
    
    func set(router: SetAvailabilityRouterProtocol) {
        self.router = router
    }
    
    func set(date: AppointmentDate) {
        self.date = date
    }
    
    func set(pageNumber: String) {
        self.pageNumber = pageNumber
    }
    
    // MARK: - Outlet
    
    @IBOutlet weak var leftArrowImageview: UIImageView! {
        didSet {
            leftArrowImageview.tintColor = R.color.appBlue()
        }
    }
    @IBOutlet weak var rightArrowImageview: UIImageView! {
        didSet {
            rightArrowImageview.tintColor = R.color.appBlue()
        }
    }
    @IBOutlet weak var dateNumberLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timePeriodLabel: UILabel!
    @IBOutlet weak var availableButton: UIButton!
    @IBOutlet weak var unknownAvailabilityButton: UIButton!
    @IBOutlet weak var unavailableButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentSectionStackView: UIStackView!
    @IBOutlet weak var commentView: CommentFieldView!
    @IBOutlet weak var proposeDateButton: UIButton!
    @IBOutlet weak var proposeDateImageView: UIImageView! {
        didSet {
            proposeDateImageView.tintColor = R.color.appBlue()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonState = .none
        setupNavigationBar()
        interactor?.handleViewDidLoad(date: date)
    }
    
    // MARK: - Actions
    
    @IBAction func availableButtonTapped(_ sender: Any) {
        buttonState = .available
        isAvailableClicked.toggle()
        if !isAvailableClicked {
            if !isUnknownClicked && !isCommentClicked && !isUnavailableClicked {
                buttonState = .none
            }
        }
        SetupButtons()
    }
    
    @IBAction func unknownButtonTapped(_ sender: Any) {
        buttonState = .unknown
        isUnknownClicked.toggle()
        if !isUnknownClicked {
            if !isAvailableClicked && !isCommentClicked && !isUnavailableClicked {
                buttonState = .none
            }
        }
        SetupButtons()
    }
    
    @IBAction func unavailbleButtonTapped(_ sender: Any) {
        buttonState = .unavailable
        isUnavailableClicked.toggle()
        if !isUnavailableClicked {
            if !isAvailableClicked && !isCommentClicked && !isUnknownClicked {
                buttonState = .none
            }
        }
        SetupButtons()
    }
    
    @IBAction func commentButonTapped(_ sender: Any) {
        buttonState = .comment
        isCommentClicked.toggle()
        if !isCommentClicked {
            if !isUnavailableClicked && !isUnknownClicked && !isAvailableClicked {
                buttonState = .none
            }
        }
        SetupButtons()
    }
    
    @IBAction func confirmComment(_ sender: Any) {
        guard let comment = commentView.commentTextField.text else { return }
        commentText = comment
        commentView.commentTextField.text = ""
    }
    
    func displayAvailabilitySet() {
        router?.route(to: .goBack)
    }
    
    func displayDateTime(date: String, time: String) {
        dateLabel.text = date
        timePeriodLabel.text = time
        dateNumberLabel.text = pageNumber
    }
}

private extension SetAvailabilityViewController {
    
    // Change Buttons color
    // to change after getting missing white buttons assets
    func SetupButtons() {
        switch buttonState {
        case .available:
            availableButton.setImage(R.image.ic_checkmark_red(), for: .normal)
            unknownAvailabilityButton.setImage(R.image.ic_questionmark_white(), for: .normal)
            unavailableButton.setImage(R.image.ic_cross_white(), for: .normal)
            commentButton.setImage(R.image.ic_message_white(), for: .normal)
            hideProposeDateSection()
        case .unavailable:
            unavailableButton.setImage(R.image.ic_cross_red(), for: .normal)
            availableButton.setImage(R.image.ic_checkmark_white(), for: .normal)
            unknownAvailabilityButton.setImage(R.image.ic_questionmark_white(), for: .normal)
            commentButton.setImage(R.image.ic_message_white(), for: .normal)
            showProposedDateSection()
        case .unknown:
            unknownAvailabilityButton.setImage(R.image.ic_questionmark_red(), for: .normal)
            availableButton.setImage(R.image.ic_checkmark_white(), for: .normal)
            unavailableButton.setImage(R.image.ic_cross_white(), for: .normal)
            commentButton.setImage(R.image.ic_message_white(), for: .normal)
            hideProposeDateSection()
        case .comment:
            commentButton.setImage(R.image.ic_message_red(), for: .normal)
            availableButton.setImage(R.image.ic_checkmark_white(), for: .normal)
            unknownAvailabilityButton.setImage(R.image.ic_questionmark_white(), for: .normal)
            unavailableButton.setImage(R.image.ic_cross_white(), for: .normal)
            showCommentSection()
        case .none:
            hideProposeDateSection()
            availableButton.setImage(R.image.ic_checkmark_white(), for: .normal)
            unknownAvailabilityButton.setImage(R.image.ic_questionmark_white(), for: .normal)
            unavailableButton.setImage(R.image.ic_cross_white(), for: .normal)
            commentButton.setImage(R.image.ic_message_white(), for: .normal)
        }
    }
    
    func showCommentSection() {
        commentSectionStackView.isHidden = false
        proposeDateButton.isHidden = true
        proposeDateImageView.isHidden = true
    }
    func hideProposeDateSection() {
        commentSectionStackView.isHidden = true
        proposeDateButton.isHidden = true
        proposeDateImageView.isHidden = true
    }
    
    func showProposedDateSection() {
        commentSectionStackView.isHidden = true
        proposeDateButton.isHidden = false
        proposeDateImageView.isHidden = false
    }
}

private extension SetAvailabilityViewController {
    
    // MARK: - NavigationBar Setup
    
    private func setupNavigationBar() {
        navigationController?.title = R.string.localizable.incoming()
        let doneItem = UIBarButtonItem(title: "KLAAR",
                                       style: .plain,
                                       target: self,
                                       action: #selector(confirm))
        navigationItem.rightBarButtonItem = doneItem
    }
    
    // MARK: - NavigationBar Actions
    
    @objc func goBack() {
        router?.route(to: .goBack)
    }
    
    @objc func confirm() {
        // handle set availability according to clicked button
        guard let buttonState = buttonState else { return}
        guard let appointmentId = date?.appointmentId else { return }
        guard let dateId = date?.id else { return }
            interactor?.handleSetAvailability(appointmentId: appointmentId,
                                              dateId: dateId,
                                              comment: commentText,
                                              availability: buttonState)
    }
}

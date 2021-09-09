//
//  InvitationContainerViewController.swift
//  appointment
//
//  Created by Tran Gia Huy on 17/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol InvitationContainerViewControllerProtocol: class, UIViewControllerRouting {
    func displayChild(_ viewController: UIViewController)
    func displayContainerTabView(_ state: InvitationTabView.State, animated: Bool)
}

class InvitationContainerViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var invitationTabView: InvitationTabView! {
        didSet {
            invitationTabView.layer.applyShadow(offset: .init(width: 0, height: 5), radius: 10, opacity: 0.15, color: .black)
         invitationTabView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(containerTabViewTapped)))
        }
    }
    @IBOutlet weak var addInvitationButton: UIButton! {
        didSet {
            addInvitationButton.layer.applyShadow(offset: .init(width: 0, height: 5), radius: 10, opacity: 0.15, color: .black)
            addInvitationButton.addTarget(self, action: #selector(invitationButtonTapped), for: .touchUpInside)
            addInvitationButton.layer.cornerRadius = addInvitationButton.bounds.width / 2
        }
    }
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Properties
    private weak var subViewController: UIViewController?
    private var currentState: InvitationTabView.State = .outGoing
    private var interactor: InvitationContainerInteractorProtocol?
    private var router: InvitationContainerRouterProtocol?

    // MARK: - DI
    func set(interactor: InvitationContainerInteractorProtocol?) {
        self.interactor = interactor
    }

    func set(router: InvitationContainerRouterProtocol?) {
           self.router = router
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        interactor?.handleViewDidLoad()
    }
}

// MARK: - Actions
@objc extension InvitationContainerViewController {
    func menuButtonTapped(_ sender: Any) {
         sideMenuController?.revealMenu()
     }

    func goToInComing() {
        interactor?.handleChangeState(state: .inComing)
        currentState.toggle()
    }

    func goToOutGoing() {
        interactor?.handleChangeState(state: .outGoing)
        currentState.toggle()
    }

    func containerTabViewTapped() {
        currentState == .outGoing ? goToInComing() : goToOutGoing()
    }

    func invitationButtonTapped() {
        router?.route(to: .showPopUp)
    }
}

// MARK: - Protocol Methods
extension InvitationContainerViewController: InvitationContainerViewControllerProtocol {
    
    func displayContainerTabView(_ state: InvitationTabView.State, animated: Bool) {
        invitationTabView.toggle(state: state, animated: animated)
    }

    func displayChild(_ viewController: UIViewController) {
        self.children.forEach({
            $0.willMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        })
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        addChild(viewController)
        subViewController = viewController
        containerView.addSubview(viewController.view)
        viewController.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        viewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        viewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        viewController.didMove(toParent: self)
    }
}

// MARK: - Privates
private extension InvitationContainerViewController {
    private func setUpNavigationBar() {
        navigationItem.title = "APP!POiNTMENT STATUS" // TODO: Localize
        let menuItem = UIBarButtonItem(
            image: R.image.menu_Button(),
            style: .plain,
            target: self,
            action: #selector(menuButtonTapped)
        )
        navigationItem.leftBarButtonItem = menuItem
    }
}

//
//  ChatViewController.swift
//  appointment
//
//  Created by Tran Gia Huy on 30/04/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit

protocol ChatViewControllerProtocol: class, UIViewControllerRouting {
    func set(router: ChatRouterProtocol)
    func set(invitation: Appointment)
}

class ChatViewController: UIViewController {
    
    // MARK: - Properties
    private var router: ChatRouterProtocol?
    private var navigationTitle: String?
    private var invitation: Appointment?

    // TODO: this is a temporary method for displaying screens openeing from the
    // invitation details, should be removed
    func set(navigationTitle: String) {
        self.navigationTitle = navigationTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
    }
}

// MARK: - Privates
private extension ChatViewController {
    func setUpNavigationBar() { // TODO
    //        navigationItem.title = R.string.localizable.outgoing()
            navigationItem.title = navigationTitle ?? R.string.localizable.outgoing()
            let pinItem = UIBarButtonItem(
                image: R.image.invıtationItems.pin1(),
                style: .plain,
                target: self,
                action: #selector(pinTapped)
            )
            let pencilItem = UIBarButtonItem(
                image: R.image.invıtationItems.icn_pencil(),
                style: .plain,
                target: self,
                action: #selector(pencilButtonTapped)
            )
            navigationItem.rightBarButtonItems = [pencilItem, pinItem]
        }
}

@objc extension ChatViewController {
    
    @objc func pinTapped() {
        guard let invitation = invitation else { return }
        router?.route(to: .addDate(invitation: invitation))
    }
    
    @objc func pencilButtonTapped() {}
}

// MARK: - Protocol methods
extension ChatViewController: ChatViewControllerProtocol {
    func set(router: ChatRouterProtocol) {
        self.router = router
    }
    
    func set(invitation: Appointment) {
        self.invitation = invitation
    }

}

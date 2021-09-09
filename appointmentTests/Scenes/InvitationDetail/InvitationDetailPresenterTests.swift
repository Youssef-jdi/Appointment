//
//  InvitationDetailPresenterTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 27/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky

class InvitationDetailPresenterTests: XCTestCase {

    // MARK: Mocks
    private let mockViewController = InvitationDetailViewControllerProtocolMock()
    private let mockDateFormatter = DateFormatterProtocolMock()
    
}


// MARK: - Privates
private extension InvitationDetailPresenterTests {

    func createPresenter() -> InvitationDetailPresenter {
        let presenter =  InvitationDetailPresenter(dateFormatter: mockDateFormatter)
        presenter.set(viewController: mockViewController)
        return presenter
    }
}

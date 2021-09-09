//
//  InvitationContainerInteractorTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 07/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky

class InvitationContainerInteractorTests: XCTestCase {

    private let mockPresenter = InvitationContainerPresenterProtocolMock()

    func testHandleViewDidLoad() {
        let sut = createInteractor()
        sut.handleViewDidLoad()
        Verify(mockPresenter, .presentInitialView(with: .value(.outGoing)))
    }

    func testHandleChangeState() {
        let sut = createInteractor()
        sut.handleChangeState(state: .inComing)
        Verify(mockPresenter, .presentInitialView(with: .value(.inComing)))
        Verify(mockPresenter, .presentContainerTabView(.value((.inComing))))
    }

    private func createInteractor() -> InvitationContainerInteractor {
        return .init(presenter: mockPresenter)
    }
}

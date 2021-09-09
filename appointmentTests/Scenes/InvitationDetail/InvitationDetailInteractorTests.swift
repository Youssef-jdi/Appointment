//
//  InvitationDetailInteractorTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 27/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky
import Moya

class InvitationDetailInteractorTests: XCTestCase {
    private let mockPresenter = InvitationDetailPresenterProtocolMock()
    private let mockInvitationService = InvitationServiceProtocolMock()
    private let mockAppointmentDataService = AppointmentDataServiceProtocolMock()
    private let mockAppointmentDateApiService = AppointmentDateApiServiceProtocolMock()
    private let mockCurrentUserDataService = CurrentUserDataServiceProtocolMock()
    private let mockErrorHandler = ErrorHandlerProtocolMock()

    //MARK: Tests
    func testCancelInvitationSuccess() {
        let sut = createInteractor()
        Perform(mockInvitationService, .cancelAsCreator(invitationId: .any, .any, perform: { _, completion in
            completion(.success(()))
        }))
        sut.cancelAsCreator(invitation: .mock())
        Verify(mockInvitationService, .cancelAsCreator(invitationId: .any, .any))
        Verify(mockPresenter, .presentCancelInvitationSuccess())
    }

    func testCancelInvitationFailure() {
        let error: MoyaError = .statusCode(.init(statusCode: 400, data: Data()))
        let sut = createInteractor()
        Perform(mockInvitationService, .cancelAsCreator(invitationId: .any, .any, perform: { _, completion in
            completion(.failure(error))
        }))
        sut.cancelAsCreator(invitation: .mock())
        Verify(mockInvitationService, .cancelAsCreator(invitationId: .any, .any))
        Verify(mockPresenter, .presentCancelInvitationFailure(error: .any))
    }
}

private extension InvitationDetailInteractorTests {
    func createInteractor() -> InvitationDetailInteractor {
        return .init(presenter: mockPresenter, invitationService: mockInvitationService,
                     appointmentDataService: mockAppointmentDataService,
                     errorHandler: mockErrorHandler,
                     appointmentDateApiService: mockAppointmentDateApiService,
                     userDataService: mockCurrentUserDataService)
    }
}

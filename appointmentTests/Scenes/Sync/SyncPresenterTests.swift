//
//  SyncPresenterTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 06/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import XCTest
import SwiftyMocky

@testable import appointment
class SyncPresenterTests: XCTestCase {

    // MARK: - Mocks
    private let mockViewController = SyncViewControllerProtocolMock()

    func testHandleError() {
        let sut = createPresenter()
        sut.handle(error: SyncError.generic(SyncServiceError.generic))
        Verify(mockViewController, .display(error: .matching {
            return $0.localizedDescription == "The operation couldn’t be completed. (appointment.SyncServiceError error 6.)"
        }))
    }

    func testSuccessSyncingWithFB() {
        let sut = createPresenter()
        sut.successSyncing(.facebook)
        Verify(mockViewController, .successSyncing(.matching({
            return $0 == .facebook
        })))
    }

    func testSuccessSyncingWithGM() {
         let sut = createPresenter()
         sut.successSyncing(.gmail)
         Verify(mockViewController, .successSyncing(.matching({
             return $0 == .gmail
         })))
     }

    func testSuccessSyncingWithOL() {
         let sut = createPresenter()
         sut.successSyncing(.outlook)
         Verify(mockViewController, .successSyncing(.matching({
             return $0 == .outlook
         })))
     }

    func testSuccessSyncingWithYH() {
         let sut = createPresenter()
         sut.successSyncing(.yahoo)
         Verify(mockViewController, .successSyncing(.matching({
             return $0 == .yahoo
         })))
     }

    func testSuccessSyncingWithContact() {
         let sut = createPresenter()
         sut.successSyncing(.contacts)
         Verify(mockViewController, .successSyncing(.matching({
             return $0 == .contacts
         })))
     }

    private func createPresenter() -> SyncPresenter {
        let presenter = SyncPresenter()
        presenter.set(viewController: mockViewController)
        return presenter
    }
}

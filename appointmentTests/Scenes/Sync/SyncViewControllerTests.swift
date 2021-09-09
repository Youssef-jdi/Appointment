//
//  SyncViewControllerTests.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 06/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

@testable import appointment
import XCTest
import SwiftyMocky
import SnapshotTesting

class SyncViewControllerTests: XCTestCase {

    private let mockRouter = SyncRouterProtocolMock()
//    private let mockInteractor = SyncInteractorProtocolMock()
    private let mockAlertPresenter = AlertPresenterProtocolMock()

    override class func setUp() {
        super.setUp()
        record = SnapshotTestsRecordMode.environmentVariableMappingValue
    }

    func testNormal() {
        let sut = createViewController()
        // the icons look weird on snapshots but look perfect in simulators i.g. 8, XR and SE
        sut.assertSnapshots()
    }

    func testSuccessSyncingFB() {
        let sut = createViewController()
        sut.successSyncing(.facebook)
        Verify(mockAlertPresenter, .presentAlert(title: .value("Success"), description: .value("Successfuly synced \(SyncApp.facebook.localizedDescription)"), actions: .any))
    }

    func testSuccessSyncingGmail() {
        let sut = createViewController()
        sut.successSyncing(.gmail)
        Verify(mockAlertPresenter, .presentAlert(title: .value("Success"), description: .value("Successfuly synced \(SyncApp.gmail.localizedDescription)"), actions: .any))
    }

    func testSuccessSyncingOutLook() {
        let sut = createViewController()
        sut.successSyncing(.outlook)
        Verify(mockAlertPresenter, .presentAlert(title: .value("Success"), description: .value("Successfuly synced \(SyncApp.outlook.localizedDescription)"), actions: .any))
    }

    func testSuccessSyncingYahoo() {
        let sut = createViewController()
        sut.successSyncing(.yahoo)
        Verify(mockAlertPresenter, .presentAlert(title: .value("Success"), description: .value("Successfuly synced \(SyncApp.yahoo.localizedDescription)"), actions: .any))
    }

    func testSuccessSyncingContact() {
        let sut = createViewController()
        sut.successSyncing(.contacts)
        Verify(mockAlertPresenter, .presentAlert(title: .value("Success"), description: .value("Successfuly synced \(SyncApp.contacts.localizedDescription)"), actions: .any))
    }

    func testDisplayError() {
        let sut = createViewController()
        sut.display(error: .generic(SyncServiceError.generic))
        Verify(mockAlertPresenter, .presentAlert(title: .matching({
            return $0 == SyncServiceError.generic.title
        }), description: .matching({
            return $0 == "The operation couldn’t be completed. (appointment.SyncServiceError error 6.)"
        }), actions: .any))
    }

    private func createViewController() ->  SyncViewController {

        let vc = UIStoryboard(name: "Sync", bundle: nil).instantiateViewController(withIdentifier: R.storyboard.sync.syncViewController.identifier) as! SyncViewController

        vc.view.frame = .init(x: 0, y: 0, width: vc.view.frame.width, height: 1100)
        vc.set(router: mockRouter)
//        vc.set(interactor: mockInteractor)
        vc.set(alertPresenter: mockAlertPresenter)
        vc.lifecycle()
        return vc
    }

}

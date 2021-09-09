//
//  SettingsViewControllerTests.swift
//  appointment
//
//  Created by Youssef Jdidi on 6/11/20.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import appointment
import XCTest
import SwiftyMocky
import SnapshotTesting

class SettingsViewControllerTests: XCTestCase {

    // MARK: Mocks
    private let mockRouter = SettingsRouterProtocolMock()
    private let mockInteractor = SettingsInteractorProtocolMock()
    private let mockAlertPresenter = AlertPresenterProtocolMock()
    private let mockDataSource = SettingsDataSource()

    var sut: SettingsViewController!

    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()

        // always use iphone7 (Simulator) -> Snapshots
         record = SnapshotTestsRecordMode.environmentVariableMappingValue
         sut = createViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: Tests
    func testNormal() {
        sut.display(settings: Settings.mock())
        sut.assertSnapshots()
    }

    // Navigation Methods
    //i.e. backButtonTapped; delete this comment
}

// MARK: Privates
private extension  SettingsViewControllerTests {

    func createViewController() ->  SettingsViewController {

        let vc = R.storyboard.settings.settingsViewController()!
        vc.view.frame = .init(x: 0, y: 0, width: vc.view.frame.width, height: 1100)
        vc.set(router: mockRouter)
        vc.set(interactor: mockInteractor)
        vc.lifecycle()
        return vc
    }
}
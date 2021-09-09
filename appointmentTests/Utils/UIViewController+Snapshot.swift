//
//  UIViewController+Snapshot.swift
//  appointmentTests
//
//  Created by Raluca Mesterca on 18/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import SnapshotTesting

extension UIViewController {

    /// Calls `loadViewIfNeeded`, `viewDidLoad`, `viewWillAppear`, `viewDidAppear`.
    func lifecycle() {
        loadViewIfNeeded()
        viewDidLoad()
        viewWillAppear(false)
        viewDidAppear(false)
    }

    // Should be run in simulator; use from iphone 8
    func assertSnapshots(named: String? = nil) {
        let name = named ?? String(describing: type(of: self))

        assertSnapshot(matching: self, as: .image(on: .iPhoneSe), named: "\(name)-SE")
        assertSnapshot(matching: self, as: .image(on: .iPhone8), named: "\(name)-8")
        assertSnapshot(matching: self, as: .image(on: .iPhoneXr), named: "\(name)-XR")
    }
}

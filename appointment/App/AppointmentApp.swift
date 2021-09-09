//
//  AppointmentApp.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

//sourcery: AutoMockable
protocol AppointmentAppProtocol {
    func prepare()
}

class AppointmentApp: AppointmentAppProtocol {

    private let sharedContainer: Container
    private let sharedAssembly: Assembly
    private let rootNavigator: RootNavigatorProtocol

    init(
        sharedAssembly: Assembly,
        sharedContainer: Container
    ) {
        self.sharedAssembly = sharedAssembly
        self.sharedContainer = sharedContainer
        sharedAssembly.assemble(container: self.sharedContainer)
        rootNavigator = sharedContainer ~> RootNavigatorProtocol.self
    }

    convenience init() {
        let sharedAssembly = SharedAssembly()
        self.init(
            sharedAssembly: sharedAssembly,
            sharedContainer: sharedAssembly.sharedContainer)
    }

    func prepare() {
        rootNavigator.setRootViewController()
    }
}

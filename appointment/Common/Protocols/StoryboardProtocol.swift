//
//  StoryboardProtocol.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

//sourcery: AutoMockable
protocol StoryboardId {
    var identifier: String { get }
}

//sourcery: AutoMockable
protocol Storyboard {
    func initial<T: UIViewController>() -> T?
    func viewController<T: UIViewController>(identifier: StoryboardId) -> T?
}

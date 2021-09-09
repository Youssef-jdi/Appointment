//
//  ForgotPasswordStoryboard.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/20/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Swinject
import SwinjectStoryboard
//swiftlint:disable implicit_return
class ForgotPasswordStoryboard: Storyboard {
    
    enum ForgotPasswordStoryboardId: StoryboardId {
        case forgotPassword
        
        var identifier: String {
            switch self {
            case .forgotPassword: return R.storyboard.forgotPassword.forgotPasswordViewController.identifier
            }
        }
    }
    
    private let container: Container
    private let assembly: Assembly
    private let storyboard: SwinjectStoryboard
    
    init(sharedContainer: Container, assembly: Assembly) {
        self.assembly = assembly
        container = Container(parent: sharedContainer)
        assembly.assemble(container: container)
        storyboard = SwinjectStoryboard.create(name: R.storyboard.forgotPassword.name, bundle: nil, container: container)
    }
    
    func initial<T>() -> T? where T: UIViewController {
        return storyboard.instantiateInitialViewController() as? T
    }
    
    func viewController<T>(identifier: StoryboardId) -> T? where T: UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier.identifier) as? T
    }
}

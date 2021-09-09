//
//  SplashScreenViewController.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/20/20.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit
import Lottie

//sourcery: AutoMockable
protocol SplashScreenViewControllerProtocol: class, UIViewControllerRouting {
    func set(router: SplashScreenRouterProtocol)
    func set(interactor: SplashScreenInteractorProtocol)

    func display(isUserLoggedIn: Bool)
}

class SplashScreenViewController: UIViewController, SplashScreenViewControllerProtocol {

    // MARK: DI
    var router: SplashScreenRouterProtocol?
    var interactor: SplashScreenInteractorProtocol?

    func set(router: SplashScreenRouterProtocol) {
        self.router = router
    }

    func set(interactor: SplashScreenInteractorProtocol) {
        self.interactor = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        handleAnimation()
    }

    // MARK: Methods
    func handleAnimation() {
        let animationView = AnimationView(name: "Splash")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        view.addSubview(animationView)
        animationView.play { [weak self] _ in
            self?.interactor?.handleAnimationFinished()
        }
    }

    func display(isUserLoggedIn: Bool) {
        isUserLoggedIn ? router?.route(to: .home) : router?.route(to: .login)
    }
}

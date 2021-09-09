//
//  TimelineWeeklyPresenter.swift
//  appointment
//
//  Created by Raluca Mesterca on 18/03/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

protocol TimelinePresenterProtocol {
    func set(viewController: TimelineViewControllerProtocol?)

    func present(appointments: [Appointment])
    func present(settings: Settings)
}

class TimelinePresenter: TimelinePresenterProtocol {

    // MARK: DI
    weak var viewController: TimelineViewControllerProtocol?

    func set(viewController: TimelineViewControllerProtocol?) {
        self.viewController = viewController
    }
}

// MARK: Methods
extension  TimelinePresenter {

    func present(appointments: [Appointment]) {
        viewController?.display(appointments: appointments)
    }

    func present(settings: Settings) {
        viewController?.display(settings: settings)
    }
}

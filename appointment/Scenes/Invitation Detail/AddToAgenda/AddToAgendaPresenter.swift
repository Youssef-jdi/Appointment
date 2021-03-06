//
//  AddToAgendaPresenter.swift
//  appointment
//
//  Created by Youssef Jdidi on 7/14/20.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

protocol AddToAgendaPresenterProtocol {
    func set(viewController: AddToAgendaViewControllerProtocol?)

    // add the functions that are called from interactor
    func handle(error: Error)
}

class AddToAgendaPresenter: AddToAgendaPresenterProtocol {

    // MARK: DI
    weak var viewController: AddToAgendaViewControllerProtocol?

    func set(viewController: AddToAgendaViewControllerProtocol?) {
        self.viewController = viewController
    }
}

// MARK: Methods
extension  AddToAgendaPresenter {

    func handle(error: Error) {
        viewController?.display(error: error)
    }
}

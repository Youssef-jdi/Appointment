//
//  AddToAgendaInteractor.swift
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

protocol AddToAgendaInteractorProtocol {
    // add the functions that are called from the view controller
}

class AddToAgendaInteractor: AddToAgendaInteractorProtocol {

    // MARK: DI
    var presenter: AddToAgendaPresenterProtocol

    init(presenter: AddToAgendaPresenterProtocol) {
        self.presenter = presenter
    }
}

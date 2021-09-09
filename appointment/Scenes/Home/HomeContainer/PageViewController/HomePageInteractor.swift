//
//  HomePageInteractor.swift
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

protocol HomePageInteractorProtocol {
    func fetchSettings()
}

class HomePageInteractor: HomePageInteractorProtocol {

    // MARK: DI
    var presenter: HomePagePresenterProtocol
    private let settingsDataService: SettingsDataServiceProtocol

    init(
        presenter: HomePagePresenterProtocol,
        settingsDataService: SettingsDataServiceProtocol
    ) {
        self.presenter = presenter
        self.settingsDataService = settingsDataService
    }

    func fetchSettings() {
        settingsDataService.fetch { [weak self] result in
            switch result {
            case .success(let data):
                guard let entity = data as? SettingsEntity else {
                    self?.presenter.present(isMonthAgenda: false)
                    return
                }

                let settings = Settings.map(from: entity)

                guard let isWeekAgenda = settings.timelineDisplay?.wrappedBool else { return assertionFailure() }
                self?.presenter.present(isMonthAgenda: !isWeekAgenda)
            case .failure(let error):
                Console.log(type: .error, "Error fetching settings in HomePageInteractor: \(error.localizedDescription)")
            }
        }
    }
}
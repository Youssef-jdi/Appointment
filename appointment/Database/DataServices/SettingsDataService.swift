//
//  SettingsDataService.swift
//  appointment
//
//  Created by Raluca Mesterca on 02/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

//sourcery: AutoMockable
protocol SettingsDataServiceProtocol {
    /// Deletes all the previously saved settings in database
    /// and saves the provided settings in database
    func sync(settings: Settings, _ completion: @escaping RequestLocalCompletion<SettingsEntity>)

    /// Fetch settings
    func fetch(_ completion: @escaping RequestLocalCompletion<SettingsEntity>)

    /// in case the user is not logged in
    /// reset the previously saved settings
    func reset()
}

class SettingsDataService: SettingsDataServiceProtocol {

    private var coreDataController: CoreDataControllerProtocol

    init(coreDataController: CoreDataControllerProtocol) {
        self.coreDataController = coreDataController
    }

    func sync(settings: Settings, _ completion: @escaping RequestLocalCompletion<SettingsEntity>) {
        let name = SettingsEntity.entityName
        coreDataController.delete(entityName: name, predicate: nil) // delete settings

        let context = coreDataController.backgroundContext

        context.performAndWait {
            let newSettings = SettingsEntity.createSettings(from: settings, for: context)

            coreDataController.saveIfNeeded(context) { result in
                switch result {
                case .success:
                    completion(.success(newSettings))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    func fetch(_ completion: @escaping RequestLocalCompletion<SettingsEntity>) {
        let name = SettingsEntity.entityName
        let context = coreDataController.backgroundContext

        coreDataController.fetch(entityName: name, predicate: nil, context: context) { result in
            switch result {
            case .success(let data):
                guard data.count < 2 else { return }
                completion(.success(data.count == 1 ? data[0] : nil))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func reset() {
        let name = SettingsEntity.entityName
        coreDataController.delete(entityName: name, predicate: nil)
    }
}

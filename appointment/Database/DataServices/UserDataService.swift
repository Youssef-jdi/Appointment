//
//  LocalUserService.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/16/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

//sourcery: AutoMockable
protocol CurrentUserDataServiceProtocol {
    /// Fetches the current user saved locally in the database
    func fetchCurrentUser(_ completion: @escaping RequestLocalCompletion<CurrentUserEntity>)

    /// Locally saves the current user to database
    func save(currentUser: UserProfile, _ completion: @escaping RequestLocalCompletion<CurrentUserEntity>)

    /// Deletes the users saved locally in the database
    func deleteUser()
}

class CurrentUserDataService: CurrentUserDataServiceProtocol {

    private var coreDataController: CoreDataControllerProtocol

    init(coreDataController: CoreDataControllerProtocol) {
        self.coreDataController = coreDataController
    }

    func fetchCurrentUser(_ completion: @escaping RequestLocalCompletion<CurrentUserEntity>) {
        let name = CurrentUserEntity.entityName
        let context = coreDataController.backgroundContext
        coreDataController.fetch(entityName: name, predicate: nil, context: context) { result in
            switch result {
            case .success(let data):
                // there should only be one user saved
                guard data.count < 2 else { return }
                completion(.success(data.count == 1 ? data[0] : nil))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func save(currentUser: UserProfile, _ completion: @escaping RequestLocalCompletion<CurrentUserEntity>) {

        deleteUser()
        let context = coreDataController.backgroundContext

        context.performAndWait {
            let user = CurrentUserEntity.createNewUser(from: currentUser, for: context)

            coreDataController.saveIfNeeded(context) { result in
                switch result {
                case .success:
                    completion(.success(user))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    func deleteUser() {
        let name = CurrentUserEntity.entityName
        coreDataController.delete(entityName: name, predicate: nil)
    }
}

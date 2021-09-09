//
//  Helper+testCoreData.swift
//  appointmentTests
//
//  Created by Tran Gia Huy on 08/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import CoreData

class TestCoreDataHelper {

    static let share = TestCoreDataHelper()

    /* This function create an NSManagedObject subclass which store in RAM (Memory only - https://developer.apple.com/documentation/coredata/nsinmemorystoretype) and we use this for the Entity that we want to mock for testing, the data will be release after test ran, so it won't affect the real Core Data.
     How to use it:
     let user = CurrentUserEntity.init(context: TestCoreDataHelper.share.setUpInMemoryManagedObjectContext())
     user.userId = 2
     user.email = "aa@aa.aa"
     ...
     and just pass the "user" into the tests.
     https://www.andrewcbancroft.com/2015/01/13/unit-testing-model-layer-core-data-swift/
     */
    func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!

        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        try! persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator

        return managedObjectContext
    }
}


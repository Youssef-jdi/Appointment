//
//  CoreDataManager.swift
//  appointment
//
//  Created by Youssef Jdidi on 3/13/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

typealias RequestLocalCompletion<T> = (Result<Storable?, Error>) -> Void
typealias ArrayLocalCompletion<T> = (Result<[Storable?], Error>) -> Void

//sourcery: Automockable
protocol CoreDataControllerProtocol {

    /// Main/view context
    var viewContext: NSManagedObjectContext { get }

    /// Private/Background context
    var backgroundContext: NSManagedObjectContext { get }

    /// Deletes objects in a background context
    /// based on the entity name and the predicate provided
    func delete(entityName: String, predicate: NSPredicate?)

    /// Fetched the database managed object in the provided context
    /// Parameters:
    /// - entityName: the name in the xcdatamodel
    /// - predicate: NSPredicate to narrow the fetched results, if needed
    /// - context: main/view context) for ui related work, private/background for the rest
    func fetch(entityName: String, predicate: NSPredicate?, context: NSManagedObjectContext, _ completion: @escaping ArrayLocalCompletion<[NSManagedObject]>)

    /// Saves changes on the provided context - background or view context -, if there are any
    func saveIfNeeded(_ context: NSManagedObjectContext, _ completion: @escaping (Result<Void, Error>) -> Void)
}

class CoreDataController: CoreDataControllerProtocol {

    // MARK: - Properties
    private var persistentContainer: NSPersistentContainer

    // NOTE: -
    // Core Data is not thread safe
    // -> it can cause weird errors and crashes
    // if different context are not handled properly
    // i.e. view context and background context
    var viewContext: NSManagedObjectContext

    // NOTE: -
    // a Computed Property is evaluated each time it is accessed
    // -> it creates a new instance every time it's accessed
    // Shoul keep in mind that to avoid
    // -> multithread violation - 🎖 All that's left to us is honor!! 🎖
    // That is the actual error core data throws, I kid you not! 😎
    var backgroundContext: NSManagedObjectContext {
        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateContext.name = "Background"
        privateContext.parent = persistentContainer.viewContext
        privateContext.automaticallyMergesChangesFromParent = true
        // in case of context merge conflicts
        // prefers the changes made to the objects in the context
        // instead of the state of the objects from the persistent store
        privateContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump

        return privateContext
    }

    // MARK: - Init
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
        viewContext = persistentContainer.viewContext

        load()
    }

    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { [weak self] _, error in
            guard let self = self else { return assertionFailure() }
            guard error == nil else { return assertionFailure(error!.localizedDescription) }
            // autosave()

            self.viewContext.automaticallyMergesChangesFromParent = true
            // in case of context merge conflicts
            // prefers the changes made to the objects in the context
            // instead of the state of the objects from the persistent store
            self.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
            completion?()
        }
    }
}

// MARK: - Fetch
extension CoreDataController {

    func fetch(
        entityName: String,
        predicate: NSPredicate?,
        context: NSManagedObjectContext,
        _ completion: @escaping ArrayLocalCompletion<[NSManagedObject]>
    ) {
        let request = NSFetchRequest<NSManagedObject>(entityName: entityName)
        if let predicate = predicate {
            request.predicate = predicate
        }

        if context.name == "Background" {
            context.performAndWait {
                do {
                    let response = try context.fetch(request)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
            }
        } else {
            do {
                let response = try context.fetch(request)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
    }
}

// MARK: - Delete
extension CoreDataController {

    func delete(entityName: String, predicate: NSPredicate?) {
        let request = NSFetchRequest<NSManagedObject>(entityName: entityName)
        request.predicate = predicate

        // BackgroundContext is a computed variable and it creates a new instance every time it's accessed
        // Otherwise you get multithread violation (🎖 All that's left to us is honor!! 🎖)
        // That is the actual error core data throws, I kid you not! 😎
        let context = backgroundContext
        
        context.performAndWait {
            do {
                let response = try context.fetch(request)
                response.forEach { context.delete($0) }
                try context.save()
                Console.log(type: .success, "Previously saved objects deleted - entity name: \(entityName) and predicate: \(predicate)")
                try viewContext.save()
            } catch {
                assertionFailure()
            }
        }
    }

    // Note to devs: -
    // Leaving this here, in case we decide to use it in the future
    // For now, it's commented bc I don't fully understand the implications of using this

    // Batch deletes run faster than deleting the Core Data entities yourself in code
    // because they operate in the persistent store itself, at the SQL level.

    // However, the changes enacted on the persistent store
    // are not reflected in the objects that are currently in memory.
    // If you use this, that should be handled somehow
    // Same for the defined deletion rules in the model that are not used anymore

    // i.e. for appointments entity, all the relationship deletion rules are set to cascade
    // which means that if appointments objects are deleted
    // also the objects with relationships to appointment
    // like dates, chatIDs, participants, etc. should be deleted

    // More info:
    // https://developer.apple.com/library/archive/featuredarticles/CoreData_Batch_Guide/BatchDeletes/BatchDeletes.html

//    func batchDelete(_ entityName: String, predicate: NSPredicate) {
//        persistentContainer.performBackgroundTask { [viewContext] privateManagedObjectContext in
//            // Creates new batch delete request with a specific request
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
//            request.predicate = predicate
//            let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
//
//            // Asks to return the objectIDs deleted
//            deleteRequest.resultType = .resultTypeObjectIDs
//
//            do {
//                let result = try privateManagedObjectContext.execute(deleteRequest) as? NSBatchDeleteResult
//
//                // Retrieves the IDs deleted
//                guard let objectIDs = result?.result as? [NSManagedObjectID] else { return assertionFailure() }
//
//                // Updates the main context
//                let changes = [NSDeletedObjectsKey: objectIDs]
//
//                NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [viewContext])
//            } catch {
//                assertionFailure("Failed to execute request: \(error)")
//            }
//        }
//    }
}

// MARK: - Save
extension CoreDataController {

    func saveIfNeeded(
        _ context: NSManagedObjectContext,
        _ completion: @escaping (Result<Void, Error>) -> Void
    ) {

        // Background context
        if context.name == "Background" {
            context.performAndWait {
                do {
                    try context.save()

                    // after the changes on the background context are saved
                    // those changes are merged to view context automatically
                    // since the parent of the background context is set to view context
                    // and the automaticallyMergesChangesFromParent is set to true

                    // but after merging, the view context has unsaved changes
                    // and should also be saved
                    try viewContext.save()
                    completion(.success(()))
                } catch {
                    completion(.failure(error))
                }
            }
        } else {
            // view context
            guard context.hasChanges else { return }

            do {
                try viewContext.save()
                completion(.success(()))
            } catch {
                completion(.failure(error))
            }
        }
    }

    // Leaving this here, in case we decide to use it in the future
    // For now, it's commented bc I don't fully understand
    // the implications of auto-saving context
    // Might lead to merge conflicts between contexts
    // And that case should be handled somehow

    //    /// autosave object state in the main context and background context
    //    /// Parameter:
    //    /// - interval - time interval to perform save; default value is 30s
    //    func autoSave(interval: TimeInterval = 30) {
    //        guard interval > 0 else { return }
    //        saveMainContextIfNeeded()
    //
    //        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
    //            self.autoSave(interval: interval)
    //        }
    //    }
}

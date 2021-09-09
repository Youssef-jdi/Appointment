//
//  EventsDataService.swift
//  appointment
//
//  Created by Raluca Mesterca on 12/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

//sourcery: AutoMockable
protocol EventsDataServiceProtocol {
    /// Deletes all the previously saved events in database
    /// and saves the provided events in database.
    func sync(events: [AppEvent], _ completion: @escaping ArrayLocalCompletion<[EventEntity]>)

    /// Fetch events filtered by provided appointment id. If appointment id is missing, it fetches all events.
    func fetchEvents(appointmentId: Int?, _ completion: @escaping ArrayLocalCompletion<[EventEntity]>)

    /// If the user is not logged in,
    /// resets the previously saved events.
    func resetEvents()
}

class EventsDataService: EventsDataServiceProtocol {

    private var coreDataController: CoreDataControllerProtocol

    init(coreDataController: CoreDataControllerProtocol) {
        self.coreDataController = coreDataController
    }

    func sync(events: [AppEvent], _ completion: @escaping ArrayLocalCompletion<[EventEntity]>) {
        let name = EventEntity.entityName
        coreDataController.delete(entityName: name, predicate: nil) // delete all events
        
        let context = coreDataController.backgroundContext
        var newEvents: [EventEntity] = []

        context.performAndWait {
            events.forEach { event in
                newEvents.append(EventEntity.createNewEvent(from: event, for: context))
            }
        }

        coreDataController.saveIfNeeded(context) { result in
            switch result {
            case .success:
                completion(.success(newEvents))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchEvents(appointmentId: Int?, _ completion: @escaping ArrayLocalCompletion<[EventEntity]>) {
        let name = EventEntity.entityName
        let context = coreDataController.backgroundContext

        var predicate: NSPredicate?

        if let appointmentId = appointmentId {
            predicate = NSPredicate(format: "id == %@", appointmentId as NSNumber)
        }

        coreDataController.fetch(entityName: name, predicate: predicate, context: context) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func resetEvents() {
        let name = EventEntity.entityName
        coreDataController.delete(entityName: name, predicate: nil)
    }
}

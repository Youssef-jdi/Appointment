//
//  AppointmentDateDataService.swift
//  appointment
//
//  Created by Irina Filkovskaya on 12/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import CoreData

//sourcery: AutoMockable
protocol AppointmentDateDataServiceProtocol {

    /// Fetches appointments scheduled for a specified date.
    /// If there is no appointment id provided, it fetches all appointments saved in database.
    func fetchAppointmentDates(for date: Int64?, _ completion: @escaping ArrayLocalCompletion<[AppointmentDateEntity?]>)
    func getProposedDates(appointmentId: Int16, _ completion: @escaping RequestCompletion<[ProposedDateEntity]>)
    func respondToProposedDates(appointmentId: Int16,
                                   proposeDateId: Int16,
                                   status: Int16,
                                   _ completion: @escaping RequestCompletion<[ProposedDateEntity]>)
    
}

class AppointmentDateDataService: AppointmentDateDataServiceProtocol {

    // MARK: - Init
    private var coreDataController: CoreDataControllerProtocol

    init(coreDataController: CoreDataControllerProtocol) {
        self.coreDataController = coreDataController
    }

    // MARK: - Methods
    func fetchAppointmentDates(for date: Int64?, _ completion: @escaping ArrayLocalCompletion<[AppointmentDateEntity?]>) {

        let name = AppointmentDateEntity.entityName
        let context = coreDataController.viewContext
        var predicate: NSPredicate?
        if let date = date {
            predicate = NSPredicate(format: "date == %@", date as NSNumber)
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
    
    #warning("TO DO")
    func getProposedDates(appointmentId: Int16, _ completion: @escaping RequestCompletion<[ProposedDateEntity]>) {
    }
    
    func respondToProposedDates(appointmentId: Int16, proposeDateId: Int16, status: Int16, _ completion: @escaping RequestCompletion<[ProposedDateEntity]>) {
    }
    
}

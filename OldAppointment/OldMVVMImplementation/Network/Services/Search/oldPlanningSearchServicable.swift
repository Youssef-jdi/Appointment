////
////  PlanningSearchServicable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 26.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Result
//
//typealias PlanningSearchResult<T, U: Error> = Result<T, U>
//typealias PlanningSearchCompletion<T, U: Error> = ((PlanningSearchResult<T, U>) -> Void)
//
//enum PlanningSearchError: Error {
//    case unauthorized
//    case underlying(Error)
//}
//
//protocol PlanningSearchServicable {
//    
//    
//    /// fetches appointments by title
//    ///
//    /// - Parameters:
//    ///   - title: title of appointment
//    ///   - result: Planning Search Completion
//    func fetchAppointments(by title: String, result: @escaping PlanningSearchCompletion<AppointmentModel, PlanningSearchError>)
//    
//}

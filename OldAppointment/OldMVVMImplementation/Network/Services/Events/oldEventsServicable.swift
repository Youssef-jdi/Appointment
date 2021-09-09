//
////  EventsServicable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//typealias EventsResult<T, U: Error> = Result<T, U>
//typealias EventsCompletion<T, U: Error> = ((EventsResult<T, U>) -> Void)
//
//
//enum EventsError: Error {
//    case underlying(Error)
//}
//
//protocol EventsServicable {
//    
//    /// Fetches the currently logged in users events
//    ///
//    /// - Parameters:
//    ///   - id: current user id
//    ///   - result: EventsCompletion
//    func fetchEvents(user id: Int, result: @escaping EventsCompletion<EventModel, EventsError>)
//}

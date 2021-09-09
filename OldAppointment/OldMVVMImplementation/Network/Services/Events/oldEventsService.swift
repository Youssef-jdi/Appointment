////
////  EventsService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//class EventsService: MVVMService {
//    typealias AuthTarget = ApiTarget
//    
//    var provider: AuthenticatedProvider<MultiTarget, AuthTarget>!
//}
//
//extension EventsService: EventsServicable {
//    func fetchEvents(user id: Int, result: @escaping EventsCompletion<EventModel, EventsError>) {
//        provider.request(MultiTarget(EventsTarget.fetchEvents)) { response in
//            do {
//                let eventModel: EventModel = try response
//                    .get()
//                    .map(EventModel.self)
//                result(.success(eventModel))
//            } catch {
//                print(error.localizedDescription)
//                result(.failure(EventsError.underlying(error)))
//            }
//        }
//    }
//}

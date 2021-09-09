////
////  PlanningSearchService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 26.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//class PlanningSearchService: MVVMService {
//    var provider: AuthenticatedProvider<MultiTarget, AuthTarget>!
//    
//    typealias AuthTarget = ApiTarget
//}
//
//extension PlanningSearchService: PlanningSearchServicable {
//    
//    func fetchAppointments(by title: String, result: @escaping PlanningSearchCompletion<AppointmentModel, PlanningSearchError>) {
//        provider.request(MultiTarget(PlanningSearchTarget.fetchAppointmentsByName(name: title))) { response in
//            do {
//                let searchResult: AppointmentModel = try response
//                    .get()
//                    .map(AppointmentModel.self)
//                result(.success(searchResult))
//            } catch {
//                print(error.localizedDescription)
//                result(.failure(PlanningSearchError.underlying(error)))
//            }
//        }
//    }
//    
//    
//}

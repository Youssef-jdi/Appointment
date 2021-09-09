////
////  PlanningSearchViewModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 26.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//typealias PlanningSearchPresentationState = PresentationState<PlanningSearchState, PlanningSearchError>
//
//enum PlanningSearchState {
//    case gotResultForSearch
//}
//
//class PlanningSearchViewModel: MVVMViewModel {
//    typealias Service = PlanningSearchService
//    
//    var service = Service()
//    var stateHandler: ((PlanningSearchPresentationState) -> Void)?
//    private(set) var currentState: PlanningSearchPresentationState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//    var invitationModel: AppointmentModel?
//}
//
//extension PlanningSearchViewModel {
//    func searchAppointments(name: String) {
//        service.fetchAppointments(by: name) { result in
//            switch result {
//            case .success(let value):
//                self.invitationModel = value
//                self.currentState = .value(.gotResultForSearch)
//            case .failure(let error):
//                self.currentState = .error(.underlying(error))
//                
//            }
//        }
//    }
//}

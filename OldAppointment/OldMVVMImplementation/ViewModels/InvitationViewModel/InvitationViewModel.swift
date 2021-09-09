////
////  InvitationViewModel.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 06/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//class InvitationViewModel: MVVMViewModel {
//    
//    typealias Service = InvitationService
//    
//    var service = Service()
//    
//    var incomingDataSource: [Datum] = []
//    var outgoingDataSource: [Datum] = []
//}
//
//extension InvitationViewModel {
//    func fetchInvitation() {
//        service.filter(offset: 10, limit: 10) { [weak self] result in
//            switch result {
//            case .success(let value):
//                self?.suddivideViewModel(value)
//            case .failure(let error):
//                switch error {
//                case .invalidCredentials:
//                    print("")
//                case .statusNotAvailable:
//                    print("")
//                case .underlying:
//                    print("")
//                }
//            }
//        }
//    }
//    
//    func suddivideViewModel(_ value: InvitationFilterModel) {
//        value.data.forEach { singleEvent in
//            if singleEvent.status == "PLANNED" {
//                incomingDataSource.append(singleEvent)
//            } else {
//                outgoingDataSource.append(singleEvent)
//            }
//        }
//    }
//    
//    func fetchInvitationDetail(invitation id: Int) {
//        service.fetchDetails(id: id) { result in
//            switch result {
//            case .success(let value):
//                print(value)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//}

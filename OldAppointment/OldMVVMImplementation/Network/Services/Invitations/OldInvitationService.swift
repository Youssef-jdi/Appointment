////
////  InvitationService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//class InvitationService: MVVMService {
//    typealias AuthTarget = ApiTarget
//    
//    var provider: AuthenticatedProvider<MultiTarget, AuthTarget>!
//}
//
//extension InvitationService: InvitationServicable {
//    func fetchDetails(id: Int, result: @escaping InvitationCompletion<InvitationModel, InvitationError>) {
//
//        provider.request(MultiTarget(InvitationTarget.details(id: id))) {  response in
//            do {
//                let userFilterResponse: InvitationModel = try response
//                    .get()
//                    .map(InvitationModel.self)
//                result(.success(userFilterResponse))
//            } catch {
//                print(error.localizedDescription)
//                if let error = error as? MoyaError, case .statusCode(let response) = error, response.statusCode == 401 {
//                    result(.failure(InvitationError.statusNotAvailable))
//                } else {
//                    result(.failure(InvitationError.underlying(error)))
//                }
//            }
//        }
//    }
//    
//    func postRespond(proposedDateId: Int, comment: String?, alternativeDate: Int?, status: String, result: @escaping InvitationCompletion<InvitationRespondModel, InvitationError>) {
//        provider.request(MultiTarget(InvitationTarget.respond(proposedDateId: proposedDateId, comment: comment, alternativeDate: alternativeDate, status: status))) {  response in
//            do {
//                let userRespondResponse: InvitationRespondModel = try response
//                    .get()
//                    .map(InvitationRespondModel.self)
//                result(.success(userRespondResponse))
//            } catch {
//                print(error.localizedDescription)
//                if let error = error as? MoyaError, case .statusCode(let response) = error, response.statusCode == 401 {
//                    result(.failure(InvitationError.statusNotAvailable))
//                } else {
//                    result(.failure(InvitationError.underlying(error)))
//                }
//            }
//        }
//    }
//    
//    func createInvitation(invitation: InvitationModel, result: @escaping InvitationCompletion<InvitationModel, InvitationError>) {
//        provider.request(MultiTarget(InvitationTarget.createInvitation(invitationModel: invitation))) { response in
//                do {
//                    let userFilterResponse: InvitationModel = try response
//                        .get()
//                        .map(InvitationModel.self)
//                    result(.success(userFilterResponse))
//                } catch {
//                    print(error.localizedDescription)
//                    if let error = error as? MoyaError, case .statusCode(let response) = error, response.statusCode == 401 {
//                        result(.failure(InvitationError.statusNotAvailable))
//                    } else {
//                        result(.failure(InvitationError.underlying(error)))
//                    }
//                }
//        }
//    }
//    
//    func filter(offset: Int, limit: Int, result: @escaping InvitationCompletion<InvitationFilterModel, InvitationError>) {
//        provider.request(MultiTarget(InvitationTarget.filter(offset: offset, limit: limit))) { response in
//            do {
//                let userFilterResponse: InvitationFilterModel = try response
//                    .get()
//                    .map(InvitationFilterModel.self)
//                result(.success(userFilterResponse))
//            } catch {
//                print(error.localizedDescription)
//                if let error = error as? MoyaError, case .statusCode(let response) = error, response.statusCode == 401 {
//                    result(.failure(InvitationError.statusNotAvailable))
//                } else {
//                    result(.failure(InvitationError.underlying(error)))
//                }
//            }
//        }
//    }
//}

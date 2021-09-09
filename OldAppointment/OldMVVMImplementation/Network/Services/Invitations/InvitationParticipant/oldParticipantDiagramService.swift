////
////  ParticipantDiagramService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 8.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//class ParticipantDiagramService: MVVMService {
//    typealias AuthTarget = ApiTarget
//    
//    var provider: AuthenticatedProvider<MultiTarget, AuthTarget>!
//}
//
//extension ParticipantDiagramService: ParticipantDiagramServiceable {
//    func invitationParticipant(id: Int, result: @escaping DiagramCompletion<ParticipantDiagramModel, DiagramError>) {
//        provider.request(MultiTarget(DiagramParticipantTarget.fetchParticipant(id: id))) {  response in
//            do {
//                let participantDiagramModel: ParticipantDiagramModel = try response
//                    .get()
//                    .map(ParticipantDiagramModel.self)
//                result(.success(participantDiagramModel))
//            } catch {
//               result(.failure(DiagramError.underlying(error)))
//            }
//        }
//    }
//
//}

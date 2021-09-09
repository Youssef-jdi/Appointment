////
////  ParticipantDiagramViewModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 8.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//typealias DiagramPresentationState = PresentationState<DiagramState, DiagramError>
//
//enum DiagramState {
//    case fetchedParticipants
//}
//class ParticipantDiagramViewModel: MVVMViewModel {
//    typealias Service = ParticipantDiagramService
//    var service = Service()
//    
//    var stateHandler: ((DiagramPresentationState) -> Void)?
//    private(set) var currentState: DiagramPresentationState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//    
//    private var participantDiagramModel: ParticipantDiagramModel?
//    var participants: [ParticipantDiagram]? {
//        guard let participants = participantDiagramModel?.data else { return nil }
//        return participants.filter{ !$0.isOwner }
//    }
//    
//    var ownerPerson: ParticipantDiagram? {
//        guard let participants = participantDiagramModel?.data else { return nil }
//        return participants.first(where: { $0.isOwner } )
//    }
//}
//
//extension ParticipantDiagramViewModel {
//    func fetchParticipants(invitation id: Int) {
//        service.invitationParticipant(id: id) { result in
//            switch result {
//            case .success(let participants):
//                self.participantDiagramModel = participants
//                self.currentState = .value(DiagramState.fetchedParticipants)
//            case .failure(let error):
//                self.currentState = .error(DiagramError.underlying(error))
//            }
//        }
//    }
//}

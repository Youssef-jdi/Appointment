////
////  ParticipantDiagramServicable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 8.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Result
//
//typealias DiagramResult<T, U: Error> = Result<T, U>
//typealias DiagramCompletion<T, U: Error> = ((DiagramResult<T, U>) -> Void)
//
//enum DiagramError: Error {
//    case underlying(Error)
//}
//
//protocol ParticipantDiagramServiceable {
//    
//    /// Fethces Invitation Participants
//    ///
//    /// - Parameters:
//    ///   - id: invitation Id
//    ///   - result: InvitationCompletion
//    func invitationParticipant(id: Int, result: @escaping DiagramCompletion<ParticipantDiagramModel, DiagramError>)
//}

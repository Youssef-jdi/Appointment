////
////  InvitationServicable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//import Foundation
//import Result
//
//typealias InvitationResult<T, U: Error> = Result<T, U>
//typealias InvitationCompletion<T, U: Error> = ((InvitationResult<T, U>) -> Void)
//
//enum InvitationError: Error {
//    ///
//    case statusNotAvailable
//    case invalidCredentials
//    case underlying(Error)
//}
//
//protocol InvitationServicable {
//    
//    /// Retrieve the full details of a single invitation
//    ///
//    /// - Parameters:
//    ///   - id: invitation id
//    ///   - result: InvitationCompletion
//    func fetchDetails(id: Int, result: @escaping InvitationCompletion<InvitationModel, InvitationError>)
//
//    /// Respond to the invitation on a specific date
//    ///
//    /// - Parameters:
//    ///   - proposedDateId: The date on which they wish to respond to
//    ///   - comment: optional An optional comment can be made on the date.
//    ///   - alternativeDate: optional and used only when status = cancelled An alternative date is supplied if the user wishes to propose another date.
//    ///   - status: AVAILABLE required
//    ///   - result: InvitationCompletion
//    func postRespond(proposedDateId: Int, comment: String?, alternativeDate: Int?, status: String, result: @escaping InvitationCompletion<InvitationRespondModel, InvitationError>)
//    
//    /// Creates an invitation
//    ///
//    /// - Parameters:
//    ///   - invitation: Invitation that is going to be created
//    ///   - result: Invitation Completion
//    func createInvitation(invitation: InvitationModel, result: @escaping InvitationCompletion<InvitationModel, InvitationError>)
//    
//    /// Returns a list of the current user's filtered invitations.
//    ///
//    /// - Parameters:
//    ///   - offset: offset of the response
//    ///   - limit: limit of the response
//    ///   - result: InvitationCompletion
//    func filter(offset: Int, limit: Int, result: @escaping InvitationCompletion<InvitationFilterModel, InvitationError>)
//    
//}

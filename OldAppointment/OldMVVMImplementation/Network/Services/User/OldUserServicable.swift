////
////  UserServicable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Result
//
//typealias UserResult<T, U: Error> = Result<T, U>
//typealias UserCompletion<T, U: Error> = ((UserResult<T, U>) -> Void)
//typealias UserSuccessResult = Result<Void, CurrentUserError>
//
//enum PasswordError: Error {
//    case missingCredetentials
//    case passwordNotMatching
//    case underlying(Error)
//}
//enum CurrentUserError: Error {
//    case unAuthorized
//    case passwordError(LoginError)
//    case notPartOfInvitation
//    case invalidCredentials
//    case underlying(Error)
//}
//
///// Error types of the user which is going to be logged in
/////
///// - cases:
/////     - invalidEmail: when it's not a correct format of email or its already in use
/////     - invalidPassword: when the password isn't correct
/////     - invalidCredentials: when the credentials isn't correct
/////     - underlying: general error state
//enum LoginUserError: Error {
//    case invalidEmail
//    case invalidPassword
//    case invalidCredentials
//    case underlying(Error)
//}
//
//protocol UserServicable {
//    
//    /// Fetches the currently logged in user.
//    ///
//    /// - Parameter result: user completion containing the currently logged in
//    func fetchCurrent(result: @escaping UserCompletion<UserModel, CurrentUserError>)
//    
//    /// Filter for users. Used when searching to add participants to Appointment
//    ///
//    /// - Parameters:
//    ///   - query: Desired search query for user. Will be matched against the usernames
//    ///   - offset: (Integer, Optional, default 0) acts as the current page, for example, specifying an offset of 20 with a previous limit of 20, will fetch the second page. If no value for offset is provided, it will default to 0 (first page)
//    ///   - limit: (Integer, Optional, default 20) the limit of results that are required
//    ///   - contactsOnly: (Boolean, Optional, default false) if true, the search will only return users that are a synced contact of the user
//    ///   - result: UserFilterModel
//    func filterContacts(query: String, offset: Int?, limit: Int?, contactsOnly: Bool, result: @escaping UserCompletion<UserFilterModel, CurrentUserError>)
//    
//    /// retreives all the responses a user has given for all appointments.
//    ///
//    /// - Parameters:
//    ///   - invitationId: optional, Int If provided, attendances will only be returned for that specific invitation
//    ///   - result: User Completion
//    func fetchAttendances(invitationId: Int?, result: @escaping UserCompletion<AttendancesModel, CurrentUserError>)
//    
//    /// Attempts to log in the user given the provided email and password
//    ///
//    /// - Parameters:
//    ///   - email: email of the user
//    ///   - password: password of the user
//    ///   - result: completion containing the newly authenticated user.
//    func login(email: String, password: String, result: @escaping UserCompletion<Void, LoginUserError>)
//    
//    /// Logs the user out from the current app session
//    ///
//    /// - Parameter result: completion handling
//    func logout(result: @escaping UserCompletion<Void, LoginUserError>)
//    
//    /// Fetches spesific users profile based on id
//    ///
//    /// - Parameters:
//    ///   - id: user id
//    ///   - result: User Completion
//    func fetchUserProfile(user id: Int, result: @escaping UserCompletion<UserProfileResponse, CurrentUserError>)
//    
//    /// Changes User Password
//    ///
//    /// - Parameters:
//    ///   - old: Old Password
//    ///   - new: New Password
//    ///   - result: Success result
//    func changePassword(oldPassword: String?, newPassword: String?, result: @escaping (UserSuccessResult) -> Void)
//}

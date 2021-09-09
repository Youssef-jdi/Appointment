////
////  UserService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//import Moya
//
//class UserService: MVVMService {
//    var provider: AuthenticatedProvider<MultiTarget, AuthTarget>!
//    
//    typealias AuthTarget = ApiTarget
//}
//
//extension UserService: UserServicable {
//    
//    func fetchUserProfile(user id: Int, result: @escaping UserCompletion<UserProfileResponse, CurrentUserError>) {
//        provider.request(MultiTarget(UserTarget.profile)) { response in
//            do {
//                let userProfileResponse: UserProfileResponse = try response
//                    .get()
//                    .map(UserProfileResponse.self)
//                result(.success(userProfileResponse))
//            } catch {
//                print(error.localizedDescription)
//                if let error = error as? MoyaError, case .statusCode(let response) = error, response.statusCode == 401 {
//                    result(.failure(CurrentUserError.unAuthorized))
//                } else {
//                    result(.failure(CurrentUserError.underlying(error)))
//                }
//            }
//        }
//    }
//    
//    func fetchAttendances(invitationId: Int?, result: @escaping UserCompletion<AttendancesModel, CurrentUserError>) {
//        provider.request(MultiTarget(UserTarget.attendances(invitationId: invitationId))) {  response in
//            do {
//                let userFilterResponse: AttendancesModel = try response
//                    .get()
//                    .map(AttendancesModel.self)
//                result(.success(userFilterResponse))
//            } catch {
//                print(error.localizedDescription)
//                if let error = error as? MoyaError, case .statusCode(let response) = error, response.statusCode == 401 {
//                    result(.failure(CurrentUserError.unAuthorized))
//                } else {
//                    result(.failure(CurrentUserError.underlying(error)))
//                }
//            }
//        }
//    }
//    
//    func filterContacts(query: String, offset: Int?, limit: Int?, contactsOnly: Bool, result: @escaping UserCompletion<UserFilterModel, CurrentUserError>) {
//        provider.request(MultiTarget(UserTarget.filter(query: query, offset: offset, limit: limit, contactsOnly: contactsOnly))) {  response in
//            do {
//                let userFilterResponse: UserFilterModel = try response
//                    .get()
//                    .map(UserFilterModel.self)
//                result(.success(userFilterResponse))
//            } catch {
//                print(error.localizedDescription)
//                if let error = error as? MoyaError, case .statusCode(let response) = error, response.statusCode == 401 {
//                    result(.failure(CurrentUserError.unAuthorized))
//                } else {
//                    result(.failure(CurrentUserError.underlying(error)))
//                }
//            }
//        }
//    }
//    
//    /// gets the current user
//    ///
//    /// - Parameter result: complition containing an error or the current user
//    func fetchCurrent(result: @escaping UserCompletion<UserModel, CurrentUserError>) {
//        
//        if !provider.authManager.isUserLoggedIn {
//            result(.failure(CurrentUserError.unAuthorized))
//            return
//        }
//        
//        provider.request(MultiTarget(UserTarget.me)) {  response in
//            do {
//                let userResponse: UserModel = try response
//                    .get()
//                    .map(UserModel.self)
//                result(.success(userResponse))
//            } catch {
//                print(error.localizedDescription)
//                if let error = error as? MoyaError, case .statusCode(let response) = error, response.statusCode == 401 {
//                    result(.failure(CurrentUserError.unAuthorized))
//                } else {
//                    result(.failure(CurrentUserError.underlying(error)))
//                }
//            }
//        }
//    }
//    
//    func login(email: String, password: String, result: @escaping UserCompletion<Void, LoginUserError>) {
//        
//        provider.authManager.logout()
//        provider.authManager.login(email: email, password: password) { response in
//            switch response {
//            case .success:
//                result(.success(()))
//            case .failure(let error):
//                print(error.localizedDescription)
//                result(.failure(LoginUserError.underlying(error)))
//            }
//        }
//    }
//    
//    func logout(result: @escaping UserCompletion<Void, LoginUserError>) {
//    }
//    
//    func changePassword(oldPassword: String?, newPassword: String?, result: @escaping (UserSuccessResult) -> Void) {
//        
//        provider.request(MultiTarget(UserTarget.changePassword(oldPassword: oldPassword!, newPassword: newPassword!))) { response in
//            do {
//                _ = try response
//                    .get()
//                    .filterSuccessfulStatusCodes()
//                result(.success(()))
//            } catch {
//                if let error = error as? MoyaError, error.response?.statusCode == 401 {
//                    result(.failure(CurrentUserError.unAuthorized))
//                    return
//                }
//                result(.failure(CurrentUserError.underlying(error)))
//            }
//        }
//    }
//}

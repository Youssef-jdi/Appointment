////
////  UserViewModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//typealias UserPresentationState = PresentationState<UserState, CurrentUserError>
//
//enum UserState {
//    case normal
//    case fetchedProfile(UserProfileResponse)
//    case changedPassword
//}
//
//class UserViewModel: MVVMViewModel {
//    var service = UserService()
//    
//    typealias Service = UserService
//    
//    var stateHandler: ((UserPresentationState) -> Void)?
//    private(set) var currentState: UserPresentationState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//    private let passwordValidator = PasswordValidator()
//}
//
//extension UserViewModel {
//    
//    func getMe() {
//        service.fetchCurrent { result in
//            switch result {
//            case .success(let user):
//                print("Success !!! Name: \(user.data.givenName)")
//            case .failure(let error):
//                print("Failure !!! : \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func filterContacts(query: String, offset: Int?, limit: Int?, contactsOnly: Bool = false) {
//        service.filterContacts(query: query, offset: offset, limit: limit, contactsOnly: contactsOnly, result: { result in
//            switch result {
//            case .success(let filterContacts):
//                print("Success !!! filtered Response : \(filterContacts)")
//            case .failure(let error):
//                print("Failure !!! : \(error.localizedDescription)")
//            }
//        })
//    }
//    
//    func getAttendances(invitationId: Int?) {
//        service.fetchAttendances(invitationId: invitationId, result: { result in
//            switch result {
//            case .success(let filterContacts):
//                print("Success !!! getAttendances Response : \(filterContacts)")
//            case .failure(let error):
//                print("Failure !!! : \(error.localizedDescription)")
//            }
//        })
//    }
//    
//    func fetchUserProfile(user id: Int) {
//        service.fetchUserProfile(user: id) { result in
//            switch result {
//            case .success(let value):
//                self.currentState = .value(UserState.fetchedProfile(value))
//            case .failure(let error):
//                self.currentState = .error(CurrentUserError.underlying(error))
//            }
//        }
//    }
//    
//    func changePassword(oldPassword: String?, newPassword: String?, reNewPassword: String?) {
//        
//        guard let oldPassword = oldPassword, let newPassword = newPassword, reNewPassword != nil else {
//            currentState = .error(CurrentUserError.passwordError(.emptyFields))
//            return
//        }
//        
//        guard reNewPassword == newPassword else {
//            currentState = .error(CurrentUserError.passwordError(.passwordDontMatch))
//            return
//        }
//        
//        do {
//            try passwordValidator.validate(content: newPassword)
//        } catch let loginError as LoginError {
//            currentState = .error(CurrentUserError.passwordError(loginError))
//            return
//        } catch {
//            currentState = .error(CurrentUserError.underlying(error))
//            return
//        }
//        currentState = .loading
//        service.changePassword(oldPassword: oldPassword, newPassword: newPassword) { result in
//            self.currentState = .idle
//            switch result {
//            case .success:
//                self.currentState = .value(UserState.changedPassword)
//            case .failure(let error):
//                self.currentState = .error(CurrentUserError.underlying(error))
//            }
//        }
//    }
//}

////
////  SyncViewModel.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 26/02/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import ContactsUI
//
//typealias SyncPresentationState = PresentationState<SyncState, SyncError>
//
//enum SyncState {
//    case fetchedGoogle(GoogleContactResponse)
//    case fetchedFacebook(FacebookFriendsResponse)
//    case fetchedOutlook(OutlookContactResponse)
//    case fetchedYahoo(YahooContactResponse)
//    case fetchedDeviceContacts([PhoneContact])
//}
//
//enum SyncError: Error {
//    case underlying(Error)
//    case unableToFetchDeviceContacts(Error)
//    case notAuthenticated(Error)
//}
//
//enum ContactsFilter {
//    case none
//    case mail
//    case message
//}
//
//class SyncViewModel: MVVMSyncViewModel {
//    
//    typealias YahooServiceType = YahooService
//    typealias GoogleServiceType = GoogleService
//    typealias OutlookServiceType = OutlookService
//    typealias FacebookServiceType = FacebookService
//    
//    var googleService = GoogleService()
//    var outlookService = OutlookService()
//    var yahooService = YahooService()
//    var facebookService = FacebookService()
//    var filter: ContactsFilter = .none
//    
//    var stateHandler: ((SyncPresentationState) -> Void)?
//    private(set) var currentState: SyncPresentationState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//}
//
//extension SyncViewModel {
//    func fetchGoogleContacts() {
//        googleService.getContacts(getContactsRequest: .contacts) { result in
//            switch result {
//            case .success(let value):
//                self.currentState = .value(SyncState.fetchedGoogle(value))
//            case .failure(let error):
//                self.currentState = .error(SyncError.underlying(error))
//            }
//        }
//    }
//    
//    func fetchFacebookContacts() {
//        facebookService.getContacts(getContactsRequest: .contacts) { result in
//            switch result {
//            case .success(let value):
//                self.currentState = .value(SyncState.fetchedFacebook(value))
//            case .failure(let error):
//                print(error.localizedDescription)
//                self.currentState = .error(SyncError.underlying(error))
//            }
//        }
//    }
//    
//    func fetchYahooContacts() {
//        yahooService.contacts(getContactsRequest: .contacts) { result in
//            switch result {
//            case .success(let value):
//                self.currentState = .value(SyncState.fetchedYahoo(value))
//            case .failure(let error):
//                self.currentState = .error(SyncError.underlying(error))
//            }
//        }
//    }
//    
//    func fetchOutlookContacts() {
//        outlookService.getContacts(getContactsRequest: .contacts) { result in
//            switch result {
//            case .success(let value):
//                self.currentState = .value(SyncState.fetchedOutlook(value))
//            case .failure(let error):
//                self.currentState = .error(SyncError.underlying(error))
//            }
//        }
//    }
//    
//    func fetchDeviceContacts(filter: ContactsFilter = .none) {
//            let contactStore = CNContactStore()
//            var phoneContacts = [PhoneContact]()
//            let keysToFetch = [
//                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
//                CNContactPhoneNumbersKey,
//                CNContactEmailAddressesKey,
//                CNContactThumbnailImageDataKey
//                ] as [ Any ]
//            guard let keys = keysToFetch as? [CNKeyDescriptor] else { return }
//            let request = CNContactFetchRequest(keysToFetch: keys )
//            do {
//                try contactStore.enumerateContacts(with: request) { contact, _ in
//                    phoneContacts.append(PhoneContact(contact: contact))
//                }
//                self.currentState = .value(SyncState.fetchedDeviceContacts(phoneContacts))
//            } catch {
//                self.currentState = .error(SyncError.unableToFetchDeviceContacts(error))
//            }
//    }
//}

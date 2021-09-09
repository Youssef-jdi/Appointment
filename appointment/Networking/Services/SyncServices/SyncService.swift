//
//  SyncService.swift
//  appointment
//
//  Created by Rachel Polachova on 12/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn
import Contacts
import EventKit

protocol SyncServiceProtocol {
    /// Fetches facebook friends
    /// - Parameter completion: completion handler
    func facebookFriendsRequest(completion: @escaping (Result<Void, SyncServiceError>) -> Void)
    
    /// Fetches calendar and contacts from Google
    /// - Parameters:
    ///   - token: Google Sign In access token
    ///   - completion: completion handler
    func googleRequest(with token: String, requestType: SyncService.SyncRequest, completion: @escaping (Result<Void, SyncServiceError>) -> Void)
    
    /// Fetches calendar and contacts from Outlook
    /// - Parameters:
    ///   - vc: ViewController to present login screen
    ///   - completion: completion handler
    func outlookRequest(from vc: UIViewController, requestType: SyncService.SyncRequest, completion: @escaping (Result<Void, SyncServiceError>) -> Void)
    
    /// Fetches calendar and contacts from device
    /// - Parameter completion: completion handler
    func deviceRequest(completion: @escaping (Result<Void, SyncServiceError>) -> Void)
    
    /// Fetches contacts from Yahoo
    /// - Parameters:
    ///   - vc: ViewController to present login screen
    ///   - completion: completion handler
    func yahooRequest(from vc: UIViewController, completion: @escaping (Result<Void, SyncServiceError>) -> Void)
}

class SyncService: SyncServiceProtocol {
    
    enum SyncRequest {
        case events
        case contacts
    }
    
    private let facebookLoginManager: LoginManager
    private let outlookService: OutlookServiceProtocol
    private let yahooService: YahooServiceProtocol
    private let googleService: GoogleServiceProtocol
    
    private let client: MoyaClient<SyncTarget>
    private let authManager: AuthManagerProtocol
    
    init(
        facebookManager: LoginManager,
        outlookService: OutlookServiceProtocol,
        yahooService: YahooServiceProtocol,
        googleService: GoogleServiceProtocol,
        client: MoyaClient<SyncTarget>,
        authManager: AuthManagerProtocol
    ) {
        self.facebookLoginManager = facebookManager
        self.outlookService = outlookService
        self.yahooService = yahooService
        self.googleService = googleService
        self.client = client
        self.authManager = authManager
    }
    
    func outlookRequest(from vc: UIViewController, requestType: SyncService.SyncRequest, completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        func callRequest() {
            switch requestType {
            case .events:
                getOutlookEvents(completion: completion)
            case .contacts:
                getOutlookContancts(completion: completion)
            }
        }
        
        if outlookService.isLoggedIn {
            callRequest()
        } else {
            outlookService.login(from: vc) { error in
                guard error == nil else {
                    completion(.failure(.outlookError(error!)))
                    return
                }
                callRequest()
            }
        }
    }
    
    func facebookFriendsRequest(completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        
        guard AccessToken.current != nil else {
            facebookLogin(completion: completion)
            return
        }
        
        fetchFacebookFriends(completion: completion)
    }
    
    func googleRequest(with token: String, requestType: SyncService.SyncRequest, completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        switch requestType {
        case .contacts:
            getGoogleContacts(with: token, completion: completion)
        case .events:
            getGoogleEvents(with: token, completion: completion)
        }
    }
    
    func deviceRequest(completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        getDeviceContacts(completion: completion)
        getDeviceCalendar(completion: completion)
    }
    
    func yahooRequest(from vc: UIViewController, completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        yahooService.contacts(from: vc) { [weak self] result in
            switch result {
            case .success(let data):
                do {
                    let yahooResponse = try JSONDecoder().decode(YahooContactsResponse.self, from: data)
                    self?.handleYahooContacts(response: yahooResponse, completion: completion)
                } catch {
                    completion(.failure(.underlying(error)))
                }
            case .failure(let error):
                completion(.failure(.yahooError(error)))
            }
        }
    }
}

// MARK: Private methods
private extension SyncService {
    
// MARK: Upload to server methods
    
    /// Sends save request to server
    /// - Parameters:
    ///   - request: social media contact request
    ///   - completion: completion handler
    func contactsToServer(request: AddSocialMediaReqeust, _ completion: @escaping RequestCompletion<AddSocialMediaResponse>) {
        client.request(.addSocialMedia(request), completion)
    }
    
    /// Handles outlook contacts response and uploads e-mails on server
    /// - Parameters:
    ///   - response: Outlook contacts response
    ///   - completion: completion handler
    func handleOutlookContacts(response: OutlookContactsResponse, completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        response.value.forEach {
            $0.emailAddresses.forEach { email in
                let request = AddSocialMediaReqeust(
                    facebookId: "",
                    outlookId: email.address,
                    googleId: "",
                    yahooId: "",
                    androidId: ""
                )
                contactsToServer(request: request) { result in
                    switch result {
                    case .success(let succ):
                        print("succ: \(String(describing: succ.message))")
                    case .failure(let err):
                        completion(.failure(.underlying(err)))
                    }
                }
            }
        }
    }
    
    /// Handles Gmail contacts and uploads e-mails on server
    /// - Parameters:
    ///   - response: Gmail contacts response
    ///   - completion: completion handler
    func handleGmailContacts(response: GmailContactsResponse, completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        (response.feed.entry ?? []).forEach {
            $0.gdEmail?.forEach { email in
                let request = AddSocialMediaReqeust(facebookId: "", outlookId: "", googleId: email.address, yahooId: "", androidId: "")
                contactsToServer(request: request) { result in
                    switch result {
                    case .success(let resp):
                        print("Succ rsp: \(String(describing: resp.message))")
                    case .failure(let err):
                        completion(.failure(.underlying(err)))
                    }
                }
            }
        }
    }
    
    /// Handles Yahoo contacts respones and uploads e-mails on server
    /// - Parameters:
    ///   - response: Yahoo contacts response
    ///   - completion: completin handler
    func handleYahooContacts(response: YahooContactsResponse, completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        response.contacts.contact.forEach {
            $0.fields.forEach { field in
                switch field.value {
                case .email(let email):
                    let request = AddSocialMediaReqeust(facebookId: "", outlookId: "", googleId: "", yahooId: email, androidId: "")
                    contactsToServer(request: request) { result in
                        switch result {
                        case .success( _):
                            print("successfuly saved")
                        case .failure(let error):
                            completion(.failure(.underlying(error)))
                        }
                    }
                default:
                    break
                }
            }
        }
    }
    
    /// Handles contacts from user's device and uplaods e-mails on server
    /// - Parameters:
    ///   - data: Contacts
    ///   - completion: completion handler
    func handleDeviceContacts(data: [CNContact], completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        data.forEach {
            $0.emailAddresses.forEach { email in
                let emailString = email.value as String
                guard !emailString.isEmpty else { return }
                let request = AddSocialMediaReqeust(facebookId: "", outlookId: "", googleId: "", yahooId: "", androidId: emailString)
                contactsToServer(request: request) { result in
                    switch result {
                    case .success:
                        print("success")
                    case .failure(let error):
                        completion(.failure(.underlying(error)))
                    }
                }
            }
        }
    }
    
    /// Handles facebook friends response and uploads e-mails on server
    /// - Parameters:
    ///   - data: Facebook friends response
    ///   - completion: completion handler
    func handleFacebookContacts(data: FacebookFriendsResponse, completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        completion(.failure(.uploadError))
        #warning("Facebook response doesn't contain friend's emails, yet.")
    }
    
// MARK: Facebook methods
    
    /// Uses facebook login manager to log user in and then calls method to fetch their friends
    /// - Parameter completion: completion handler
    func facebookLogin(completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        facebookLoginManager.logIn(permissions: ["user_friends, email"], from: nil) { [weak self] result, error in
            guard error == nil else {
                completion(.failure(.facebookError(error!)))
                return
            }
            guard let result = result, !result.isCancelled else { return }
            self?.fetchFacebookFriends(completion: completion)
        }
    }
    
    /// Fetches list of friedns from user's facebook
    /// - Parameter completion: completion handler
    func fetchFacebookFriends(completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        let params = ["fields": "id, name, email, picture"]
        let fbRequestFriends = GraphRequest(graphPath: "me/friends", parameters: params)

        fbRequestFriends.start { [weak self] _, result, error in
            if let err = error {
                completion(.failure(.facebookError(err)))
            }
            guard let res = result as? [String: Any] else { return }
            do {
                let data = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                let response = try JSONDecoder().decode(FacebookFriendsResponse.self, from: data)
                self?.handleFacebookContacts(data: response, completion: completion)
            } catch {
                completion(.failure(.underlying(error)))
            }
        }
    }
    
// MARK: Outlook methods
    
    /// Fetches events from user's outlook account
    /// - Parameter completion: completion handler
    func getOutlookEvents(completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        outlookService.getEvents { result in
            switch result {
            case .success:
                // TODO: upload response on our server
                print("Success fetching outlook events!")
                completion(.success(()))
            case .failure(let error):
                completion(.failure(.underlying(error)))
            }
        }
    }
    
    /// Fetches contacts from user's outlook account
    /// - Parameter completion: completion handler
    func getOutlookContancts(completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        outlookService.getContacts { [weak self] result in
            switch result {
            case .success(let data):
                // TODO: upload response on our server
                self?.handleOutlookContacts(response: data, completion: completion)
                completion(.success(()))
            case .failure(let error):
                completion(.failure(.underlying(error)))
            }
        }
    }
    
// MARK: Google methods
    
    /// Fetches user's contacts from google account
    /// - Parameters:
    ///   - token: user's access token (user has to be logged in with google account before!)
    ///   - completion: completion handler
    func getGoogleContacts(with token: String, completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        googleService.getGoogleContacts(with: token) { [weak self] result in
            switch result {
            case .success(let data):
                self?.handleGmailContacts(response: data, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// Fetches user's events from google account
    /// - Parameters:
    ///   - token: user's access token
    ///   - completion: completion handler
    func getGoogleEvents(with token: String, completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        googleService.getGoogleCalendar(with: token) { result in
            switch result {
            case .success(let data):
                break
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
// MARK: Device methods
    
    /// Fetches contacts from user's device
    /// - Parameter completion: completin handler
    func getDeviceContacts(completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            var contacts = [CNContact]()
            let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactEmailAddressesKey]
            let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
            let contactStore = CNContactStore()
            do {
                try contactStore.enumerateContacts(with: request, usingBlock: { contact, _ in
                    contacts.append(contact)
                })
            } catch {
                completion(.failure(.deviceError(error)))
                print("unable to fetch contacts: \(error.localizedDescription)")
            }
            self.handleDeviceContacts(data: contacts, completion: completion)
        }
    }
    
    /// Fetches events from user's calendar
    /// - Parameter completion: completion handler
    func getDeviceCalendar(completion: @escaping (Result<Void, SyncServiceError>) -> Void) {
        let eventStore = EKEventStore()
        // TODO: Handle events
        let calendars = eventStore.calendars(for: .event)
    }
}

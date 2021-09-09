//
//  OutlookService.swift
//  appointment
//
//  Created by Rachel Polachova on 12/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import p2_OAuth2

protocol OutlookServiceProtocol {
    
    var isLoggedIn: Bool { get }
    
    /// Fetches events from Outlook
    /// - Parameter completion: completion handler
    func getEvents(completion: @escaping (Result<OutlookEventsResponse, OutlookServiceError>) -> Void)
    
    /// Fetches contacts from Outlook
    /// - Parameter completion: completion handler
    func getContacts(completion: @escaping (Result<OutlookContactsResponse, OutlookServiceError>) -> Void)
    
    /// Logs user in
    /// - Parameters:
    ///   - from: ViewController to present login screen
    ///   - completion: completion handler
    func login(from: AnyObject, completion: @escaping (OAuth2Error?) -> Void)
}

class OutlookService: OutlookServiceProtocol {
    
    // Configure the OAuth2 framework for Azure
    private static let oauth2Settings = [
        "client_id": "aeddcd13-1241-45c7-b4ce-12af702b66c7",
        "authorize_uri": "https://login.microsoftonline.com/common/oauth2/v2.0/authorize",
        "token_uri": "https://login.microsoftonline.com/common/oauth2/v2.0/token",
        "scope": "openid profile offline_access User.Read Calendars.Read Contacts.Read",
        "redirect_uris": ["appointment://oauth2/callback"],
        "verbose": true
        ] as OAuth2JSON
    
    private static var sharedService: OutlookService = {
        let service = OutlookService()
        return service
    }()
    
    private let oauth2: OAuth2CodeGrant
    
    private init() {
        oauth2 = OAuth2CodeGrant(settings: OutlookService.oauth2Settings)
        oauth2.authConfig.authorizeEmbedded = true
    }
    
    class func shared() -> OutlookService {
        return sharedService
    }
    
    var isLoggedIn: Bool {
        return oauth2.hasUnexpiredAccessToken() || oauth2.refreshToken != nil
    }
    
    func handleOAuthCallback(url: URL) {
        oauth2.handleRedirectURL(url)
    }
    
    func login(from: AnyObject, completion: @escaping (OAuth2Error?) -> Void) {
        oauth2.authorizeEmbedded(from: from) { result, error in
            guard error == nil else {
                completion(error)
                return
            }
            
            if let unwrappedResult = result, let token = unwrappedResult["access_token"] as? String {
                // Print the access token to debug log
                NSLog("Access token: \(token)")
                completion(nil)
            }
        }
    }
    
    func getEvents(completion: @escaping (Result<OutlookEventsResponse, OutlookServiceError>) -> Void) {
        let apiParams = [
            "$select": "subject,start,end",
            "$orderby": "start/dateTime ASC",
            "$top": "10"
        ]
        
        sendRequest(path: "/v1.0/me/events", params: apiParams, completion: { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(OutlookEventsResponse.self, from: data)
                    completion(.success(json))
                } catch {
                    completion(.failure(.generic))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func getContacts(completion: @escaping (Result<OutlookContactsResponse, OutlookServiceError>) -> Void) {
        let apiParams = [
            "$select": "givenName,surname,emailAddresses",
            "$orderby": "givenName ASC",
            "$top": "10"
        ]
        sendRequest(path: "/v1.0/me/contacts", params: apiParams) { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(OutlookContactsResponse.self, from: data)
                    completion(.success(json))
                } catch {
                    completion(.failure(.generic))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func sendRequest(path: String, params: [String: String], completion: @escaping (Result<Data, OutlookServiceError>) -> Void) {
        guard var urlComponents = URLComponents(string: "https://graph.microsoft.com") else { return }
        urlComponents.path = path
        urlComponents.queryItems = []
        for param in params {
            urlComponents.queryItems?.append(.init(name: param.key, value: param.value))
        }
        guard let url = urlComponents.url else { return }
        var request = oauth2.request(forURL: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let loader = OAuth2DataLoader(oauth2: oauth2)
        loader.perform(request: request) { response in
            guard let data = response.data else {
                completion(.failure(.generic))
                return
            }
            completion(.success(data))
        }
    }
    
    func logout() {
        oauth2.forgetTokens()
    }
}

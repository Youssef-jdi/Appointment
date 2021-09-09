//
//  YahooService.swift
//  appointment
//
//  Created by Rachel Polachova on 19/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import p2_OAuth2

protocol YahooServiceProtocol {
    /// Fetches contacts from Yahoo
    /// - Parameters:
    ///   - vc: ViewController which will present login screen
    ///   - completion: completin handler
    func contacts(from vc: AnyObject, completion: @escaping (Result<Data, YahooError>) -> Void)
}

class YahooService: YahooServiceProtocol {
    
    private static let oauth2Settings = [
        "client_id": "dj0yJmk9bjNZZGROeUhVYkhPJmQ9WVdrOWMydFRUR3BwTnpBbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmc3Y9MCZ4PThh",
        "client_secret": "46a792f0cbc1f019ca237a1e579eed7efdd079db",
        "authorize_uri": "https://api.login.yahoo.com/oauth2/request_auth",
        "token_uri": "https://api.login.yahoo.com/oauth2/get_token",
        "redirect_uris": ["appointment://oauth2/callbackyahoo"],
        "response_type": "code"
    ] as OAuth2JSON
    
    private let params = [
        "client_id": "dj0yJmk9bjNZZGROeUhVYkhPJmQ9WVdrOWMydFRUR3BwTnpBbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmc3Y9MCZ4PThh",
        "redirect_uri": "appointment://oauth2/callbackyahoo",
        "response_type": "code"
    ]
    
    private let oauth2: OAuth2CodeGrant = {
        let oauth2 = OAuth2CodeGrant(settings: oauth2Settings)
        oauth2.authConfig.authorizeEmbedded = true
        return oauth2
    }()
    
    static let shared = YahooService()
    
    var isLoggedIn: Bool {
        return oauth2.hasUnexpiredAccessToken() || oauth2.refreshToken != nil
    }
    
    private init() { }

    func handleOAuthCallback(url: URL) {
        oauth2.handleRedirectURL(url)
    }
    
    func contacts(from vc: AnyObject, completion: @escaping (Result<Data, YahooError>) -> Void) {
        guard isLoggedIn else {
            login(from: vc) { [weak self] error in
                if let err = error {
                    completion(.failure(.login(err)))
                } else {
                    self?.fetchContacts(completion: completion)
                }
            }
            return
        }
        
        fetchContacts(completion: completion)
    }
    
    func login(from: AnyObject, completion: @escaping (OAuth2Error?) -> Void) {
        oauth2.authorizeEmbedded(from: from, params: params) { result, error in
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
    
    func logout() {
        oauth2.forgetTokens()
    }
}

// MARK: Private methods
private extension YahooService {
    func fetchContacts(completion: @escaping (Result<Data, YahooError>) -> Void) {
        guard var urlComponents = URLComponents(string: "https://social.yahooapis.com/v1/user/me/contacts") else { return }
        
        urlComponents.queryItems = [URLQueryItem(name: "count", value: "max")]
        
        guard let url = URL(string: "https://social.yahooapis.com/v1/user/me/contacts") else { return }
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
}

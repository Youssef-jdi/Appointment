//
//  AuthManager.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import p2_OAuth2
import Moya
import Result

typealias AuthResult<T> = Result<T, OAuth2Error>
typealias RequestCompletion<T> = (Result<T, MoyaError>) -> Void

//sourcery: AutoMockable
protocol AuthManagerProtocol: class {
    //typealias = "AuthResult<T> = Result<T, OAuth2Error>"

    /// A boolean indicating if a user is logged in or not.
    var isUserLoggedIn: Bool { get }

    /// Try to login with an email and a password.
    ///
    /// - Parameters:
    ///   - email: the email of the user.
    ///   - password: the password that goes with the email.
    /// - Returns: Single<Void>
    func login(email: String, password: String, completion: @escaping ((AuthResult<LoginResponse>) -> Void))

    /// Sign a request with the credentials of the current user.
    ///
    /// - Parameter request: The request to sign.
    /// - Returns: Single<URLRequest>
    func sign(_ request: URLRequest, result: @escaping ((Result<URLRequest, MoyaError>) -> Void))

    /// Logout the curret user.
    ///
    /// - Returns: Single<Void>
    func logout()
}

class AuthManager: AuthManagerProtocol {
    
    // MARK: - Properties
    weak var provider: MoyaProvider<MultiTarget>!
    
    var isUserLoggedIn: Bool {
        guard let passwordAuth = passwordAuth else { return false }
        return passwordAuth.hasUnexpiredAccessToken() || passwordAuth.refreshToken != nil
    }

    var pushToken: String?

    private let loginEndpoint: URL
    private let clientId: String
    private let isMocking: Bool

    public private(set) var passwordAuth: OAuth2PasswordGrant?
    private let anonAuth: OAuth2ClientCredentials
    public private(set) var linkedinAuth: OAuth2ClientCredentials?
//    private var profileService: ProfileServiceProtocol?
    
    var passwordParams: OAuth2JSON {
        return [
            "grant_type": "password",
            "client_secret": "secret",
            "client_id": clientId,
            "token_uri": loginEndpoint.absoluteString,
            "secret_in_body": true,
            "keychain": true
        ]
    }
    
    // MARK: - Inits & deinit
    init (loginEndpoint: URL, isMocking: Bool = false) {

        self.clientId = "ro.security"
        self.loginEndpoint = loginEndpoint
        self.isMocking = isMocking

        self.passwordAuth = OAuth2PasswordGrant(settings: [
            "grant_type": "password",
            "client_secret": "secret",
            "client_id": self.clientId,
            "token_uri": loginEndpoint.absoluteString,
            "secret_in_body": true,
            "keychain": true
            ])

        self.anonAuth = OAuth2ClientCredentials(settings: [
            "client_id": self.clientId,
            "grant_type": "password",
            "client_secret": "secret",
            "token_uri": loginEndpoint.absoluteString,
            "secret_in_body": true,
            "keychain": true
            ])

        self.passwordAuth?.logger = OAuth2DebugLogger(.trace)
        self.anonAuth.logger = OAuth2DebugLogger(.trace)
//        profileService = ProfileService(client: MoyaClient<ProfileTarget>(authManager: self), authManager: self)
    }

    // MARK: - Method
    func login(email: String, password: String, completion: @escaping ((AuthResult<LoginResponse>) -> Void)) {
        self.logout()
        let settings = passwordParams.merging([
            "grant_type": "password",
            "client_id": "appointment_api",
            "client_secret": "secret",
            "password": password,
            "user_type": 1,
            "username": email
            ], uniquingKeysWith: { _, second in second })

        self.passwordAuth = OAuth2PasswordGrant(settings: settings)

        let params: OAuth2StringDict =  ["email": email]
        authorize(params: params, completion: completion)
    }

    func sign(_ request: URLRequest, result: @escaping ((Result<URLRequest, MoyaError>) -> Void)) {

        func signWithClient() {
            do {
                let clientSignedRequest = try request.signed(with: self.anonAuth)
                result(.success(clientSignedRequest))
            } catch {
                if let error = error as? MoyaError {
                    result(.failure(error))
                } else {
                    /// Hack to mostly handle the register call (when you don't have an access token yet)
                    result(.success(request))
                }
            }
        }

        print("ATTEMPTING TO SIGN \(String(describing: request.url)) ")
        guard let passwordAuth = passwordAuth else {
            signWithClient()
            return
        }

        func attemptToSign() {
            do {
                let passwordSignedRequest = try request.signed(with: passwordAuth)
                result(.success(passwordSignedRequest))
            } catch {
                signWithClient()
            }
            return
        }

        if passwordAuth.hasUnexpiredAccessToken() {
            attemptToSign()
            return
        }

        if !passwordAuth.isAuthorizing {
            authorize { authResult in
                switch authResult {
                case .success:
                    attemptToSign()
                case .failure:
                    print("💩 Returning unsigned request 💩")
                    result(.success(request))
                    //result(.failure(.underlying(error, nil)))
                }
            }
        } else {
            attemptToSign()
        }
    }

    func logout() {
        UserDefaults.standard.set(nil, forKey: "SavedProfile")
        UserDefaults.standard.set(nil, forKey: "UserType")
        passwordAuth?.forgetTokens()
        anonAuth.forgetTokens()
        passwordAuth?.accessToken = nil
        passwordAuth?.refreshToken = nil
        passwordAuth = nil
    }
}

// MARK: - Privates
extension AuthManager {

    func authorize(params: OAuth2StringDict? = nil, completion: @escaping ((AuthResult<LoginResponse>) -> Void)) {
         if passwordAuth == nil {
            self.passwordAuth = OAuth2PasswordGrant(settings: passwordParams)
        }

        self.passwordAuth?.authorize(params: params) { [weak self] (json, error: OAuth2Error?) in
            guard let self = self else { return }
            guard error == nil,
                let result = json else {
                self.handleAuthorizeError(result: json, error: error, completion: completion)
                return
            }
            
            let loginResponse = LoginResponse(
                accessToken: result["access_token"] as! String,
                refreshToken: result["refresh_token"] as! String,
                expiresIn: result["expires_in"] as! Int,
                tokenType: result["token_type"] as! String
            )
            self.passwordAuth?.accessToken = loginResponse.accessToken
            self.passwordAuth?.refreshToken = loginResponse.refreshToken
            self.anonAuth.accessTokenExpiry = Date(timeInterval: TimeInterval(loginResponse.expiresIn), since: Date())
//            self.saveUser()
            completion(.success(loginResponse))
        }
    }
    
    func handleAuthorizeError(result: OAuth2JSON?, error: OAuth2Error?, completion: @escaping ((AuthResult<LoginResponse>) -> Void)) {
        print("🚨 \(error.debugDescription)")
        self.logout()
        self.anonAuth.authorize { _, error in
            if let error = error {
                completion(.failure(error))
            } else {
                let loginResponse = LoginResponse(
                    accessToken: result!["access_token"] as! String,
                    refreshToken: result!["refresh_token"] as! String,
                    expiresIn: result!["expires_in"] as! Int,
                    tokenType: result!["token_type"] as! String
                )
                self.passwordAuth?.accessToken = loginResponse.accessToken
                self.passwordAuth?.refreshToken = loginResponse.refreshToken
                self.anonAuth.accessTokenExpiry = Date(timeInterval: TimeInterval(loginResponse.expiresIn), since: Date())

                completion(.success(loginResponse))
            }
        }
    }
    
//    #warning("this is temporary must be moved to home screen")
//    func saveUser() {
//        profileService?.getProfile { result in
//            switch result {
//            case .success(let response): UserDefaults.standard.set(response.profileResult.id, forKey: "UserId")
//            case .failure(let error): debugPrint("error profile ", error.localizedDescription)
//            }
//        }
//    }
}

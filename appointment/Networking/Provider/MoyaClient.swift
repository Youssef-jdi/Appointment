//
//  MoyaProvider.swift
//  Keypath
//
//  Created by Mohamed Taha Douiri on 27/08/2019.
//  Copyright © 2019 Mohamed Taha Douiri. All rights reserved.
//

import Moya
import Result

// AutoMockable
protocol MoyaClientProtocol: class {
    //associatedType = "Target: TargetType"
    //typealias = "RequestCompletion<T> = (Result<T, MoyaError>) -> Void"
    associatedtype Target: TargetType

    func request<T: Codable>(_ target: Target, _ completion: @escaping RequestCompletion<T>)
}

class MoyaClient<Target: TargetType>: MoyaClientProtocol {
    private let provider: MoyaProvider<Target>
    private let authManager: AuthManagerProtocol
    private var applicationJSONDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }

    init(authManager: AuthManagerProtocol) {
        self.authManager = authManager
        
        let requestClosure = { (endpoint: Endpoint, done: @escaping (Result<URLRequest, MoyaError>) -> Void) in
            do {
                let request = try endpoint.urlRequest()
                authManager.sign(request, result: done)
            } catch {
                done(.failure(.underlying(error, nil)))
            }
        }

        let plugins: [PluginType] = [
            NetworkLoggerPlugin(),
            NetworkActivityPlugin(
                networkActivityClosure: { change, _ in
                    DispatchQueue.main.async {
                        switch change {
                        case .began:
                            UIApplication.shared.isNetworkActivityIndicatorVisible = true
                        case .ended:
                            UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        }
                    }
            })
        ]

        provider = MoyaProvider<Target>(requestClosure: requestClosure, plugins: plugins)
    }

    // TO DO: refactor to use only one function for requests

    /// Used for the few API responses that don't have the structure status: ..., message: ..., result: ...
    func requestWithoutStatus<T: Codable>(_ target: Target, _ completion: @escaping RequestCompletion<T> ) {
        provider.request(target) { response in
            print(response.debugDescription)
            switch response {
            case .success(let value):
                completion(Result(catching: { try value.filterSuccessfulStatusCodes().map(T.self) }))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }

    /// Used for (most) API responses with the structure status: ..., message: ..., result: ...
    func request<T: Codable>(_ target: Target, _ completion: @escaping RequestCompletion<T> ) {
        print("🤖🤖🤖", target.task)
        provider.request(target) { response in
            print("🤖🤖🤖 response", response)
            switch response {
            case .success(let value):
                do {
                    let filteredResponse = try value.filterSuccessfulStatusCodes()
                    let json = try filteredResponse.map(T.self, atKeyPath: "result", using: .init(), failsOnEmptyData: false)
                    completion(Result(json))
                } catch {
                    print(error)
                }
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }

    func requestWithNoResponse(_ target: Target, _ completion: @escaping RequestCompletion<Void> ) {
        provider.request(target) { response in
            print(response.debugDescription)
            switch response {
            case .success(let value):
                do {
                    let filteredResponse = try value.filterSuccessfulStatusCodes()
                    completion(Result(catching: { filteredResponse }))
                } catch {
                    print(error)
                }
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }

    /// Used for (most) API responses with the structure
    ///  status: ..., message: ..., result: ...
    /// where result is an array
    func requestArray<T: Codable>(_ target: Target, _ completion: @escaping RequestCompletion<T> ) {
        provider.request(target) { result in
            switch result {
            case .success(let value):
                do {
                    let filteredResponse = try value.filterSuccessfulStatusCodes()
                    let json = try filteredResponse.mapJSON() as? [String: Any]
                    completion(Result(catching: { try self.decodeArray(json: json ?? [:]) }))
                } catch {
                    print(error)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func decode<V: Codable>(json: [String: Any]) throws -> V {
        guard let message = json["message"] as? String else {
            throw MoyaError.requestMapping("Json failed") // need to localized
        }
        guard message == "OK", let result = json["result"] as? [String: Any] else {
            throw MoyaError.requestMapping("Json failed")
        }
        let data = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
        return try applicationJSONDecoder.decode(V.self, from: data)
    }

    private func decodeArray<V: Codable>(json: [String: Any]) throws -> V {
        guard let message = json["message"] as? String else {
            throw MoyaError.requestMapping("Json failed") // need to localized
        }
        guard message == "OK", let result = json["result"] as? [[String: Any]] else {
            throw MoyaError.requestMapping("Json failed")
        }
        let data = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
        return try applicationJSONDecoder.decode(V.self, from: data)
    }
}

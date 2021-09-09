//
//  ForgotPasswordTarget.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/20/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Moya

//swiftlint:disable implicit_return
enum ForgotPasswordTarget: TargetType {
    
    case forgetPassword(email: String)
    
    var baseURL: URL {
        return BaseURL.apiURL
    }
    
    var path: String {
        return "/user/reset-password"
    }
    
    var method: Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var task: Task {
        switch self {
        case .forgetPassword(let email):
            return .requestParameters(
                parameters: ["email": email],
                encoding: URLEncoding.default)
        }
    }
}

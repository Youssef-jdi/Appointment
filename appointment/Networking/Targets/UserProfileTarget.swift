//
//  ProfileResponse.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/26/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Moya

//swiftlint:disable implicit_return
enum UserProfileTarget: TargetType {
    case getProfile
    
    var baseURL: URL {
        return BaseURL.apiURL
    }
    
    var path: String {
        return "/user/get-profile"
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var method: Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
}

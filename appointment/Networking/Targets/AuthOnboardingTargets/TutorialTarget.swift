//
//  TutorialTarget.swift
//  appointment
//
//  Created by Rachel Polachova on 24/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import Moya

// swiftlint:disable implicit_return
enum TutorialTarget: TargetType {
    
    case getTutorials
    
    var baseURL: URL {
        return BaseURL.apiURL
    }
    
    var path: String {
        switch self {
        case .getTutorials:
            return "tutorial/show-tutorial"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTutorials:
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getTutorials:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .getTutorials:
            return .requestParameters(parameters: ["language": 1], encoding: URLEncoding.httpBody) //x-www-form-urlencoded
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}

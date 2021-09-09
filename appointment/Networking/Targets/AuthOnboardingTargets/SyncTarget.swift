//
//  SyncTarget.swift
//  appointment
//
//  Created by Rachel Polachova on 20/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Moya

enum SyncTarget: TargetType {
    
    case addSocialMedia(AddSocialMediaReqeust)
    case failedSocialMedia(AddSocialMediaReqeust)
    case emailAdress
    
    var baseURL: URL {
        return BaseURL.apiURL
    }
    
    var path: String {
        switch self {
        case .addSocialMedia:
            return "user/add-social-media"
        case .failedSocialMedia:
            return "user/add-failed-social-media"
        case .emailAdress:
            return "user/sync-contact"
        }
    }
    
    var method: Method {
        switch self {
        case .addSocialMedia, .failedSocialMedia, .emailAdress:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .addSocialMedia(let request):
            let params = try? request.asDictionary()
            return .requestParameters(parameters: params ?? [:], encoding: URLEncoding())
        case .failedSocialMedia(let request):
            let params = try? request.asDictionary()
            return .requestParameters(parameters: params ?? [:], encoding: URLEncoding())
        case .emailAdress:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}

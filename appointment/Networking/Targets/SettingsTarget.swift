//
//  SettingsTarget.swift
//  appointment
//
//  Created by Raluca Mesterca on 02/06/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Moya

//swiftlint:disable implicit_return
enum SettingsTarget: TargetType {
    case getSettings
    case updateSettings(settings: Settings)

    var baseURL: URL {
        return BaseURL.apiURL
    }

    var path: String {
        switch self {
        case .getSettings:
              return "/settings/get"
        case .updateSettings:
            return "/settings/update"
        }
    }

    var headers: [String: String]? {
        return nil
    }

    var method: Method {
        switch self {
        case .getSettings:
            return .get
        case .updateSettings:
            return .post
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getSettings:
            return .requestPlain
        case .updateSettings(let settings):
            let params = try? settings.asDictionary()
            return .requestParameters(parameters: params ?? [:], encoding: URLEncoding())
        }
    }
}

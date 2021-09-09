//
//  EventsTarget.swift
//  appointment
//
//  Created by Raluca Mesterca on 01/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Moya

enum EventsTarget: TargetType {
    case getEvents

    var baseURL: URL {
        return BaseURL.apiURL
    }

    var path: String {
        return "/appointment/get-events"
    }

    var headers: [String: String]? {
        return nil
    }

    var method: Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        return .requestPlain
    }
}

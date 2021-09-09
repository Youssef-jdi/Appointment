//
//  InvitationTarget.swift
//  appointment
//
//  Created by Youssef Jdidi on 2/25/20.
//  Copyright © 2020 DTT. All rights reserved.
//

import Moya

enum AppointmentTarget: TargetType {
    case getAppointments
    case cancelAppointment(id: Int)
    case rejectInvitation(id: Int)
    case setCalendarStatus(Int, Int)
    
    var baseURL: URL {
        return BaseURL.apiURL
    }
    
    var path: String {
        switch self {
        case .getAppointments:
            return "/appointment/get"
        case .cancelAppointment:
            return "/appointment/cancel"
        case .rejectInvitation:
            return "/appointment/reject"
        case .setCalendarStatus:
            return "/appointment/add-appointment-to-calendar"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var method: Method {
        switch self {
        case .getAppointments: return .get
        case .cancelAppointment, .rejectInvitation, .setCalendarStatus: return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getAppointments:
            return .requestPlain
        case .cancelAppointment(let id):
            return .requestParameters(
                parameters: ["appointment_id": id],
                encoding: URLEncoding.default
            )
        case .rejectInvitation(let id):
            return .requestParameters(
                parameters: ["appointment_id": id],
                encoding: URLEncoding.default
            )
        case .setCalendarStatus(let id, let status):
            return .requestParameters(
                parameters: [
                    "appointment_id": id,
                    "user_response": status
                ],
                encoding: URLEncoding.default
            )
        }
    }
}

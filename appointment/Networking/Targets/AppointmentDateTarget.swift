//
//  AppointmentDateTarget.swift
//  appointment
//
//  Created by Tran Gia Huy on 25/05/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Moya

enum AppointmentDateTarget: TargetType {
    case selectFinalDay(appointmentId: Int, appointmentDateId: Int)
    case addSuggested(date: AddDate)
    case getProposedDates(appointmentId: Int)
    case respondToProposedDates(appointmentId: Int,
        proposeDateId: Int,
        status: Int)
    case getDates(for: Int)
    case setAvailability(appointmentId: Int,
        appointmentDateId: Int,
        comment: String,
        availability: String)
    
    var baseURL: URL {
        return BaseURL.apiURL
    }
    
    var path: String {
        switch self {
        case .selectFinalDay:
            return "/appointment/final-date/"
        case .addSuggested:
            return "appointment/add-suggested-date"
        case .getProposedDates:
            return "/appointment/get-proposed-dates"
        case .respondToProposedDates:
            return "/appointment/respond-to-proposed-date"
        case .getDates:
            return "appointment/get-appointment-dates"
        case .setAvailability:
            return "/appointment/set-availability-for-date"
        }
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
        switch self {
        case .selectFinalDay(let appointmentId, let appointmentDateId):
            return .requestParameters(
                parameters: [
                    "appointment_date_id": appointmentDateId,
                    "appointment_id": appointmentId
                ],
                encoding: URLEncoding.default
            )
            
        case .addSuggested(let date):
            /**
             # Add Suggested Date
             
             This API call is a bit tricky since the API expects 2 different types of parameters (Should not be the case).
             
             ## Parameters
             1.First parameter is **"appointment_id"**, with an *Int* value.
             
             2.Second parameter is **"suggested_dates"**, with a *JSON string* as value.
             
             The backend expect a url encoded request, so using a JSON encoder for the request is not an option unfortunatly as the backend would reject it.
             
             I had to "manually" mix these two to be able to send a correct request.
             
             The outer structure of the request (appointment_id and suggested_dates) will be a default URL encoded request parameters, the inner structure (suggested_date downwards) will be a JSON string.
             */
            let jsonEncoder = JSONEncoder()
            let jsonData = try? jsonEncoder.encode(date.suggestedDates)
            if let json = String(data: jsonData ?? Data(), encoding: String.Encoding.utf8) {
                return .requestParameters(
                    parameters: [
                        "appointment_id": date.appointmentId,
                        "suggested_dates": json
                    ],
                    encoding: URLEncoding.httpBody)
            } else {
                return .requestPlain
            }
        case .getProposedDates(appointmentId: let appointmentId):
            return .requestParameters(
                parameters: [
                    "appointment_id": appointmentId
                ],
                encoding: URLEncoding.default
            )
        case .respondToProposedDates(appointmentId: let appointmentId,
                                     proposeDateId: let proposeDateId,
                                     status: let status):
            return .requestParameters(
                parameters: [
                    "appointment_id": appointmentId,
                    "proposed_date_id": proposeDateId,
                    "status": status
                ],
                encoding: URLEncoding.default
            )
        case .getDates(let id):
            return .requestParameters(
                parameters: ["appointment_id": id],
                encoding: URLEncoding.default)
        case .setAvailability(appointmentId: let appointmentId,
                              appointmentDateId: let appointmentDateId,
                              comment: let comment,
                              availability: let availability):
            return .requestParameters(
                parameters: [
                    "appointment_id": appointmentId,
                    "appointment_date_id": appointmentDateId,
                    "comment": comment,
                    "availability": availability
                ],
                encoding: URLEncoding.default
            )
        }
    }
}

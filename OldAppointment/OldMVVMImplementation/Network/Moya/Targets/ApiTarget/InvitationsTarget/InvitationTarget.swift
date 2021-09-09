////
////  InvitationTarget.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//enum InvitationTarget {
//    case details(id:Int)
//    /// Source: [Mock Other Response Type](https://github.com/Moya/Moya/blob/master/docs/Testing.md)
//    case respond(proposedDateId:Int, comment:String?, alternativeDate:Int?, status:String)
//    /// Source: [Mock Other Response Type](https://github.com/Moya/Moya/blob/master/docs/Testing.md)
//    case createInvitation(invitationModel: InvitationModel)
//    case filter(offset:Int, limit:Int)
//}
//
//extension InvitationTarget: TargetType, AccessTokenAuthorizable {
//
//    // MARK: - Properties
//    var baseURL: URL {
//        return URL(string: "https://appointment.dev2.d-tt.nl/api/v1/invitations")!
//    }
//    
//    var path: String {
//        switch self {
//        case .details(let id):
//            return "/\(id)"
//        case .respond(let id):
//            return "/\(id)/respond"
//        case .filter:
//            return "/filter"
//        case .createInvitation:
//            return ""
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .filter, .details:
//            return .get
//        case .respond, .createInvitation:
//            return .post
//        }
//    }
//    
//    var sampleData: Data {
//        switch self {
//        case .filter:
//            return stubbedResponse("InvitationFilterResponse")
//        case .details:
//            return stubbedResponse("InvitationsDetailsResponse")
//        case .respond:
//            return stubbedResponse("InvitationsRespondResponse")
//        case .createInvitation:
//            return Data()
//        }
//    }
//    
//    var task: Task {
//        switch self {
//        case .details:
//            return .requestPlain
//        case .filter(let offset, let limit):
//            var params: [String: Any] = [:]
//            params["offset"] = offset
//            params["limit"] = limit
//            return .requestParameters(parameters: params, encoding: URLEncoding.default)
//        case .createInvitation(let invitationModel):
//            var params: [String: Any] = [:]
//            params["location"] = invitationModel.location
//            params["title"] = invitationModel.title
//            params["description"] = invitationModel.description
//            params["allowAvailability"] = invitationModel.allowAvailability
//            params["allowDateProposals"] = invitationModel.allowDateProposals
//            params["participantUserIds"] = invitationModel.participantUserIDS
//            params["startDate"] = invitationModel.startDate
//            params["endDate"] = invitationModel.endDate
//            return .requestParameters(parameters: params, encoding: URLEncoding.default)
//        case .respond(let proposedDateId, let comment, let alternativeDate, let status):
//            var params: [String: Any] = [:]
//            params["proposedDateId"] = proposedDateId
//            params["comment"] = comment
//            params["alternativeDate"] = alternativeDate
//            params["status"] = status
//            return .requestParameters(parameters: params, encoding: URLEncoding.default)
//        }
//    }
//    
//    var authorizationType: AuthorizationType {
//        return .bearer
//    }
//    
//    var headers: [String: String]? {
//        switch self {
//        case .respond:
//            return ["Content-Type": "application/x-www-form-urlencoded"]
//        case .createInvitation:
//            return ["Content-Type": "application/json"]
//        default:
//            return nil
//        }
//    }
//}

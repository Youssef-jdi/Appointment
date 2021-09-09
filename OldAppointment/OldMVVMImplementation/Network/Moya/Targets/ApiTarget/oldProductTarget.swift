////
////  ProductTarget.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 15.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//enum ProductTarget {
//    case fetchProductByType(UpgradeCellState)
//    case fetchAllProducts
//    case buyProduct
//}
//
//extension ProductTarget: TargetType {
//    var baseURL: URL {
//        return URL(string: "https://appointment.dev2.d-tt.nl/api/v1/products")!
//    }
//    
//    var path: String {
//        switch self {
//        case .buyProduct, .fetchProductByType, .fetchAllProducts:
//            return ""
//        }
//    }
//    
//    var method: Moya.Method {
//        switch self {
//        case .buyProduct:
//            return .post
//        case .fetchProductByType, .fetchAllProducts:
//            return .get
//        }
//    }
//    
//    var sampleData: Data {
//        switch self {
//        case .fetchProductByType(let type):
//            switch type {
//            case .theme:
//                return stubbedResponse("ThemeProductResponse")
//            case .background:
//                return stubbedResponse("BackgroundProductResponse")
//            default:break
//            }
//        case .fetchAllProducts:
//            return stubbedResponse("ProductListResponse")
//        default: break
//        }
//        return Data()
//    }
//    
//    var task: Task {
//        switch self {
//        case .fetchAllProducts:
//            return .requestPlain
//        case .fetchProductByType(let type):
//            switch type {
//            case .theme:
//                #warning("Integer Values will change based on api structure")
//                var params: [String: Any] = [:]
//                params["type"] = 0
//                return .requestParameters(parameters: params, encoding: URLEncoding.default)
//            case .background:
//                var params: [String: Any] = [:]
//                params["type"] = 1
//                return .requestParameters(parameters: params, encoding: URLEncoding.default)
//            default: break
//            }
//        default: break
//        }
//        return .requestPlain
//    }
//    
//    var authorizationType: AuthorizationType {
//        return .bearer
//    }
//    
//    var headers: [String: String]? {
//        switch self {
//        default:
//            return nil
//        }
//    }
//}

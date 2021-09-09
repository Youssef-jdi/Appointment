////
////  ProductService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 14.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//class ProductService: MVVMService {
//    var provider: AuthenticatedProvider<MultiTarget, AuthTarget>!
//    
//    typealias AuthTarget = ApiTarget
//}
//
//extension ProductService: ProductServicable {
//    
//    func fetchProductsByType(type: UpgradeCellState, result: @escaping ProductsCompletion<ProductsModel, ProductsError>) {
//        provider.request(MultiTarget(ProductTarget.fetchProductByType(type))) { response in
//            do {
//                let productsModel: ProductsModel = try response
//                    .get()
//                    .map(ProductsModel.self)
//                result(.success(productsModel))
//            } catch {
//                result(.failure(ProductsError.underlying(error)))
//            }
//        }
//    }
//    
//    func fetchAllProducts(result: @escaping ProductsCompletion<ProductsModel, ProductsError>) {
//        provider.request(MultiTarget(ProductTarget.fetchAllProducts)) { response in
//            do {
//                let productsModel: ProductsModel = try response
//                    .get()
//                    .map(ProductsModel.self)
//                result(.success(productsModel))
//            } catch {
//                result(.failure(ProductsError.underlying(error)))
//            }
//        }
//    }
//    
//    func buyProduct(product id: Int, result: @escaping ProductsCompletion<Void, ProductsError>) {
//        provider.request(MultiTarget(ProductTarget.buyProduct)) { response in
//            do {
//                _ = try response
//                    .get()
//                    .filterSuccessfulStatusCodes()
//                result(.success(()))
//            } catch {
//                result(.failure(ProductsError.underlying(error)))
//            }
//        }
//    }
//}

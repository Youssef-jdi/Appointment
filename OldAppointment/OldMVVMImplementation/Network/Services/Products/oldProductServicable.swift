////
////  ProductServicable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 14.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Result
//
//typealias ProductsResult<T, U: Error> = Result<T, U>
//typealias ProductsCompletion<T, U: Error> = ((ProductsResult<T, U>) -> Void)
//
//enum ProductsError: Error {
//    case unauthorized
//    case alreadyBought
//    case paymentFailure
//    case underlying(Error)
//}
//
//protocol ProductServicable {
//
//    /// Fethches Product On Type
//    ///
//    /// - Parameters:
//    ///   - type: Product Type
//    ///   - result: Products Completion
//    func fetchProductsByType(type: UpgradeCellState, result: @escaping ProductsCompletion<ProductsModel, ProductsError>)
//
//    /// Buys Product
//    ///
//    /// - Parameters:
//    ///   - id: product id
//    ///   - result: Products Completion
//    func buyProduct(product id: Int, result: @escaping ProductsCompletion<Void, ProductsError>)
//    
//    /// fetches all products
//    ///
//    /// - Parameter result: Products Completion
//    func fetchAllProducts(result: @escaping ProductsCompletion<ProductsModel, ProductsError>)
//}

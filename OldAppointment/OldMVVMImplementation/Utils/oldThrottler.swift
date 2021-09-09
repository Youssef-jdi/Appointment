////
////  Throttler.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 04/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//public class Throttler {
//
//    private let queue = DispatchQueue.global(qos: .background)
//
//    private var job = DispatchWorkItem(block: {})
//    private var previousRun = Date.distantPast
//    private var maxInterval: Int
//
//    init(seconds: Int) {
//        self.maxInterval = seconds
//    }
//
//    func throttle(block: @escaping () -> Void) {
//        job.cancel()
//        job = DispatchWorkItem { [weak self] in
//            self?.previousRun = Date()
//            block()
//        }
//        let delay = Date.second(from: previousRun) > maxInterval ? 0 : maxInterval
//        queue.asyncAfter(deadline: .now() + Double(delay), execute: job)
//    }
//}
//
//private extension Date {
//    static func second(from referenceDate: Date) -> Int {
//        return Int(Date().timeIntervalSince(referenceDate).rounded())
//    }
//}

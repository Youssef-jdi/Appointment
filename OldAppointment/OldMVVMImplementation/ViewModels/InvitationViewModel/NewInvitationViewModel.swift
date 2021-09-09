////
////  NewInvitationViewModel.swift
////  appointment
////
////  Created by Suhaib Al Saghir on 03/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import MapKit
//import GooglePlaces
//
//extension NewInvitationTableViewController {
//    class NewInvitationViewModel: MVVMViewModel {
//
//        typealias Service = InvitationService
//
//        var service = InvitationService()
//        private var throttler: Throttler? = nil
//        private var throttlingInterval: Int? = 1 {
//            didSet {
//                guard let interval = throttlingInterval else {
//                    self.throttler = nil
//                    return
//                }
//                self.throttler = Throttler(seconds: interval)
//            }
//        }
//
//        var textRequest = ""
//        var matchingItems: [GMSAutocompletePrediction] = []
//        var placesClient: GMSPlacesClient?
//        var googleMapsToken: GMSAutocompleteSessionToken?
//
//        var didReceivedSearchResponse: ((Bool) -> Void)?
//
//        func updateGoogleMapSearchResult() {
//            throttlingInterval = 3
//            guard let throttler = self.throttler else {
//                performSearch()
//                return
//            }
//            throttler.throttle {
//                DispatchQueue.main.async {
//                    self.performSearch()
//                }
//            }
//        }
//
//        func performSearch() {
//            let filter = GMSAutocompleteFilter()
//            filter.type = .establishment
//
//
////            findAutocompletePredictions(
////                fromQuery: textRequest,
////                bounds: nil,
////                boundsMode: GMSAutocompleteBoundsMode.bias,
////                filter: filter,
////                sessionToken: googleMapsToken!) { results, error in
////                    if let error = error {
////                        print("error: \(error)")
////                        self.didReceivedSearchResponse?(false)
////                        return
////                    }
////                    if let results = results {
////                        print(results)
////                        self.matchingItems = results
////                        self.didReceivedSearchResponse?(true)
////                    }
////            }
//        }
//    }
//}

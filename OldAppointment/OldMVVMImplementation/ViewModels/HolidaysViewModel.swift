////
////  HolidaysViewModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 22.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import EventKit
//
//typealias HolidaysPresentationState = PresentationState<HolidaysState, HolidaysError>
//
//enum HolidaysState {
//    case authorized
//}
//
//enum HolidaysError: Error {
//    case restricted
//    case denied
//    case underlying(Error)
//}
//
//struct HolidaySectionModel {
//    let date: Date
//    let holidays: [HolidayModel]
//    
//    init(date: Date, holidays: [HolidayModel]) {
//        self.date = date
//        self.holidays = holidays
//    }
//    
//    var title: String {
//        return date.localizedDateString(dateFormat: Date.DateFormats.dayHalfMonthYear.rawValue)!
//    }
//}
//
//class HolidaysViewModel {
//    
//    let eventStore = EKEventStore()
//    var model: [HolidaySectionModel] = []
//    var stateHandler: ((HolidaysPresentationState) -> Void)?
//    private(set) var currentState: HolidaysPresentationState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//    
//    func requestAccesToCalendar() {
//        switch EKEventStore.authorizationStatus(for: .event) {
//        case .notDetermined:
//            eventStore.requestAccess(to: EKEntityType.event, completion: { accessGranted, error in
//                if error != nil {
//                    self.currentState = .error(HolidaysError.underlying(error!))
//                    return
//                }
//                if !accessGranted {
//                    self.currentState = .error(HolidaysError.denied)
//                    return
//                }
//            })
//        case .restricted:
//            currentState = .error(HolidaysError.restricted)
//        case .denied:
//            currentState = .error(HolidaysError.denied)
//        case .authorized:
//            self.getALLEvents()
//            self.currentState = .value(HolidaysState.authorized)
//        @unknown default: break
//        }
//    }
//    
//    func getALLEvents() {
//        let startDate = Date().firstDayOfTheYear()
//        let endDate = startDate.addingComponent(value: 1, for: .year)
//        let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars: nil)
//        let holidays = eventStore.events(matching: predicate)
//        self.model = holidays
//            .compactMap { HolidayModel(header: $0.title, date: $0.startDate, type: HolidayType(rawValue: Int.random(in: 0..<3))!) }
//            .groupByMonth()
//            .values
//            .compactMap { holidays -> HolidaySectionModel? in
//                HolidaySectionModel(date: holidays.first!.date, holidays: holidays)
//            }.sorted(by: { hlr, hls -> Bool in
//                hlr.date.compare(hls.date) == .orderedAscending
//            })
//    }
//}

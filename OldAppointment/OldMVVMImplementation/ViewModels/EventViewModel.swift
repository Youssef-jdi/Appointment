////
////  EventViewModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 6.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//typealias EventPresentationState = PresentationState<EventState, AppointmentError>
//
//enum EventState {
//    case normal
//    case yearChanged
//}
//
//class EventViewModel: MVVMViewModel {
//    var service = AppointmentService()
//    
//    typealias Service = AppointmentService
//    
//    var model: AppointmentModel! {
//        didSet {
//            yearDatesGroupedByWeekAndMonth = Calendar.calendarMonday.getGroupedDatesByYearAndWeek(year: currentYear)
//            self.groupedModel = model.data.appointments.groupByDate()
//        }
//    }
//    
//    var yearDatesGroupedByWeekAndMonth: [Int: [Int: [Date]]] = [Int: [Int: [Date]]]()
//    var currentDate = Date()
//    var currentYear = Date().year
//    var groupedModel: [DateComponents: [Appointment]] = [:]
//    var stateHandler: ((EventPresentationState) -> Void)?
//    private(set) var currentState: EventPresentationState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//    
//    func hasSync(appointment: [Appointment]) -> Bool {
//        let syncTarget = appointment.compactMap { $0.authSync }
//        return !syncTarget.isEmpty
//    }
//    
//    func getImageFor(appointments: [Appointment]) -> UIImage {
//        let typeArray = appointments.compactMap { $0.appointmentType }
//        let myFilteredArray = typeArray.sorted { lhs, rhs -> Bool in
//            let isBigger = lhs.rawValue < rhs.rawValue
//            return isBigger
//        }
//        switch myFilteredArray.first! {
//        case .standard: return R.image.menu_Standard()!
//        case .business: return R.image.menu_Business()!
//        case .memo(let type):
//            switch type {
//            case .memo:
//                return R.image.memo_Icon_Yellow()!
//            case .memoTo:
//                return R.image.menu_MemoTo()!
//            }
//        case .group: return R.image.menu_Group()!
//        case .meetings(.messages): return R.image.menu_Messages()!
//        case .meetings(.minOfMeeting): return R.image.menu_MOM()!
//        }
//    }
//    
//    func changeYear(with year: Int) {
//        yearDatesGroupedByWeekAndMonth = Calendar.calendarMonday.getGroupedDatesByYearAndWeek(year: year)
//        let componentsStart = DateComponents(year: year, month: 1, day: 1)
//        let startDate = Calendar.calendarMonday.date(from: componentsStart)!
//        currentYear = year
//        currentDate = startDate
//        currentState = .value(EventState.yearChanged)
//    }
//    
//    /// Gets A spesific Model to prepare the Cell
//    ///
//    /// - Parameter row: index of dates to be prepared
//    /// - Returns: an array of HomeCellModel
//    func getCellAttributes(for row: Int) -> [HomeCellModel] {
//        guard let dates = yearDatesGroupedByWeekAndMonth[currentYear]?[row] else { return [] }
//        var homeCellModels: [HomeCellModel] = []
//        let calendar = Calendar.calendarMonday
//        dates.forEach {
//            let components = calendar.dateComponents([.weekOfYear, .weekday, .day], from: $0)
//            var notifactionCount: String?
//            var homeCellModel: HomeCellModel!
//            var image: UIImage?
//            var syncImage: UIImage?
//            var weekIndex: Int?
//            if let appointments = groupedModel[components] {
//                notifactionCount = "("+"\(appointments.count)"+")"
//                image = self.getImageFor(appointments: appointments)
//                syncImage = appointments.first?.syncImage
//                weekIndex = $0.weekIndex
//            }
//            homeCellModel = HomeCellModel(dayIndice: weekIndex, appointmentImage: image, syncImage: syncImage, notificationCount: notifactionCount, date: $0, day: components.day!)
//            homeCellModels.append(homeCellModel)
//        }
//        return homeCellModels
//    }
//    
//    /// determines for end of month
//    ///
//    /// - Parameter row: index of dates to determine
//    /// - Returns: Date
//    func determineForEndOfMonth(for row: Int) -> Date? {
//        guard let dates = yearDatesGroupedByWeekAndMonth[currentYear]?[row] else { return nil }
//        if let lastDate = dates.last {
//            let component = Calendar.calendarMonday.component(.month, from: lastDate)
//            if component != currentDate.month {
//                currentDate = lastDate
//                return lastDate
//            }
//        }
//        return nil
//    }
//    
//    /// Change to first day of Month
//    ///
//    /// - Parameter isNext: is for decreasing or increasing
//    /// - Returns: The first date of next/previous month
//    func changeMonth(isNext: Bool) -> Date {
//        let value = isNext ? 1 : -1
//        let components: NSDateComponents = Calendar.calendarMonday.dateComponents([.year, .month], from: currentDate) as NSDateComponents
//        components.month += value
//        components.day = 1
//        currentDate = Calendar.calendarMonday.date(from: components as DateComponents)!
//        return currentDate
//    }
//}
//
//extension EventViewModel {
//    
//    func getParticipants(id: Int) {
//        service.fetchParticipant(id: id, result: { result in
//            switch result {
//            case .success(let participants):
//                print("Success !!! : \(participants.data.title)")
//            case .failure(let error):
//                print("Failure !! :\(error.localizedDescription)")
//            }
//        })
//    }
//    
//    func getHomeAppointments() {
//        service.fetchHomeAppointments { result in
//            switch result {
//            case .success(let homeAppointment):
//                self.model = homeAppointment
//                self.currentState = .value(EventState.normal)
//            case .failure(let error):
//                print(error.localizedDescription)
//                self.currentState = .error(AppointmentError.underlying(error))
//            }
//        }
//    }
//    
//    func getAppointmentBy(type: SideMenuCellType) {
//        service.fetchAppointment(by: type) { result in
//            switch result {
//            case .success(let homeAppointment):
//                self.model = homeAppointment
//                self.currentState = .value(EventState.normal)
//            case .failure(let error):
//                print(error.localizedDescription)
//                self.currentState = .error(AppointmentError.underlying(error))
//            }
//        }
//    }
//}

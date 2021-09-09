////
////  PlanningViewModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 8.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//typealias PlanningPresentationState = PresentationState<PlanningState, AppointmentError>
//
//enum PlanningState {
//    case monthChanged
//}
//
//class PlanningViewModel: MVVMViewModel {
//    typealias Service = AppointmentService
//    
//    var service = AppointmentService()
//    var stateHandler: ((PlanningPresentationState) -> Void)?
//    private(set) var currentState: PlanningPresentationState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//    var model: PlanningModel? {
//        didSet {
//            guard let appointments = model?.data.appointments else { return }
//            formattedDates = appointments.groupByDate()
//        }
//    }
//    var monthDates: [Date] = Date().getDaysForMonth()
//    var currentMonth = Date().month
//    var formattedDates: [DateComponents: [PlanningAppointmentModel]] = [:]
//    
//    func prepareCell(for row: Int, cell: PlanningCell, delegate: PlanningViewDelegate) -> PlanningCell {
//        let date = monthDates[row]
//        let components = Calendar.calendarMonday.dateComponents([.day, .year, .month], from: date)
//        if let appointments = formattedDates[components] {
//            cell.prepareViews(delegate: delegate, model: appointments)
//        }
//        let dayNumber = date.day.description
//        let dayName = date.localizedDayName()!.uppercased()
//        cell.prepareDateLabel(dayNumber: dayNumber, dayName: dayName)
//        return cell
//    }
//    
//    func getMonthDates(for index: Int) -> [Date] {
//        return Date().getDaysForMonth(for: index)
//    }
//}
//
//extension PlanningViewModel {
//    
//    func getPlannings() {
//        service.fetchPlannings { result in
//            switch result {
//            case .success(let planning):
//                self.model = planning
//            case .failure(let error):
//                print("Failure !!! : \(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func changeMonth(for index: Int) {
//        currentMonth = index
//        let nextMonth = Date().getDaysForMonth(for: currentMonth)
//        monthDates.append(contentsOf: nextMonth)
//        self.currentState = .value(PlanningState.monthChanged)
//    }
//}

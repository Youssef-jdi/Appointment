////
////  AppointmentServicable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 6.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//import Foundation
//import Result
//
//typealias AppointmentResult<T, U: Error> = Result<T, U>
//typealias AppointmentCompletion<T, U: Error> = ((AppointmentResult<T, U>) -> Void)
//
//enum AppointmentError: Error {
//    case invalidCredentials
//    case underlying(Error)
//}
//
//protocol AppointmentServicable {
//    /// Retreives the participants from a specific appointment.
//    ///
//    /// - Parameters:
//    ///   - id: appointment Id
//    ///   - result: AppointmentCompletion
//    func fetchParticipant(id: Int, result: @escaping AppointmentCompletion<ParticipantModel, AppointmentError>)
//    
//    /// Retrieves all Appointments for home screen
//    ///
//    /// - Parameter result: AppointmentCompletion
//    func fetchHomeAppointments(result: @escaping AppointmentCompletion<AppointmentModel, AppointmentError>)
//
//    /// fetchs Plannings
//    ///
//    /// - Parameter result: AppointmentCompletion
//    func fetchPlannings(result: @escaping AppointmentCompletion<PlanningModel, AppointmentError>)
//    
//    /// Fetches Appointment By Type
//    ///
//    /// - Parameters:
//    ///   - type: type of appointment
//    ///   - result: Appointment Completion
//    func fetchAppointment(by type: SideMenuCellType, result: @escaping AppointmentCompletion<AppointmentModel, AppointmentError>)
//}

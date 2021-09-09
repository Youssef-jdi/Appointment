////
////  AppointmentService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 6.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//class AppointmentService: MVVMService {
//    var provider: AuthenticatedProvider<MultiTarget, AuthTarget>!
//    
//    typealias AuthTarget = ApiTarget
//}
//
//extension AppointmentService: AppointmentServicable {
//    func fetchAppointment(by type: SideMenuCellType, result: @escaping AppointmentCompletion<AppointmentModel, AppointmentError>) {
//        provider.request(MultiTarget(AppointmentsTarget.appointmentsByType(type: type))) {  response in
//            do {
//                let appointmentsByType: AppointmentModel = try response
//                    .get()
//                    .map(AppointmentModel.self)
//                result(.success(appointmentsByType))
//            } catch {
//                result(.failure(AppointmentError.underlying(error)))
//            }
//        }
//    }
//    
//    func fetchHomeAppointments(result: @escaping AppointmentCompletion<AppointmentModel, AppointmentError>) {
//        provider.request(MultiTarget(AppointmentsTarget.homeAppointments)) {  response in
//            do {
//                let homeAppointmentModel: AppointmentModel = try response
//                    .get()
//                    .map(AppointmentModel.self)
//                result(.success(homeAppointmentModel))
//            } catch {
//                result(.failure(AppointmentError.underlying(error)))
//            }
//        }
//    }
//    
//    func fetchPlannings(result: @escaping AppointmentCompletion<PlanningModel, AppointmentError>) {
//        provider.request(MultiTarget(AppointmentsTarget.plannings)) { response in
//            do {
//                let planningModel: PlanningModel = try response
//                    .get()
//                    .map(PlanningModel.self)
//                result(.success(planningModel))
//            } catch {
//                result(.failure(AppointmentError.underlying(error)))
//            }
//        }
//    }
//    
//    func fetchParticipant(id: Int, result: @escaping AppointmentCompletion<ParticipantModel, AppointmentError>) {
//        provider.request(MultiTarget(AppointmentsTarget.participants(id: id))) {  response in
//            do {
//                let participantModel: ParticipantModel = try response
//                    .get()
//                    .map(ParticipantModel.self)
//                result(.success(participantModel))
//            } catch {
//                result(.failure(AppointmentError.underlying(error)))
//            }
//        }
//    }
//}

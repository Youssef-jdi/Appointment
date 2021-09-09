//
//  AppointmentViewModelProvider.swift
//  appointment
//
//  Created by Irina Filkovskaya on 25.06.2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

protocol AppointmentViewModelProviderProtocol {
    func dateViewModel(from data: AppointmentDate) -> AppointmentDateViewModel
    func basicViewModel(from appointment: Appointment) -> AppointmentBasicViewModel
}

class AppointmenViewModelProvider: AppointmentViewModelProviderProtocol {
    private var dateFormatter: DateFormatterProtocol
    
    init(dateFormatter: DateFormatterProtocol) {
        self.dateFormatter = dateFormatter
    }
    
    func basicViewModel(from appointment: Appointment) -> AppointmentBasicViewModel {
        let createdAt = dateFormatter.formatDate(
            date: Date(timeIntervalSince1970: TimeInterval(appointment.created)),
            format: "dd-MM-yyyy HH:mm")
        
        return .init(
            title: appointment.title,
            createdAt: createdAt,
            creator: appointment.creatorName,
            description: appointment.description ?? "",
            image: appointment.appointmentCategory.image,
            location: appointment.address ?? "",
            participants: R.string.localizable.peopleInvited(
                val: (appointment.participants?.count ?? 0)
            )
        )
    }
    
    func dateViewModel(from data: AppointmentDate) -> AppointmentDateViewModel {
        
        let date = Date(timeIntervalSince1970: Double((data.startTime ?? 0) / 1000))
        let end = Date(timeIntervalSince1970: Double((data.endTime ?? 0) / 1000))
        
        let percentage: Float = {
            guard let responseCount = data.responseCount else { return 0}
            let totalResponses = responseCount.unknown + responseCount.unavailable + responseCount.available + responseCount.unsure
            guard totalResponses > 0 else { return 0 }
            return Float(responseCount.available / totalResponses)
        }()
        
        return .init(
            date: dateFormatter.formatDate(date: date, format: "EEEE dd MMMM").capitalizingFirstLetter(),
            start: dateFormatter.formatDate(date: date, format: "HH:mm"),
            end: dateFormatter.formatDate(date: end, format: "HH:mm"),
            respondedTo: data.responseCount != nil,
            unknown: String(data.responseCount?.unknown ?? 0),
            unavailable: String(data.responseCount?.unavailable ?? 0),
            available: String(data.responseCount?.available ?? 0),
            availableInt: data.responseCount?.available ?? 0,
            unsure: String(data.responseCount?.unsure ?? 0),
            percentage: percentage
        )
    }
}

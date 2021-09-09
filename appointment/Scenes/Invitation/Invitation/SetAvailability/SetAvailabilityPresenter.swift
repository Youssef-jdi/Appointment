//
//  SetAvailabilityPresenter.swift
//  appointment
//
//  Created by Jihen on 09/07/2020.
//  Copyright (c) 2020 DTT. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

//sourcery: AutoMockable
protocol SetAvailabilityPresenterProtocol {
    func set(viewController: SetAvailabilityViewControllerProtocol?)
    func presentSetAvailability()
    func presentGetDateTime(date: AppointmentDate)
}

class SetAvailabilityPresenter: SetAvailabilityPresenterProtocol {
    
    weak var viewController: SetAvailabilityViewControllerProtocol?
    private let dateFormatter: DateFormatterProtocol
    
    init(dateFormatter: DateFormatterProtocol) {
        self.dateFormatter = dateFormatter
    }
    
    func set(viewController: SetAvailabilityViewControllerProtocol?) {
        self.viewController = viewController
    }
    
    func presentSetAvailability() {
        viewController?.displayAvailabilitySet()
    }
    
    func presentGetDateTime(date: AppointmentDate) {
        guard let appointmentDate = date.startTime else { return }
        let day = Date(timeIntervalSince1970: TimeInterval(appointmentDate / 1000))
        let dayString = dateFormatter.formatDate(date: day,
                                                 format: "EEEE dd MMMM yyyy")
        
        guard let startTime = date.startTime else { return }
        let start = Date(timeIntervalSince1970: TimeInterval(startTime / 1000))
        let startString = dateFormatter.formatDate(date: start,
                                                   format: "HH:mm ")
        
        guard let endTime = date.endTime else { return }
        let end = Date(timeIntervalSince1970: TimeInterval(endTime / 1000))
        let endString = dateFormatter.formatDate(date: end,
                                                 format: " HH:mm")
        
        let timePeriod = startString + "-" + endString
        
        viewController?.displayDateTime(date: dayString, time: timePeriod)
    }
}

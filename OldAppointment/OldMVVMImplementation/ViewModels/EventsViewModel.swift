////
////  EventsViewModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.04.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//typealias EventsPresentationState = PresentationState<EventsState, EventsError>
//
//enum EventsState {
//    case fetchedEvents
//    case didSelectRow
//}
//
//class EventsViewModel: MVVMViewModel {
//    typealias Service = EventsService
//    
//    var service = Service()
//    
//    var stateHandler: ((EventsPresentationState) -> Void)?
//    private(set) var currentState: EventsPresentationState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//    private var eventModel: EventModel!
//    
//    var events: [Event] {
//        return eventModel.data.events
//    }
//}
//
//extension EventsViewModel {
//    
//    /// Handles UI Logic for reading event
//    ///
//    /// - Parameter indexPath: event Indexpath that wanted to be read
//    func handleReadState(for indexPath: IndexPath) {
//        eventModel.data.events[indexPath.row].isRead.toggle()
//        currentState = .value(EventsState.didSelectRow)
//    }
//    
//    
//    /// colors spesific fields of the description and gets the right description from localizable depends on interaction type
//    ///
//    /// - Parameter indexPath: Event Indexpath
//    /// - Returns: description
//    func getDescription(for indexPath:IndexPath) -> NSMutableAttributedString {
//        let model = eventModel.data.events[indexPath.row]
//        let type = model.interactionType
//        var localized: String!
//        switch type {
//        case .dateOffer:
//            localized = R.string.localizable.eventDetailTypeOne.key.localized
//        case .addedTodoListItem: localized = R.string.localizable.eventDetailTypeTwo.key.localized
//        case .addedReaction: localized = R.string.localizable.eventDetailTypeThree.key.localized
//        case .pinnedDate:
//            localized = R.string.localizable.eventDetailTypeFour.key.localized
//        @unknown default: break
//        }
//        let localizedWithFormat = NSMutableAttributedString(
//            string: String.localizedStringWithFormat(
//                localized,
//                model.owner,
//                model.appointmentName
//        ))
//        let firstItem = (localizedWithFormat.description as NSString).range(of: model.owner)
//        let secondItem = (localizedWithFormat.description as NSString).range(of: model.appointmentName)
//        localizedWithFormat.addAttributes(PopUpFontAttributes.eventsDescriptionsFirst.value, range: firstItem)
//        localizedWithFormat.addAttributes(PopUpFontAttributes.eventsDescriptionsSecond.value, range: secondItem)
//        return localizedWithFormat
//    }
//}
//
//// MARK: Service Functions
//extension EventsViewModel {
//    func fetchEvents(user id: Int) {
//        currentState = .loading
//        service.fetchEvents(user: id) { result in
//            self.currentState = .idle
//            switch result {
//            case .success(let value):
//                self.eventModel = value
//                self.currentState = .value(EventsState.fetchedEvents)
//            case .failure(let error):
//                self.currentState = .error(EventsError.underlying(error))
//            }
//        }
//    }
//}

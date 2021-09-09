////
////  InvitationsViewModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 5.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import UIKit
//
//typealias InvitationPresentationState = PresentationState<InvitationState, InvitationError>
//
//enum InvitationState {
//    case fetchedDetails
//}
//
//class InvitationsViewModel: MVVMViewModel {
//    var service = InvitationService()
//    
//    typealias Service = InvitationService
//    
//    var stateHandler: ((InvitationPresentationState) -> Void)?
//    private(set) var currentState: InvitationPresentationState = .idle {
//        didSet {
//            self.stateHandler?(currentState)
//        }
//    }
//    
//    var invitationModel: InvitationModel?
//    var cellTypes: [InvitationGeneralCellType] = []
//    
//    func prepareCellTypes(isIncoming: Bool = false) {
//        guard let invitationModel = invitationModel else { return }
//        if isIncoming { cellTypes.append(.giveAvailability) }
//        invitationModel.proposedDates.forEach { _ in self.cellTypes.append(.proposedDate) }
//        cellTypes.append(.todoList)
//        cellTypes.append(.attachment)
//        invitationModel.conversations.forEach { self.cellTypes.append(.chat($0)) }
//        if !isIncoming { cellTypes.append(.newChat) }
//    }
//}
//
//extension InvitationsViewModel {
//    
//    func createInvitation(invitation: InvitationModel) {
//        service.createInvitation(invitation: invitation) { result in
//            switch result {
//            case .success(let invitationResponse):
//                print("Success !!! : \(invitationResponse.title)")
//            case .failure(let error):
//                print("Failure !! :\(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func getDetails(id: Int) {
//        service.fetchDetails(id: id) { result in
//            switch result {
//            case .success(let details):
//                self.invitationModel = details
//                self.prepareCellTypes()
//                self.currentState = .value(InvitationState.fetchedDetails)
//            case .failure(let error):
//                self.currentState = .error(InvitationError.underlying(error))
//            }
//        }
//    }
//    
//    func postRespond(proposedDateId: Int, comment: String?, alternativeDate: Int?, status: String) {
//        service.postRespond(proposedDateId: proposedDateId, comment: comment, alternativeDate: alternativeDate, status: status) { result in
//            switch result {
//            case .success(let respond):
//                print("Success !!! : \(respond.data.title)")
//            case .failure(let error):
//                print("Failure !! :\(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func filter(offset: Int, limit: Int) {
//        service.filter(offset: offset, limit: limit) { result in
//            switch result {
//            case .success(let filtered):
//                print("Success !!! : \(filtered.data)")
//            case .failure(let error):
//                print("Failure !! :\(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func getInvitationTypeImage() -> UIImage? {
//        guard let invitationModel = invitationModel else { return  nil }
//        switch invitationModel.type {
//        case .standard:
//            return R.image.menu_Standard()!
//        case .business:
//            return R.image.menu_Business()!
//        case .group:
//            return R.image.menu_Group()!
//        case .mom:
//            return R.image.menu_MOM()!
//        case .memo:
//            return R.image.menu_Memo()!
//        case .memoTo:
//            return R.image.menu_MemoTo()!
//        case .holiday:
//            return R.image.menu_Holidays()!
//        }
//    }
//    
//    func getTodoListDescription() -> String {
//        guard let invitationModel = invitationModel else { return "" }
//        let total = invitationModel.toDoList.count.description
//        let completed = invitationModel.toDoList.filter { $0.isCompleted }
//        return completed.count.description+"/"+total
//    }
//}

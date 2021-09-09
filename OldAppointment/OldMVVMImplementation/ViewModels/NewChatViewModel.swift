////
////  NewChatViewModel.swift
////  appointment
////
////  Created by Dylan Barteling on 15/03/2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//class NewChatViewModel: MVVMViewModel {
//    typealias Service = NewChatService
//    
//    var service = Service()
//    
//    var didReceiveFriends: (() -> Void)?
//    
//    var filteredFriends: UserFilterModel?
//    var allFriends: UserFilterModel?
//    private (set) var selectedFriends: [UserDatum] = []
//}
//
//extension NewChatViewModel {
//    
//    func getFriends() {
//        service.fetchFriends { result in
//            switch result {
//            case .success(let result):
//                self.allFriends = result
//                self.didReceiveFriends?()
//            case .failure(let error):
//                print("Failure !! :\(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func searchFriends(query: String) {
//        service.fetchFriends(query: query, result: { result in
//            switch result {
//            case .success(let result):
//                self.filteredFriends = result
//                self.didReceiveFriends?()
//            case .failure(let error):
//                print("Failure !! :\(error.localizedDescription)")
//            }
//        })
//    }
//    
//    func removeSelectedFriend(index: Int) {
//        selectedFriends.remove(at: index)
//    }
//    
//    func updateSelectedFriends(shouldAdd: Bool, friend: UserDatum) {
//        if shouldAdd {
//            addSelectedFriendsIfNotExist(friend)
//        } else {
//            removeSelectedFriendIfExist(friend)
//        }
//        print()
//        print("SELECTED FRIENDS:")
//        selectedFriends.forEach { print($0.fullName) }
//    }
//    
//    private func addSelectedFriendsIfNotExist(_ friend: UserDatum) {
//        if !selectedFriends.contains(friend) {
//            selectedFriends.append(friend)
//        }
//    }
//    
//    private func removeSelectedFriendIfExist(_ friend: UserDatum) {
//        selectedFriends = selectedFriends.filter { $0 != friend }
//    }
//}

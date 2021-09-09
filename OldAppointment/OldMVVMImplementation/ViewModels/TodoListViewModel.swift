////
////  TodoListViewModel.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 6.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//
//class TodoListViewModel: MVVMViewModel {
//    var service = TodoListService()
//    
//    typealias Service = TodoListService
//}
//
//extension TodoListViewModel {
//    
//    func getTodoList(id: Int) {
//        service.fetchTodoList(id: id) { result in
//            switch result {
//            case .success(let todoList):
//                print("Success !!! : \(todoList.data)")
//            case .failure(let error):
//                print("Failure !! :\(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func createTodoItem(invitationId: Int, title: String) {
//        service.createTodoItem(title: title, invitationId: invitationId) { result in
//            switch result {
//            case .success(let todoItem):
//                print("Success !!! : \(todoItem.data)")
//            case .failure(let error):
//                print("Failure !! :\(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func updateTodoComplete(invitationId: Int, todoId: Int, isComplete: Bool = true) {
//        service.updateTodoComplete(invitationId: invitationId, todoId: todoId, isComplete: isComplete) { result in
//            switch result {
//            case .success(let todo):
//                print("Success !!! : \(todo.data)")
//            case .failure(let error):
//                print("Failure !! :\(error.localizedDescription)")
//            }
//        }
//    }
//    
//    func bulkTodoItemCreation(id: Int) {
//        service.bulkTodoItemCreation(id: id) { result in
//            switch result {
//            case .success(let todoItems):
//                print("Success !!! : \(todoItems.titles)")
//            case .failure(let error):
//                print("Failure !! :\(error.localizedDescription)")
//            }
//        }
//    }
//}

////
////  TodoListService.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 6.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import Moya
//
//class TodoListService: MVVMService {
//    var provider: AuthenticatedProvider<MultiTarget, AuthTarget>!
//    
//    typealias AuthTarget = ApiTarget
//}
//
//extension TodoListService: TodoListServicable {
//    func fetchTodoList(id: Int, result: @escaping TodoListCompletion<TodoListModel, TodoListError>) {
//        provider.request(MultiTarget(TodoListTarget.getTodoList(invitationId: id))) { response in
//            do {
//                let participantModel: TodoListModel = try response
//                    .get()
//                    .map(TodoListModel.self)
//                result(.success(participantModel))
//            } catch {
//                result(.failure(TodoListError.underlying(error)))
//            }
//        }
//    }
//    
//    func createTodoItem(title: String, invitationId: Int, result: @escaping TodoListCompletion<TodoListModel, TodoListError>) {
//        provider.request(MultiTarget(TodoListTarget.createTodoItem(invitationId: invitationId, title: title))) { response in
//            do {
//                let participantModel: TodoListModel = try response
//                    .get()
//                    .map(TodoListModel.self)
//                result(.success(participantModel))
//            } catch {
//                result(.failure(TodoListError.underlying(error)))
//            }
//        }
//    }
//    
//    func updateTodoComplete(invitationId: Int, todoId: Int, isComplete: Bool, result: @escaping TodoListCompletion<TodoListModel, TodoListError>) {
//        provider.request(MultiTarget(TodoListTarget.updateTodoComplete(invitationId: invitationId, todoId: todoId, isComplete: isComplete))) { response in
//            do {
//                let participantModel: TodoListModel = try response
//                    .get()
//                    .map(TodoListModel.self)
//                result(.success(participantModel))
//            } catch {
//                result(.failure(TodoListError.underlying(error)))
//            }
//        }
//    }
//    
//    func bulkTodoItemCreation(id: Int, result: @escaping TodoListCompletion<TodoListBulkModel, TodoListError>) {
//        provider.request(MultiTarget(TodoListTarget.bulkTodoItemCreation(invitationId: id))) { response in
//            do {
//                let todoListBulkModel: TodoListBulkModel = try response
//                    .get()
//                    .map(TodoListBulkModel.self)
//                result(.success(todoListBulkModel))
//            } catch {
//                result(.failure(TodoListError.underlying(error)))
//            }
//        }
//    }
//}

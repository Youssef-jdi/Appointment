////
////  TodoListServicable.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 6.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//import Foundation
//import Result
//
//typealias TodoListResult<T, U: Error> = Result<T, U>
//typealias TodoListCompletion<T, U: Error> = ((TodoListResult<T, U>) -> Void)
//
//enum TodoListError: Error {
//    case todoItemNotFound
//    case userIsNotAdmin
//    case underlying(Error)
//}
//
//protocol TodoListServicable {
//    
//    /// Retrieves the to do list for an invitation
//    ///
//    /// - Parameters:
//    ///   - id: invitation id
//    ///   - result: TodoListCompletion
//    func fetchTodoList(id: Int, result: @escaping TodoListCompletion<TodoListModel, TodoListError>)
//    
//    /// Creates a new todo Item
//    ///
//    /// - Parameters:
//    ///   - title: required The title for the todo item
//    ///   - invitationId: invitation id
//    ///   - result: Todo List Completion
//    func createTodoItem(title: String, invitationId: Int, result: @escaping TodoListCompletion<TodoListModel, TodoListError>)
//    
//    /// Updates spesific todo as completed
//    ///
//    /// - Parameters:
//    ///   - invitationId: invitation id
//    ///   - todoId: todo id
//    ///   - isComplete: completed value
//    func updateTodoComplete(invitationId: Int, todoId: Int, isComplete: Bool, result: @escaping TodoListCompletion<TodoListModel, TodoListError>)
//        
//    /// Bulk todo item creation
//    ///
//    /// - Parameters:
//    ///   - id: todo id
//    ///   - result: Todo List Completion
//    func bulkTodoItemCreation(id: Int, result: @escaping TodoListCompletion<TodoListBulkModel, TodoListError>)
//}

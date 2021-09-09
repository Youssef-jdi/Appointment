////
////  AppointmentDataSourceDelegate.swift
////  appointment
////
////  Created by Onur Hüseyin Çantay on 20.03.2019.
////  Copyright © 2019 DTT. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//protocol AppointmentDataSourceManagerProtocol {
//    var eventModel: AppointmentModel? { get set }
//    
//    func navigateWithEvent(at indexPath: IndexPath)
//}
//
//protocol AppointmentDataSourceProtocol {
//    associatedtype DataSourceManager: AppointmentDataSourceManagerProtocol
//    
//    var dataSourceManager: DataSourceManager { get set }
//    
//    init()
//}
//
//protocol HasDataSource {
//    associatedtype DataSource: AppointmentDataSourceProtocol
//    
//    var dataSource: DataSource { get set }
//}
//
//protocol HasManagerWithDataSource: AppointmentDataSourceProtocol, UITableViewDataSource { }

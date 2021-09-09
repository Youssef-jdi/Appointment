//
//  ConnectivityProtocol.swift
//  appointment
//
//  Created by Irina Filkovskaya on 28.05.2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation
import Connectivity

protocol ConnectivityProtocol {
    func checkConnectivity(completion: ((Connectivity) -> Void)?)
    }

extension Connectivity: ConnectivityProtocol {}

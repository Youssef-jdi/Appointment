//
//  ThreadUtil.swift
//  SportWallet
//
//  Created by Mohamed Taha Douiri on 26/07/2019.
//  Copyright © 2019 DTT. All rights reserved.
//

import Foundation

extension NSObject {

    /**
     Executes a block of code in main thread async

     - Parameter block: The block you would like to execute in main async

     */
    func UI( _ block: @escaping () -> Void) {
        DispatchQueue.main.async(execute: block)
    }

    /**
     Executes a block of code in background thread async

     - Parameter block: The block you would like to execute in back thread async

     */
    func BG( _ block: @escaping () -> Void) {
        DispatchQueue.global(qos: .default).async(execute: block)
    }
}

//
//  ConsoleLogger.swift
//  appointment
//
//  Created by Raluca Mesterca on 02/07/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

typealias Console = ConsoleLogger

enum ConsoleLogger {

    enum ConsoleEventType {
        case success
        case error
        case message
        case warning

        var emoji: String {
            switch self {
            case .success:
                return "🎉"
            case .error:
                return "🔴❗️"
            case .warning:
                return "⚠️"
            case .message:
                return "📩"
            }
        }
    }

    static func log(type: ConsoleEventType = .message, _ message: String) {
        print("""

            \(type.emoji) ===========================
            \(message)
            \(type.emoji) ===========================

            """)
    }
}

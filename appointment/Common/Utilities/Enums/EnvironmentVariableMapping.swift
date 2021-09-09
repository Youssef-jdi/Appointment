//
//  EnvironmentVariableMapping.swift
//  appointment
//
//  Created by Raluca Mesterca on 20/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

enum SnapshotTestsRecordMode: EnvironmentVariableMapping {
    typealias MappingType = Bool

    static var variableName: String { return "SnapshotTestsRecordMode" }

    static var defaultValue: MappingType { return self.mappings["off"]! }

    static var mappings: [String: MappingType] {
        return [
            "on": true,
            "off": false
        ]
    }
}

protocol EnvironmentVariableMapping {
    associatedtype MappingType

    static var variableName: String { get }
    static var defaultValue: MappingType { get }
    static var mappings: [String: MappingType] { get }
}

extension EnvironmentVariableMapping {
    static var variableValue: String? {
        return ProcessInfo.processInfo.environment[variableName]
    }

    static var isEnvironmentVariableEnabled: Bool {
        return self.variableValue != nil
    }

    static var environmentVariableMappingValue: MappingType {
        guard let variableValue = self.variableValue else {
            Console.log(type: .warning, "No value associated with environment variable \"\(variableName)\". Using default value: \(defaultValue)")
            return self.defaultValue
        }

        guard let environmentMapping = self.mappings[variableValue] else {
            Console.log(type: .warning, "Environment variable \"\(variableName)\" has unknown value: \(variableValue). Using default value: \(defaultValue)")
            return self.defaultValue
        }

        return environmentMapping
    }
}

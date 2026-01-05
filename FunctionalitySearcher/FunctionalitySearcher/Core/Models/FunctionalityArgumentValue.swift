//
//  FunctionalityArgumentValue.swift
//  FunctionalitySearcher
//
//  Created by FernandoDuran on 5/1/26.
//

import Foundation

/// Enum que representa diferentes tipos de valores que pueden ser pasados como argumentos a las funcionalidades
/// Soporta datos primitivos (String, Int, Double, Bool) y objetos compuestos (Dictionary, Array)
enum FunctionalityArgumentValue: Codable, Hashable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case dictionary([String: FunctionalityArgumentValue])
    case array([FunctionalityArgumentValue])
    case null
    
    // MARK: - Codable Implementation
    
    enum CodingKeys: String, CodingKey {
        case type, value
    }
    
    enum ValueType: String, Codable {
        case string, int, double, bool, dictionary, array, null
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(ValueType.self, forKey: .type)
        
        switch type {
        case .string:
            let value = try container.decode(String.self, forKey: .value)
            self = .string(value)
        case .int:
            let value = try container.decode(Int.self, forKey: .value)
            self = .int(value)
        case .double:
            let value = try container.decode(Double.self, forKey: .value)
            self = .double(value)
        case .bool:
            let value = try container.decode(Bool.self, forKey: .value)
            self = .bool(value)
        case .dictionary:
            let value = try container.decode([String: FunctionalityArgumentValue].self, forKey: .value)
            self = .dictionary(value)
        case .array:
            let value = try container.decode([FunctionalityArgumentValue].self, forKey: .value)
            self = .array(value)
        case .null:
            self = .null
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .string(let value):
            try container.encode(ValueType.string, forKey: .type)
            try container.encode(value, forKey: .value)
        case .int(let value):
            try container.encode(ValueType.int, forKey: .type)
            try container.encode(value, forKey: .value)
        case .double(let value):
            try container.encode(ValueType.double, forKey: .type)
            try container.encode(value, forKey: .value)
        case .bool(let value):
            try container.encode(ValueType.bool, forKey: .type)
            try container.encode(value, forKey: .value)
        case .dictionary(let value):
            try container.encode(ValueType.dictionary, forKey: .type)
            try container.encode(value, forKey: .value)
        case .array(let value):
            try container.encode(ValueType.array, forKey: .type)
            try container.encode(value, forKey: .value)
        case .null:
            try container.encode(ValueType.null, forKey: .type)
        }
    }
    
    // MARK: - Convenience Initializers
    
    init(_ value: String) {
        self = .string(value)
    }
    
    init(_ value: Int) {
        self = .int(value)
    }
    
    init(_ value: Double) {
        self = .double(value)
    }
    
    init(_ value: Bool) {
        self = .bool(value)
    }
    
    init(_ value: [String: FunctionalityArgumentValue]) {
        self = .dictionary(value)
    }
    
    init(_ value: [FunctionalityArgumentValue]) {
        self = .array(value)
    }
    
    // MARK: - Value Extraction
    
    var stringValue: String? {
        if case .string(let value) = self {
            return value
        }
        return nil
    }
    
    var intValue: Int? {
        if case .int(let value) = self {
            return value
        }
        return nil
    }
    
    var doubleValue: Double? {
        if case .double(let value) = self {
            return value
        }
        return nil
    }
    
    var boolValue: Bool? {
        if case .bool(let value) = self {
            return value
        }
        return nil
    }
    
    var dictionaryValue: [String: FunctionalityArgumentValue]? {
        if case .dictionary(let value) = self {
            return value
        }
        return nil
    }
    
    var arrayValue: [FunctionalityArgumentValue]? {
        if case .array(let value) = self {
            return value
        }
        return nil
    }
}

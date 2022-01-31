//
//  DecodableDefault.swift
//  DecodableDefaultValue (iOS)
//
//  Created by tayathorn on 31/1/2565 BE.
//

// ref: https://www.swiftbysundell.com/tips/default-decoding-values/

import Foundation

protocol DecodableDefaultSource {
    associatedtype Value: Decodable
    static var defaultValue: Value { get }
}

enum Default {}

extension Default {
    @propertyWrapper
    struct Wrapper<Source: DecodableDefaultSource> {
        typealias Value = Source.Value
        var wrappedValue = Source.defaultValue
    }
}

extension Default.Wrapper: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = try container.decode(Value.self)
    }
}

extension KeyedDecodingContainer {
    func decode<T>(_ type: Default.Wrapper<T>.Type,
                   forKey key: Key) throws -> Default.Wrapper<T> {
        try decodeIfPresent(type, forKey: key) ?? .init()
    }
}

// MARK: - Assign Default Value
extension Default {
    typealias Source = DecodableDefaultSource
    typealias List = Decodable & ExpressibleByArrayLiteral
    typealias Map = Decodable & ExpressibleByDictionaryLiteral

    enum Sources {
        enum True: Source {
            static var defaultValue: Bool { true }
        }

        enum False: Source {
            static var defaultValue: Bool { false }
        }
        
        enum Zero: Source {
            static var defaultValue: Int { 0 }
        }

        enum EmptyString: Source {
            static var defaultValue: String { "" }
        }

        enum EmptyList<T: List>: Source {
            static var defaultValue: T { [] }
        }

        enum EmptyMap<T: Map>: Source {
            static var defaultValue: T { [:] }
        }
    }
}

// MARK: - Set typealias
extension Default {
    typealias True = Wrapper<Sources.True>
    typealias False = Wrapper<Sources.False>
    typealias Zero = Wrapper<Sources.Zero>
    typealias EmptyString = Wrapper<Sources.EmptyString>
    typealias EmptyList<T: List> = Wrapper<Sources.EmptyList<T>>
    typealias EmptyMap<T: Map> = Wrapper<Sources.EmptyMap<T>>
}

// MARK: - Conform Common Protocols
extension Default.Wrapper: Equatable where Value: Equatable {}
extension Default.Wrapper: Hashable where Value: Hashable {}

extension Default.Wrapper: Encodable where Value: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}


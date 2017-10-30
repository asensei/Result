//
//  Result.swift
//  Result
//
//  Created by Valerio Mazzeo on 13/01/2017.
//  Copyright © 2017 Asensei. All rights reserved.
//

import Foundation

public enum Result<Value> {

    case success(Value)
    case failure(Error)

    // MARK: Initialization

    public init(value: Value) {
        self = .success(value)
    }

    public init(error: Error) {
        self = .failure(error)
    }
}

public extension Result {

    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        default:
            return nil
        }
    }

    public var error: Error? {
        switch self {
        case .failure(let error):
            return error
        default:
            return nil
        }
    }

    public func assertValue() throws -> Value {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }

    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }

    public var isFailure: Bool {
        switch self {
        case .failure:
            return true
        default:
            return false
        }
    }

    public func evaluate<Result>(success: (Value) -> Result, failure: (Error) -> Result) -> Result {
        switch self {
        case .success(let value):
            return success(value)
        case .failure(let error):
            return failure(error)
        }
    }
}

extension Result: CustomStringConvertible, CustomDebugStringConvertible {

    // MARK: CustomStringConvertible

    public var description: String {
        switch self {
        case let .success(value):
            return ".success(\(value))"
        case let .failure(error):
            return ".failure(\(error))"
        }
    }

    // MARK: CustomDebugStringConvertible

    public var debugDescription: String {
        return self.description
    }
}

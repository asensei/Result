//
//  ResultTests.swift
//  Result
//
//  Created by Valerio Mazzeo on 13/01/2017.
//  Copyright © 2017 Asensei. All rights reserved.
//

import XCTest
@testable import Result

class ResultTests: XCTestCase {

    static let allTests = [
        ("testResultSuccess", testResultSuccess),
        ("testResultFailure", testResultFailure)
    ]

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testResultSuccess() {
        let result = Result.success("test")

        XCTAssertNotNil(result.value)
        XCTAssertNil(result.error)
        XCTAssertEqual(result.value, "test")
        XCTAssertTrue(result.isSuccess)
        XCTAssertFalse(result.isFailure)
        XCTAssertNoThrow(try result.assertValue())
        XCTAssertEqual(result.evaluate(
            success: { _ -> Result<String> in .success("evaluated") },
            failure: { error in .failure(error) }
        ).value, "evaluated")
    }

    func testResultFailure() {

        let result = Result<String>.failure(TestError.testError)

        XCTAssertNil(result.value)
        XCTAssertNotNil(result.error)
        XCTAssertEqual(result.error as? TestError, TestError.testError)
        XCTAssertFalse(result.isSuccess)
        XCTAssertTrue(result.isFailure)
        XCTAssertThrowsError(try result.assertValue())
        XCTAssertTrue(result.evaluate(
            success: { _ -> Result<String> in .success("evaluated") },
            failure: { error in .failure(error) }
        ).isFailure)
    }
}

extension ResultTests {

    enum TestError: Error {
        case testError
    }
}

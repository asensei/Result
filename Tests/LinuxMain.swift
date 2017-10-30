//
//  LinuxMain.swift
//  Result
//
//  Created by Valerio Mazzeo on 14/04/2017.
//  Copyright © 2017 Asensei Inc. All rights reserved.
//

#if os(Linux)

import XCTest
@testable import ResultTests

XCTMain([
    testCase(ResultTests.allTests)
])

#endif

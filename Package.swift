// swift-tools-version:4.0

//
//  Package.swift
//  Result
//
//  Created by Valerio Mazzeo on 14/04/2017.
//  Copyright © 2017 Asensei Inc. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "Result",
    products: [
      .library(name: "Result", targets: ["Result"])
    ],
    targets: [
        .target(name: "Result"),
        .testTarget(name: "ResultTests", dependencies: ["Result"])
    ]
)

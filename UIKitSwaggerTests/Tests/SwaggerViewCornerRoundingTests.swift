//
//  SwaggerViewCornerRoundingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/25/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import XCTest
import UIKitSwagger

class SwaggerViewCornerRoundingTests: XCTestCase {

    let view = SwaggerView()
    let radius: CGFloat = 4.2

    //  MARK: Corner radius

    func testDefaultCornerRadiusValue() {
        XCTAssertEqual(view.cornerRadius, 0, "A view's corner radius should be zero by default")
    }

    func testViewCornerRadiusIsNotMappedToLayerCornerRadius() {
        view.layer.cornerRadius = radius
        XCTAssertEqual(view.cornerRadius, 0, "A view's corner radius should not correspond to its layer's corner radius")

        view.cornerRadius = 1.4
        XCTAssertEqual(view.layer.cornerRadius, radius, "A view's corner radius should not correspond to its layer's corner radius")
    }

}

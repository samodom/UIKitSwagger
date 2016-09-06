//
//  SwaggerViewTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/25/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import XCTest
import UIKitSwagger

class SwaggerViewTests: XCTestCase {
    
    let view = SwaggerView()
    let color = UIColor.orangeColor()
    var layer: CAShapeLayer!

    override func setUp() {
        layer = view.layer as! CAShapeLayer
    }

    //  TODO: frame- and coder-based initialization

    func testSwaggerViewLayerIsShapeLayer() {
        XCTAssert(view.layer is CAShapeLayer, "Swagger views should use shape layers as their layer type")
    }

    func testViewHasNoBackgroundColorByDefault() {
        XCTAssertNil(view.backgroundColor, "A Swagger view should not have a background color by default")
    }

    func testBackgroundColorIsLayerFillColor() {
        layer.fillColor = color.CGColor
        XCTAssertEqual(view.backgroundColor, color, "The background color should be derived from the layer's fill color")
    }

    func testSettingBackgroundColorsSetsLayerFillColor() {
        view.backgroundColor = color
        XCTAssertEqual(UIColor(CGColor: layer.fillColor!), color, "Setting the view's background color should set the layer's fill color")
    }

    func testClearingBackgroundColorClearsLayerFillColor() {
        layer.fillColor = color.CGColor
        view.backgroundColor = nil
        XCTAssertNil(layer.fillColor, "Clearing the view's background color should clear the layer's fill color")
    }

}

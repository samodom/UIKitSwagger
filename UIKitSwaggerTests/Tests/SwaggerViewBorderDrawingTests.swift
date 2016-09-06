//
//  SwaggerViewBorderDrawingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 5/2/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

class SwaggerViewBorderDrawingTests: XCTestCase {

    var view: SwaggerView!
    var layer: CAShapeLayer!
    let frame = CGRect(
        origin: CGPointZero,
        size: CGSize(
            width: 42,
            height: 99
        )
    )

    override func setUp() {
        super.setUp()

        view = SwaggerView(frame: frame)
        layer = view.layer as! CAShapeLayer
    }

    func testDefaultBorderWidth() {
        XCTAssertEqual(view.borderWidth, 0, "The default border width should be zero")
    }

    func testBorderWidthIsTiedToLayerLineWidth() {
        view.borderWidth = 4.2
        XCTAssertEqual(layer.lineWidth, 4.2, "The view border width property should be tied to the underlying shape layer's line width")

        layer.lineWidth = 9.9
        XCTAssertEqual(view.borderWidth, 9.9, "The view border width property should be tied to the underlying shape layer's line width")
    }

    func testChangingBorderWidthSetsNeedsDisplayOnLayer() {
        layer.startSpyingOnSetNeedsDisplay()
        view.borderWidth = 4.2
        XCTAssertTrue(layer.setNeedsDisplayCalled, "Changing the view's border width should call `setNeedsDisplay()` on its layer")
        layer.stopSpyingOnSetNeedsDisplay()
    }

    func testDefaultBorderColor() {
        XCTAssertNil(view.borderColor, "There should be no border color by default")
    }

    func testBorderColorIsTiedToLayerStrokeColor() {
        view.borderColor = UIColor.orangeColor()
        XCTAssertEqual(UIColor(CGColor: layer.strokeColor!), UIColor.orangeColor(), "The view border color property should be tied to the underlying shape layer's border color")

        layer.strokeColor = UIColor.purpleColor().CGColor
        XCTAssertEqual(view.borderColor, UIColor.purpleColor(), "The view border color property should be tied to the underlying shape layer's border color")

        view.borderColor = nil
        XCTAssertNil(layer.strokeColor, "Clearing the view border color should clear the layer color")
    }

    func testChangingBorderColorSetsNeedsDisplayOnLayer() {
        layer.startSpyingOnSetNeedsDisplay()
        view.borderColor = UIColor.orangeColor()
        XCTAssertTrue(layer.setNeedsDisplayCalled, "Changing the view's border color should call `setNeedsDisplay()` on its layer")
        layer.stopSpyingOnSetNeedsDisplay()
    }

}

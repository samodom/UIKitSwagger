//
//  RGBComponentsReflectionTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 7/8/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

class RGBComponentsMirrorTests: XCTestCase {

    let components = Cyan.rgbComponents
    var mirror: Mirror!

    override func setUp() {
        super.setUp()

        mirror = RGBComponentsMirror(reflecting: components)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testReflectingComponents() {
        mirror = components.getMirror()
        XCTAssertTrue(mirror is RGBComponentsMirror, "The provided mirror should be the appropriate type")
    }

//    func testComponentsValueCaptured() {
//        XCTAssertEqual(mirror.value as! RGBComponents, components, "The provided components should be captured")
//    }

    func testComponentTypeReported() {
        XCTAssertEqual(mirror.subjectType, components.dynamicType, "The components type should be reported")
    }

    func testDisplayStyleIsStruct() {
        XCTAssertEqual(mirror.displayStyle!, .Struct, "The mirror should have struct display style")
    }

    func testNoIdentifierForMirror() {
        XCTAssertNil(mirror.objectIdentifier, "The mirror should not have an object identifier")
    }


    func testCountOfChildrenIsFour() {
        XCTAssertEqual(mirror.count, 4, "The mirror should reflect 4 children -- one for each of red, green, blue and alpha")
    }

    func testSubscriptZeroProvidesRedComponent() {
        XCTAssertEqual(mirror[0], ("Red", reflect(components.red)), "Subscript zero should provide the red component value")
    }

    func testSubscriptOneProvidesGreenComponent() {
        XCTAssertEqual(mirror[1], components.green, "Subscript one should provide the green component value")
    }

    func testSubscriptTwoProvidesBlueComponent() {
        XCTAssertEqual(mirror[2], components.blue, "Subscript two should provide the blue component value")
    }

    func testSubscriptThreeProvidesAlphaComponent() {
        XCTAssertEqual(mirror[3], components.alpha, "Subscript three should provide the alpha component value")
    }

    // obj id, dispo, count, subscript, summary, qlo
}

//
//  RGBComponentsMirrorTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 7/8/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

class RGBComponentsMirrorTests: XCTestCase {

    let components = Cyan.rgbComponents
    var mirror: MirrorType!
    
    override func setUp() {
        super.setUp()

        mirror = components.getMirror()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCreatingMirror() {

    }

}

//
//  ButtonStateConfigurationManagementTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 1/8/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ButtonStateConfigurationManagementTests: XCTestCase {

    var button = UIButton()
    var configuration: UIButtonStateConfiguration!
    let attributes = [NSForegroundColorAttributeName: Red,
        NSFontAttributeName: UIFont.systemFontOfSize(12)]

    let normalTitle = "Normal Title"
    var normalAttributedTitle: NSAttributedString!
    let normalImage = UIImage()
    let normalBackgroundImage = UIImage()

    override func setUp() {
        super.setUp()

        button.setTitle(normalTitle, forState: .Normal)
        normalAttributedTitle = NSAttributedString(string: "Attributed Title", attributes: attributes)
        button.setAttributedTitle(normalAttributedTitle, forState: .Normal)
        button.setTitleColor(Green, forState: .Normal)
        button.setTitleShadowColor(Purple, forState: .Normal)
        button.setImage(normalImage, forState: .Normal)
        button.setBackgroundImage(normalBackgroundImage, forState: .Normal)
    }
    
    override func tearDown() {
        super.tearDown()
    }

//    func testButtonHasCurrentConfiguration() {
//        configuration = button.currentConfiguration
//        XCTAssertEqual(configuration.title!, normalTitle, "The current configuration should provide the title for the current state")
//        XCTAssertEqual(configuration.attributedTitle!, normalAttributedTitle, "The current configuration should provide the attributed title for the current state")
//        XCTAssertEqual(configuration.titleColor!, Green, "The current configuration should provide the title color for the current state")
//        XCTAssertEqual(configuration.titleShadowColor!, Purple, "The current configuration should provide the title shadow color for the current state")
//        XCTAssertEqual(configuration.image!, normalImage, "The current configuration should provide the image for the current state")
//        XCTAssertEqual(configuration.backgroundImage!, normalBackgroundImage, "The current configuration should provide the background image for the current state")
//    }

}

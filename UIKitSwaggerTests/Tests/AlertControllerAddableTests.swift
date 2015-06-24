//
//  AlertControllerAddableTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/11/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
@testable import UIKitSwagger

class AlertControllerAddableTests: XCTestCase {

    let alertController = UIAlertController(title: "Alert", message: "Message", preferredStyle: .Alert)
    let actionSheetController = UIAlertController(title: "Alert Sheet", message: "Message", preferredStyle: .ActionSheet)

    var action1: UIAlertAction!
    var action2: UIAlertAction!
    var action3: UIAlertAction!

    var field1: UITextField?
    var field2: UITextField?
    var field3: UITextField?
    var configurationHandler1: UIAlertTextFieldConfigurationHandler!
    var configurationHandler2: UIAlertTextFieldConfigurationHandler!
    var configurationHandler3: UIAlertTextFieldConfigurationHandler!

    override func setUp() {
        super.setUp()

        action1 = UIAlertAction(title: "Action 1", style: .Default, handler: UIAlertActionHandler())
        action2 = UIAlertAction(title: "Action 2", style: .Destructive, handler: UIAlertActionHandler())
        action3 = UIAlertAction(title: "Action 3", style: .Cancel, handler: UIAlertActionHandler())

        configurationHandler1 = { self.field1 = $0 }
        configurationHandler2 = { self.field2 = $0 }
        configurationHandler3 = { self.field3 = $0 }
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testAddingAlertActionWithOperator() {
        alertController += action1
        XCTAssertEqual(alertController.actions, [action1], "The action should be added to the controller")

        actionSheetController += action2
        XCTAssertEqual(actionSheetController.actions, [action2], "The action should be added to the controller")
    }

    func testAddingAlertActionArrayWithOperator() {
        let actions = [action1, action2, action3] as [UIAlertAction]
        alertController += actions
        XCTAssertEqual(alertController.actions, actions, "The actions should be added in the provided order")

        actionSheetController += actions
        XCTAssertEqual(actionSheetController.actions, actions, "The actions should be added in the provided order")
    }

    func testAddingTextFieldWithOperator() {
        alertController += configurationHandler1
        XCTAssertNotNil(field1, "The configuration handler should be passed the text field")
        XCTAssertEqual(alertController.textFields!, [field1!], "The text field should be added to the controller using the configuration handler")
    }

    func testAddingTextFieldArrayWithOperator() {
        alertController += [configurationHandler1, configurationHandler2, configurationHandler3]
        XCTAssertNotNil(field1, "Each configuration handler should be passed a text field")
        XCTAssertNotNil(field2, "Each configuration handler should be passed a text field")
        XCTAssertNotNil(field3, "Each configuration handler should be passed a text field")
        XCTAssertEqual(alertController.textFields!, [field1!, field2!, field3!], "The text field should be added to the controller using the configuration handler")
    }

}

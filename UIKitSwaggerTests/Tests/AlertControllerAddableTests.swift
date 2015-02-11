//
//  AlertControllerAddableTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/11/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class AlertControllerAddableTests: XCTestCase {

    let alertController = UIAlertController(title: "Alert", message: "Message", preferredStyle: .Alert)
    let actionSheetController = UIAlertController(title: "Alert Sheet", message: "Message", preferredStyle: .ActionSheet)

    var action1: UIAlertAction!
    var action2: UIAlertAction!
    var action3: UIAlertAction!
    var genericActionHandler: UIAlertActionHandler!

    var field1: UITextField?
    var field2: UITextField?
    var field3: UITextField?
    var configurationHandler1: UIAlertTextFieldConfigurationHandler!
    var configurationHandler2: UIAlertTextFieldConfigurationHandler!
    var configurationHandler3: UIAlertTextFieldConfigurationHandler!

    override func setUp() {
        super.setUp()

        genericActionHandler = { (_: UIAlertAction!) -> Void in
        }
        action1 = UIAlertAction(title: "Action 1", style: .Default, handler: genericActionHandler)
        action2 = UIAlertAction(title: "Action 2", style: .Destructive, handler: genericActionHandler)
        action3 = UIAlertAction(title: "Action 3", style: .Cancel, handler: genericActionHandler)

        configurationHandler1 = { (field: UITextField!) -> Void in
            self.field1 = field
        }
        configurationHandler2 = { (field: UITextField!) -> Void in
            self.field2 = field
        }
        configurationHandler3 = { (field: UITextField!) -> Void in
            self.field3 = field
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testAddingAlertActionWithOperator() {
        alertController += action1
        XCTAssertEqual(alertController.actions as! [UIAlertAction], [action1], "The action should be added to the controller")

        actionSheetController += action2
        XCTAssertEqual(actionSheetController.actions as! [UIAlertAction], [action2], "The action should be added to the controller")
    }

    func testAddingAlertActionArrayWithOperator() {
        let actions = [action1, action2, action3] as [UIAlertAction]
        alertController += actions
        XCTAssertEqual(alertController.actions as! [UIAlertAction], actions, "The actions should be added in the provided order")

        actionSheetController += actions
        XCTAssertEqual(actionSheetController.actions as! [UIAlertAction], actions, "The actions should be added in the provided order")
    }

    func testAddingTextFieldWithOperator() {
        alertController += configurationHandler1
        XCTAssertTrue(field1 != nil, "The configuration handler should be passed the text field")
        XCTAssertEqual(alertController.textFields as! [UITextField], [field1!], "The text field should be added to the controller using the configuration handler")
    }

    func testAddingTextFieldArrayWithOperator() {
        alertController += [configurationHandler1, configurationHandler2, configurationHandler3]
        XCTAssertTrue(field1 != nil, "Each configuration handler should be passed a text field")
        XCTAssertTrue(field2 != nil, "Each configuration handler should be passed a text field")
        XCTAssertTrue(field3 != nil, "Each configuration handler should be passed a text field")
        XCTAssertEqual(alertController.textFields as! [UITextField], [field1!, field2!, field3!], "The text field should be added to the controller using the configuration handler")
    }

}

//
//  UIAlertControllerAdditionSyntax.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/11/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public typealias UIAlertTextFieldConfigurationHandler = (UITextField -> Void)?
public typealias UIAlertActionHandler = (UIAlertAction -> Void)?

/**
An operator used to add an alert action to an alert controller.
- parameter controller: Alert controller to add action to.
- parameter action: Alert action to add to the controller.
*/
public func +=(controller: UIAlertController, action: UIAlertAction) {
    controller.addAction(action)
}

/**
An operator used to add an array of alert actions to an alert controller.
- parameter controller: Alert controller to add actions to.
- parameter actions: Alert actions to add to the controller.
- note: The actions are added in the same order as they are provided in the array.
*/
public func +=(controller: UIAlertController, actions: [UIAlertAction]) {
    actions.forEach { controller += $0 }
}

/**
An operator used to add a text field to an alert controller using a configuration handler.
- parameter controller: Alert controller to add text field to.
- parameter textFieldConfigurationHandler: Configuration handler for a text field to add to the controller.
- warning: This is only allowed for alert controllers using the `Alert` style.  Attempting to add a text field to an `ActionSheet` style alert controller results in a failure.
*/
public func +=(controller: UIAlertController, textFieldConfigurationHandler: UIAlertTextFieldConfigurationHandler) {
    AssertAlertControllerCanAddTextFields(controller)
    controller.addTextFieldWithConfigurationHandler(textFieldConfigurationHandler)
}

/**
An operator used to add an array of text fields to an alert controller using configuration handlers.
- parameter controller: Alert controller to add text fields to.
- parameter textFieldConfigurationHandlers: Configuration handlers for text fields to add to the controller.
- note: The fields are added in the same order as they are provided in the array.
- warning: This is only allowed for alert controllers using the `Alert` style.  Attempting to add text fields to an `ActionSheet` style alert controller results in a failure.
*/
public func +=(controller: UIAlertController, textFieldConfigurationHandlers: [UIAlertTextFieldConfigurationHandler]) {
    AssertAlertControllerCanAddTextFields(controller)
    textFieldConfigurationHandlers.forEach { controller += $0 }
}

////////////////////////////////////////////////////////////////////////////////

private func AssertAlertControllerCanAddTextFields(controller: UIAlertController) {
    assert(controller.preferredStyle == .Alert, "Text fields cannot be added to an action sheet styled alert controller")
}

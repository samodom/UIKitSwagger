//
//  UIAlertControllerAdditionSyntax.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/11/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

public typealias UIAlertTextFieldConfigurationHandler = (UITextField!) -> Void
public typealias UIAlertActionHandler = (UIAlertAction!) -> Void

/**
  An operator used to add an alert action to an alert controller.
*/
public func +=(controller: UIAlertController, action: UIAlertAction) {
    controller.addAction(action)
}

/**
  An operator used to add an array of alert actions to an alert controller.
  The actions are added in the same order as they are provided in the array.
*/
public func +=(controller: UIAlertController, actions: [UIAlertAction]) {
    for action in actions {
        controller += action
    }
}

/**
  An operator used to add a text field to an alert controller using a configuration handler.
  This is only allowed for alert controllers using the `Alert` style.  Attempting to add a text field to an `ActionSheet` style alert controller results in a failure.
*/
public func +=(controller: UIAlertController, textFieldConfigurationHandler: UIAlertTextFieldConfigurationHandler) {
    AssertAlertControllerCanAddTextFields(controller)
    controller.addTextFieldWithConfigurationHandler(textFieldConfigurationHandler)
}

/**
  An operator used to add an array of text fields to an alert controller using configuration handlers.
  The fields are added in the same order as they are provided in the array.  This is only allowed for alert controllers using the `Alert` style.  Attempting to add text fields to an `ActionSheet` style alert controller results in a failure.
*/
public func +=(controller: UIAlertController, textFieldConfigurationHandlers: [UIAlertTextFieldConfigurationHandler]) {
    AssertAlertControllerCanAddTextFields(controller)
    for handler in textFieldConfigurationHandlers {
        controller += handler
    }
}

////////////////////////////////////////////////////////////////////////////////

private func AssertAlertControllerCanAddTextFields(controller: UIAlertController) {
    assert(controller.preferredStyle == .Alert, "Text fields cannot be added to an action sheet styled alert controller")
}

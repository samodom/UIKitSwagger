//
//  AlertAdditionSyntax.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/11/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
 Typealias to make alert controller text field configurations easier
 */
public typealias UIAlertTextFieldConfigurationHandler = UITextField -> Void

/**
 Typealias to make alert controller action configurations easier
 */
public typealias UIAlertActionHandler = UIAlertAction -> Void


/**
 An operator used to add an alert action to an alert controller.
 - Parameters:
   - controller: Alert controller to add action to.
   - action: Alert action to add to the controller.
 */
public func +=(controller: UIAlertController, action: UIAlertAction) {
    controller.addAction(action)
}


/**
 An operator used to add an array of alert actions to an alert controller.
 - Parameters:
   - controller: Alert controller to add actions to.
   - actions: Alert actions to add to the controller.
 - Note: The actions are added in the same order as they are provided in the array.
 */
public func +=(controller: UIAlertController, actions: [UIAlertAction]) {
    actions.forEach { controller += $0 }
}


/**
 An operator used to add a text field to an alert controller using a configuration handler.
 - Parameters:
   - controller: Alert controller to add text field to.
   - textFieldConfigurationHandler: Configuration handler for a text field to add to the controller.
 - Warning: This is only allowed for alert controllers using the `Alert` style.  Attempting to add a text field to an `ActionSheet` style alert controller results in a failure.
 */
public func +=(controller: UIAlertController, textFieldConfigurationHandler: UIAlertTextFieldConfigurationHandler) {
    AlertControllerCanAddTextFieldsPrecondition(controller)
    controller.addTextFieldWithConfigurationHandler(textFieldConfigurationHandler)
}


/**
 An operator used to add an array of text fields to an alert controller using configuration handlers.
 - Parameters:
   - controller: Alert controller to add text fields to.
   - textFieldConfigurationHandlers: Configuration handlers for text fields to add to the controller.
 - Note: The fields are added in the same order as they are provided in the array.
 - Warning: This is only allowed for alert controllers using the `Alert` style.  Attempting to add text fields to an `ActionSheet` style alert controller results in a failure.
 */
public func +=(controller: UIAlertController, textFieldConfigurationHandlers: [UIAlertTextFieldConfigurationHandler]) {
    AlertControllerCanAddTextFieldsPrecondition(controller)
    textFieldConfigurationHandlers.forEach { controller += $0 }
}


private func AlertControllerCanAddTextFieldsPrecondition(controller: UIAlertController) {
    precondition(
        controller.preferredStyle == .Alert,
        "Text fields cannot be added to an action sheet styled alert controller"
    )
}

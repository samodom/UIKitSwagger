//
//  UIButtonStateConfiguration.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 1/8/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit

/*!
    Type used to encapsulate the various configurable properties of a `UIButton`
*/
public struct UIButtonStateConfiguration {

    /*!
        Title property for a particular state of a `UIButton`.
        :discussion: This property corresponds to the title that is used in calls to `titleForState:` and `setTitle:forState:`.
    */
    public var title: String?

    /*!
        Attributed title property for a particular state of a `UIButton`.
        :discussion: This property corresponds to the attributed title that is used in calls to `attributedTitleForState:` and `setAttributedTitle:forState:`.
    */
    public var attributedTitle: NSAttributedString?

    /*!
        Title color property for a particular state of a `UIButton`.
        :discussion: This property corresponds to the title color that is used in calls to `titleColorForState:` and `setTitleColor:forState:`.
    */
    public var titleColor: UIColor?

    /*!
        Title shadow color property for a particular state of a `UIButton`.
        :discussion: This property corresponds to the title shadow color that is used in calls to `titleShadowColorForState:` and `setTitleShadowColor:forState:`.
    */
    public var titleShadowColor: UIColor?

    /*!
        Image property for a particular state of a `UIButton`.
        :discussion: This property corresponds to the image that is used in calls to `imageForState:` and `setImage:forState:`.
    */
    public var image: UIImage?

    /*!
        Background image property for a particular state of a `UIButton`.
        :discussion: This property corresponds to the image that is used in calls to `backgroundImageForState:` and `setBackgroundImage:forState:`.
    */
    public var backgroundImage: UIImage?

    public init() { }

}

extension UIButtonStateConfiguration: Equatable {

}

public func ==(lhs: UIButtonStateConfiguration, rhs: UIButtonStateConfiguration) -> Bool {
    return lhs.title == rhs.title &&
        lhs.attributedTitle == rhs.attributedTitle &&
        lhs.titleColor == rhs.titleColor &&
        lhs.titleShadowColor == rhs.titleShadowColor &&
        lhs.image == rhs.image &&
        lhs.backgroundImage == rhs.backgroundImage
}

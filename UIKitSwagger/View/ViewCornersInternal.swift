//
//  ViewCornersInternal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 5/2/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import Foundation

internal extension ViewCorners {

    internal var isSingleCorner: Bool {
        return [1, 2, 4, 8].contains(self.rawValue)
    }

    internal var asUIRectCorner: UIRectCorner {
        if self == .All {
            return UIRectCorner.AllCorners
        }
        else {
            return UIRectCorner(rawValue: rawValue)
        }
    }

}

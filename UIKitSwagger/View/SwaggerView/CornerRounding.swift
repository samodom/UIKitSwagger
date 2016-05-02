//
//  CornerRounding.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/25/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

public extension SwaggerView {

    @IBInspectable internal var roundTopLeftCorner: Bool {
        get {
            return cornerIsRounded(.TopLeft)
        }
        set {
            setCornerRoundingFlag(newValue, forCorner: .TopLeft)
        }
    }

    @IBInspectable internal var roundTopRightCorner: Bool {
        get {
            return cornerIsRounded(.TopRight)
        }
        set {
            setCornerRoundingFlag(newValue, forCorner: .TopRight)
        }
    }

    @IBInspectable internal var roundBottomLeftCorner: Bool {
        get {
            return cornerIsRounded(.BottomLeft)
        }
        set {
            setCornerRoundingFlag(newValue, forCorner: .BottomLeft)
        }
    }

    @IBInspectable internal var roundBottomRightCorner: Bool {
        get {
            return cornerIsRounded(.BottomRight)
        }
        set {
            setCornerRoundingFlag(newValue, forCorner: .BottomRight)
        }
    }

    private func cornerIsRounded(corner: ViewCorners) -> Bool {
        precondition(corner.isSingleCorner)
        return roundedCorners.contains(corner)
    }

    private func setCornerRoundingFlag(flag: Bool, forCorner corner: ViewCorners) {
        precondition(corner.isSingleCorner)

        if roundedCorners.contains(corner) {
            roundedCorners.remove(corner)
        }
        else {
            roundedCorners.insert(corner)
        }
    }

}

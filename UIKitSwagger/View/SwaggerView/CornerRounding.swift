//
//  CornerRounding.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/25/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

public extension SwaggerView {

    @IBInspectable internal var topLeftCornerRounded: Bool {
        get {
            return cornerIsRounded(.TopLeft)
        }
        set {
            setCornerRoundingFlag(newValue, forCorner: .TopLeft)
        }
    }

    @IBInspectable internal var topRightCornerRounded: Bool {
        get {
            return cornerIsRounded(.TopRight)
        }
        set {
            setCornerRoundingFlag(newValue, forCorner: .TopRight)
        }
    }

    @IBInspectable internal var bottomLeftCornerRounded: Bool {
        get {
            return cornerIsRounded(.BottomLeft)
        }
        set {
            setCornerRoundingFlag(newValue, forCorner: .BottomLeft)
        }
    }

    @IBInspectable internal var bottomRightCornerRounded: Bool {
        get {
            return cornerIsRounded(.BottomRight)
        }
        set {
            setCornerRoundingFlag(newValue, forCorner: .BottomRight)
        }
    }

    private func cornerIsRounded(corner: UIRectCorner) -> Bool {
        corner.assertSingleCorner()
        return roundedCorners.contains(corner)
    }

    private func setCornerRoundingFlag(flag: Bool, forCorner corner: UIRectCorner) {
        corner.assertSingleCorner()

        if roundedCorners.contains(corner) {
            roundedCorners.remove(corner)
        }
        else {
            roundedCorners.insert(corner)
        }
    }

}


private extension UIRectCorner {

    private func assertSingleCorner() {
        assert(rawValue % 2 == 0 || rawValue == 1)
    }

}


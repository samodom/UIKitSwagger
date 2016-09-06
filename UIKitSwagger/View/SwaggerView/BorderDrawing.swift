//
//  BorderDrawing.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 5/2/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

public extension SwaggerView {

    @IBInspectable
    public var borderWidth: CGFloat {
        get {
            return shapeLayer.lineWidth
        }
        set {
            shapeLayer.lineWidth = newValue
//            updateMasksToBounds()
            shapeLayer.setNeedsDisplay()
        }
    }

    @IBInspectable
    public var borderColor: UIColor? {
        get {
            guard let color = shapeLayer.strokeColor else {
                return nil
            }

            return UIColor(CGColor: color)
        }
        set {
            shapeLayer.strokeColor = newValue?.CGColor
            shapeLayer.setNeedsDisplay()
        }
    }

}

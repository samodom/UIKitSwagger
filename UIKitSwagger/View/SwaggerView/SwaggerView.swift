//
//  SwaggerView.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/25/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

@IBDesignable
public class SwaggerView: UIView {

    override public init(frame: CGRect) {
        super.init(frame: frame)
        performCommonInitialization()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        performCommonInitialization()
    }

    private func performCommonInitialization() {
        backgroundColor = nil
    }


    override public class func layerClass() -> AnyClass {
        return CAShapeLayer.self
    }

    internal var shapeLayer: CAShapeLayer {
        return layer as! CAShapeLayer
    }


    override public var backgroundColor: UIColor? {
        get {
            guard let color = shapeLayer.fillColor else {
                return nil
            }

            return UIColor(CGColor: color)
        }
        set {
            shapeLayer.fillColor = newValue?.CGColor
        }
    }


    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            updateLayerPath()
        }
    }

    public var roundedCorners = ViewCorners.None {
        didSet {
            updateLayerPath()
        }
    }

}

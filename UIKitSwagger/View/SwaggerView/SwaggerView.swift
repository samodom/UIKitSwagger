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
        print(coder.)
        super.init(coder: coder)
        performCommonInitialization()
    }

    private func performCommonInitialization() {
//        backgroundColor = nil
//        clipsToBounds = false
//        layer.masksToBounds = false
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
            updateLayer()
        }
    }

    public var roundedCorners = ViewCorners.None {
        didSet {
            updateLayer()
        }
    }

    override public var opaque: Bool {
        get {
            return false
        }
        set {}
    }

}

//internal extension SwaggerView {
//
//    @IBInspectable
//    internal var masksToBounds: Bool {
//        get {
//            return layer.masksToBounds
//        }
//        set {
//            layer.masksToBounds = newValue
//        }
//    }
//
//}
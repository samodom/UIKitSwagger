//
//  SwaggerViewLayer.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 5/2/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

internal extension SwaggerView {

    internal func updateLayer() {
        updateLayerPath()
//        updateOpacity()
//        updateMasksToBounds()
    }

    private func updateLayerPath() {
        let shapeLayer = layer as! CAShapeLayer
        shapeLayer.path = border.CGPath
    }

    private var border: UIBezierPath {
        return UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: roundedCorners.asUIRectCorner,
            cornerRadii: cornerRadii
        )
    }

    private var cornerRadii: CGSize {
        return CGSize(width: cornerRadius, height: cornerRadius)
    }

//    private func updateOpacity() {
////        opaque = !cornersAreRounded
//    }
//
    private var cornersAreRounded: Bool {
        return cornerRadius != 0.0 && roundedCorners != .None
    }

//    internal func updateMasksToBounds() {
////        layer.masksToBounds = false
//    }

}

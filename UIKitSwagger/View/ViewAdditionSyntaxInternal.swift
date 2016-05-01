//
//  ViewAdditionSyntaxInternal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 5/1/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import UIKit

internal func groupAddables(addables: [UIViewAddable]) -> [UIViewAddable] {

    var views = [UIViewAddable]()
    var guides = [UIViewAddable]()
    var effects = [UIViewAddable]()
    var recognizers = [UIViewAddable]()

    addables.forEach { addable in

        if #available(iOS 9.0, *) {
            if let guide = addable as? UILayoutGuide {
                guides.append(guide)
                return
            }
        }

        switch addable {
        case let view as UIView:
            views.append(view)

        case let effect as UIMotionEffect:
            effects.append(effect)

        case let recognizer as UIGestureRecognizer:
            recognizers.append(recognizer)

        default:
            break
        }
    }

    return [views, guides, effects, recognizers].flatMap { $0 }
}

internal func groupRemovables(removables: [UIViewRemovable]) -> [UIViewRemovable] {
    return groupAddables(removables).reverse()
}

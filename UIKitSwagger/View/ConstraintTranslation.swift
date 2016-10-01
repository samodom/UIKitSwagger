//
//  ConstraintTranslation.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 9/30/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element: UIView {

    public func setTranslatesAutoresizingMaskIntoConstraints(_ shouldTranslate: Bool) {
        forEach { $0.translatesAutoresizingMaskIntoConstraints = shouldTranslate }
    }

}

//
//  UIViewState.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 1/11/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit

public protocol UIViewState: Equatable {
    func defaultState() -> Self?
}

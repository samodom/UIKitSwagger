//
//  ColorTable.swift
//  UIKitSwaggerPlaygounds
//
//  Created by Sam Odom on 9/14/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKitSwagger

public func ColorTable() -> UIStackView {
    let squares = ColorPalette(colors: ColorAliases).allColors.map {
        ColorSquare.init(withColor: $1, named: $0)
    }

    let row1 = StackHorizontally(squares[0 ..< 5], distribution: .FillEqually)
    let row2 = StackHorizontally(squares[5 ..< 10], distribution: .FillEqually)
    let row3 = StackHorizontally(squares[10 ..< 15], distribution: .FillEqually)

    let stack = StackVertically([row1, row2, row3])
    stack.distribution = .FillEqually
    stack.frame = CGRect(origin: CGPointZero, size: ColorTableSize)

    return stack
}

let ColorTableSize = CGSize(width: 500, height: 300)

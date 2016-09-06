//
//  ColorSquare.swift
//  UIKitSwaggerPlaygounds
//
//  Created by Sam Odom on 9/14/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKitSwagger

public class ColorSquare: UIView {

    private let label = UILabel()

    public init(withColor color: UIColor, named name: String) {
        super.init(frame: CGRectZero)
        addSubview(label)

        backgroundColor = color
        DoNotTranslateMasks(self, label)

        layoutLabel()
        decorateLabel(withText: name, colored: color)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func decorateLabel(withText text: String, colored color: UIColor)  {
        label.textAlignment = .Center
        label.text = text
        label.textColor = color.white > 0.5 ? Black : White
    }

    private func layoutLabel() {
        AlignLeading(self, label)
        AlignTrailing(self, label)
        (label.centerY =* centerY).activate()
    }

}

//private let ColorSquareSize = CGSize(width: 100, height: 100)

//
//  StackViewSyntax.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 7/7/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

/**
Convenience method for creating horizontal stack views.
- parameter views: Arranged subviews to add to the stack view.
- parameter alignment: Alignment of arranged subviews along layout axis.  Default value is .Fill.
- parameter distribution: Distribution of arranged subviews along layout axis.  Default value is .Fill.
- parameter spacing: Spacing between arranged subviews for distribution along layout axis.  Default value is 0.0.
- returns: The stack view that was created and configured according to the provided parameters.
*/
@available(iOS 9.0, *)
public func StackHorizontally<S: SequenceType where S.Generator.Element: UIView>(views: S, alignment: UIStackViewAlignment = .Fill, distribution: UIStackViewDistribution = .Fill,
    spacing: CGFloat = 0.0) -> UIStackView {
        return CreateStackView(views, axis: .Horizontal, alignment: alignment, distribution: distribution, spacing: spacing)
}

/**
Convenience method for creating vertical stack views.
- parameter views: Arranged subviews to add to the stack view.
- parameter alignment: Alignment of arranged subviews along layout axis.  Default value is .Fill.
- parameter distribution: Distribution of arranged subviews along layout axis.  Default value is .Fill.
- parameter spacing: Spacing between arranged subviews for distribution along layout axis.  Default value is 0.0.
- returns: The stack view that was created and configured according to the provided parameters.
*/
@available(iOS 9.0, *)
public func StackVertically<S: SequenceType where S.Generator.Element: UIView>(views: S, alignment: UIStackViewAlignment = .Fill, distribution: UIStackViewDistribution = .Fill,
    spacing: CGFloat = 0.0) -> UIStackView {
        return CreateStackView(views, axis: .Vertical, alignment: alignment, distribution: distribution, spacing: spacing)
}

@available(iOS 9.0, *)
private func CreateStackView<S: SequenceType where S.Generator.Element: UIView>(views: S, axis: UILayoutConstraintAxis, alignment: UIStackViewAlignment = .Fill, distribution: UIStackViewDistribution = .Fill, spacing: CGFloat = 0.0) -> UIStackView {
    let stackView = UIStackView(arrangedSubviews: Array(views))
    stackView.axis = axis
    stackView.alignment = alignment
    stackView.distribution = distribution
    stackView.spacing = spacing
    return stackView
}

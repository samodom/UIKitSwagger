//
//  AutoLayoutInternal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit


//  MARK: Dimensions and aspect ratio

internal func AssertDimensionItemCount(count: Int) {
    assert(count > 1, "Multiple views are required for constraining dimensions")
}

private func AssertDimensionAttribute(attribute: NSLayoutAttribute) {
    assert(attribute == .Width || attribute == .Height)
}

internal func ConstrainDimension(items: [AutoLayoutAttributable], dimension: NSLayoutAttribute) -> [Constraint] {
    AssertDimensionItemCount(items.count)
    AssertDimensionAttribute(dimension)

    return ConstrainItemsToFirst(items, dimension)
}

//  MARK: Alignment

internal func AssertAlignmentItemCount(count: Int) {
    assert(count > 1, "Multiple views are required for alignment")
}

private let validAlignmentAttributes: [NSLayoutAttribute] = [.Left, .Right, .Top, .Bottom, .CenterX, .CenterY, .Baseline]

private func AssertAlignmentAttribute(attribute: NSLayoutAttribute) {
    assert(contains(validAlignmentAttributes, attribute))
}

internal func AlignItems(items: [AutoLayoutAttributable], attribute: NSLayoutAttribute) -> [Constraint] {
    AssertAlignmentItemCount(items.count)
    AssertAlignmentAttribute(attribute)

    return ConstrainItemsToFirst(items, attribute)
}


//  MARK: Distribution and spacing

internal func AssertDistributionItemCount(count: Int) {
    assert(count > 1, "Multiple views are required for distribution")
}

internal func DistributeViews(views: [UIView], spacing: CGFloat, direction: DistributionDirection)  -> [Constraint] {
    AssertDistributionItemCount(views.count)

    let attributes = direction.attributePair()
    var constraints = [Constraint]()
    var firstItem: AutoLayoutAttributedItem
    var secondView = views[0]
    var secondItem = secondView.attributedItemForLayoutAttribute(attributes.1)

    for view in views[1..<views.endIndex] {
        firstItem = view.attributedItemForLayoutAttribute(attributes.0)
        let constraint = firstItem =* secondItem + spacing
        constraints.append(constraint)
        constraint.apply()
        secondItem = view.attributedItemForLayoutAttribute(attributes.1)
    }

    return constraints
}

internal enum DistributionDirection {
    case LeftToRight
    case LeadingToTrailing
    case TopToBottom

    private func attributePair() -> (NSLayoutAttribute, NSLayoutAttribute) {
        switch self {
        case .LeftToRight:
            return (.Left, .Right)

        case .LeadingToTrailing:
            return (.Leading, .Trailing)

        case .TopToBottom:
            return (.Top, .Bottom)
        }
    }
}


//  MARK: Common

private func AssertLayoutItemCount(count: Int) {
    assert(count > 1, "Multiple layout items are required for creating constraints")
}

private func ConstrainItemsToFirst(items: [AutoLayoutAttributable], attribute: NSLayoutAttribute) -> [Constraint] {
    AssertLayoutItemCount(items.count)

    var constraints = [Constraint]()
    let secondItem = items.first!.attributedItemForLayoutAttribute(attribute)
    for attributable in items[1..<items.endIndex] {
        let firstItem = attributable.attributedItemForLayoutAttribute(attribute)
        let constraint = firstItem =* secondItem
        constraints.append(constraint)
        constraint.apply()
    }
    
    return constraints
}

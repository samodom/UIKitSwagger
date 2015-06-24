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

internal func ConstrainDimension(items: [AutoLayoutAttributable], dimension: NSLayoutAttribute, value: CGFloat) -> [NSLayoutConstraint] {
    AssertDimensionAttribute(dimension)

    let constraints = items.map { ($0 as! AnyObject, dimension) =* value }
    ApplyConstraints(constraints)
    return constraints
}

internal func ConstrainDimension(items: [AutoLayoutAttributable], dimension: NSLayoutAttribute, interval: ClosedInterval<CGFloat>) -> [NSLayoutConstraint] {
    AssertDimensionAttribute(dimension)

    let constraints = items.flatMap { (item) -> [NSLayoutConstraint] in
        let attributedItem = AutoLayoutAttributedItem(item as! AnyObject, dimension)
        return [attributedItem >=* interval.start, attributedItem <=* interval.end]
    }

    ApplyConstraints(constraints)
    return constraints
}


internal func MatchDimension(items: [AutoLayoutAttributable], dimension: NSLayoutAttribute) -> [NSLayoutConstraint] {
    AssertDimensionItemCount(items.count)
    AssertDimensionAttribute(dimension)

    return ConstrainItemsToFirst(items, attribute: dimension)
}

//  MARK: Alignment

internal func AssertAlignmentItemCount(count: Int) {
    assert(count > 1, "Multiple views are required for alignment")
}

private let validAlignmentAttributes: Set<NSLayoutAttribute> = [
    .Left,
    .Leading,
    .Right,
    .Trailing,
    .Top,
    .Bottom,
    .CenterX,
    .CenterY,
    .Baseline
]

private func AssertAlignmentAttribute(attribute: NSLayoutAttribute) {
    assert(validAlignmentAttributes.contains(attribute))
}

internal func AlignItems(items: [AutoLayoutAttributable], attribute: NSLayoutAttribute) -> [NSLayoutConstraint] {
    AssertAlignmentItemCount(items.count)
    AssertAlignmentAttribute(attribute)

    return ConstrainItemsToFirst(items, attribute: attribute)
}


//  MARK: Distribution and spacing

internal func AssertDistributionItemCount(count: Int) {
    assert(count > 1, "Multiple views are required for distribution")
}

internal func DistributeViews(views: [UIView], spacing: CGFloat, direction: DistributionDirection)  -> [NSLayoutConstraint] {
    AssertDistributionItemCount(views.count)

    let attributes = direction.attributePair()
    var constraints = [NSLayoutConstraint]()
    var anchor: AutoLayoutAttributedItem
    var item = views.first!.attributedItemForLayoutAttribute(attributes.1)

    for view in views[1..<views.endIndex] {
        anchor = view.attributedItemForLayoutAttribute(attributes.0)
        let constraint = anchor =* item + spacing
        constraints.append(constraint)
        constraint.apply()
        item = view.attributedItemForLayoutAttribute(attributes.1)
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

private func ConstrainItemsToFirst(items: [AutoLayoutAttributable], attribute: NSLayoutAttribute) -> [NSLayoutConstraint] {
    AssertLayoutItemCount(items.count)

    var constraints = [NSLayoutConstraint]()
    let anchor = items.first!.attributedItemForLayoutAttribute(attribute)
    for attributable in items[1..<items.endIndex] {
        let item = attributable.attributedItemForLayoutAttribute(attribute)
        let constraint = item =* anchor
        constraints.append(constraint)
        constraint.apply()
    }
    
    return constraints
}

//
//  AutoLayoutInternal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit


//  MARK: Dimensions and aspect ratio

private func AssertDimensionItemCount(count: Int) {
    assert(count > 1, "Multiple views are required for constraining dimensions")
}

private func AssertDimensionAttribute(attribute: NSLayoutAttribute) {
    assert(attribute == .Width || attribute == .Height)
}

internal func ConstrainDimension(items: [AutoLayoutAttributable], dimension: NSLayoutAttribute, value: CGFloat) -> [NSLayoutConstraint] {
    AssertDimensionAttribute(dimension)

    let constraints = items.map { ($0 as! AnyObject, dimension) =* value }
    ActivateConstraints(constraints)
    return constraints
}

internal func ConstrainDimension(items: [AutoLayoutAttributable], dimension: NSLayoutAttribute, interval: ClosedInterval<CGFloat>) -> [NSLayoutConstraint] {
    AssertDimensionAttribute(dimension)

    let constraints = items.flatMap { (item) -> [NSLayoutConstraint] in
        let attributedItem = AutoLayoutAttributedItem(item as! AnyObject, dimension)
        return [attributedItem >=* interval.start, attributedItem <=* interval.end]
    }

    ActivateConstraints(constraints)
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

internal func DistributeViews(views: [UIView], spacing: CGFloat, direction: LayoutDirection)  -> [NSLayoutConstraint] {
    AssertDistributionItemCount(views.count)

    let attributes = direction.attributePair
    let pairs = zip(views.dropLast(), views.dropFirst())

    return pairs.map {
        let dependent = $0.1.attributedItemForLayoutAttribute(attributes.0)
        let independent = $0.0.attributedItemForLayoutAttribute(attributes.1)
        let constraint = dependent =* independent + spacing
        constraint.activate()
        return constraint
    }
}


//  MARK: Common

private func AssertLayoutItemCount(count: Int) {
    assert(count > 1, "Multiple layout items are required for creating constraints")
}

private func ConstrainItemsToFirst(items: [AutoLayoutAttributable], attribute: NSLayoutAttribute) -> [NSLayoutConstraint] {
    AssertLayoutItemCount(items.count)
    let dependent = items.first!.attributedItemForLayoutAttribute(attribute)

    return items.dropFirst().map {
        let independent = $0.attributedItemForLayoutAttribute(attribute)
        let constraint = dependent =* independent
        constraint.activate()
        return constraint
    }
}

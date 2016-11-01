//
//  AutoLayoutInternal.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/28/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit


//  MARK: Dimensions and aspect ratio

fileprivate func AssertDimensionItemCount(_ count: Int) {
    assert(count > 1, "Multiple views are required for constraining dimensions")
}

fileprivate func AssertDimensionAttribute(_ attribute: NSLayoutAttribute) {
    assert(attribute == .width || attribute == .height)
}

func ConstrainItemsInDimension(items: [AutoLayoutAttributable], dimension: NSLayoutAttribute, value: CGFloat) -> [NSLayoutConstraint] {
    AssertDimensionAttribute(dimension)

    let constraints = items.map { ($0 as AnyObject, dimension) =* value }
    constraints.activate()
    return constraints
}

func ConstrainItemsInDimension(items: [AutoLayoutAttributable], dimension: NSLayoutAttribute, range: ClosedRange<CGFloat>) -> [NSLayoutConstraint] {
    AssertDimensionAttribute(dimension)

    let constraints = items.flatMap { (item) -> [NSLayoutConstraint] in
        let attributedItem = AutoLayoutAttributedItem(item as AnyObject, dimension)
        return [attributedItem >=* range.lowerBound, attributedItem <=* range.upperBound]
    }

    constraints.activate()
    return constraints
}


func MatchDimension(items: [AutoLayoutAttributable], dimension: NSLayoutAttribute) -> [NSLayoutConstraint] {
    AssertDimensionItemCount(items.count)
    AssertDimensionAttribute(dimension)

    return ConstrainItemsToFirst(items: items, attribute: dimension)
}

//  MARK: Alignment

func AssertAlignmentItemCount(_ count: Int) {
    assert(count > 1, "Multiple views are required for alignment")
}

fileprivate let validAlignmentAttributes: Set<NSLayoutAttribute> = [
    .left,
    .leading,
    .right,
    .trailing,
    .top,
    .bottom,
    .centerX,
    .centerY,
    .lastBaseline
]

fileprivate func AssertAlignmentAttribute(_ attribute: NSLayoutAttribute) {
    assert(validAlignmentAttributes.contains(attribute))
}

func AlignItems(items: [AutoLayoutAttributable], attribute: NSLayoutAttribute) -> [NSLayoutConstraint] {
    AssertAlignmentItemCount(items.count)
    AssertAlignmentAttribute(attribute)

    return ConstrainItemsToFirst(items: items, attribute: attribute)
}


//  MARK: Distribution and spacing

func AssertDistributionItemCount(_ count: Int) {
    assert(count > 1, "Multiple views are required for distribution")
}

func DistributeItems(items: [UIView], spacing: CGFloat, direction: LayoutDirection)  -> [NSLayoutConstraint] {
    AssertDistributionItemCount(items.count)

    let attributes = direction.attributePair
    let pairs = zip(items.dropLast(), items.dropFirst())

    return pairs.map {
        let dependent = $0.1.attributedItemForLayoutAttribute(attributes.0)
        let independent = $0.0.attributedItemForLayoutAttribute(attributes.1)
        let constraint = dependent =* (independent + spacing)
        constraint.activate()
        return constraint
    }
}


//  MARK: Common

fileprivate func AssertLayoutItemCount(_ count: Int) {
    assert(count > 1, "Multiple layout items are required for creating constraints")
}

fileprivate func ConstrainItemsToFirst(items: [AutoLayoutAttributable], attribute: NSLayoutAttribute) -> [NSLayoutConstraint] {
    AssertLayoutItemCount(items.count)
    let dependent = items.first!.attributedItemForLayoutAttribute(attribute)

    return items.dropFirst().map {
        let independent = $0.attributedItemForLayoutAttribute(attribute)
        let constraint = dependent =* independent
        constraint.activate()
        return constraint
    }
}

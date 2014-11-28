//
//  AutoLayoutViewAlignment.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 11/27/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit

/**
  Convenience method for aligning two or more items by their left attribute.
  @param        items Two or more items that are to be left-aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignLeft(items: AutoLayoutAttributable...) {
    AlignLeft(items)
}

/**
  Convenience method for aligning an array of items by their left attribute.
  @param        items Array of two or more items that are to be left-aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignLeft(items: [AutoLayoutAttributable]) {
    AlignItems(items, .Left)
}

/**
  Convenience method for aligning two or more items by their right attribute.
  @param        items Two or more items that are to be right-aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignRight(items: AutoLayoutAttributable...) {
    AlignRight(items)
}

/**
  Convenience method for aligning an array of items by their right attribute.
  @param        items Array of two or more items that are to be right-aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignRight(items: [AutoLayoutAttributable]) {
    AlignItems(items, .Right)
}

/**
  Convenience method for aligning two or more items by their top attribute.
  @param        items Two or more items that are to be top-aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignTop(items: AutoLayoutAttributable...) {
    AlignTop(items)
}

/**
  Convenience method for aligning an array of items by their top attribute.
  @param        items Array of two or more items that are to be top-aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignTop(items: [AutoLayoutAttributable]) {
    AlignItems(items, .Top)
}

/**
  Convenience method for aligning two or more items by their bottom attribute.
  @param        items Two or more items that are to be bottom-aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignBottom(items: AutoLayoutAttributable...) {
    AlignBottom(items)
}

/**
  Convenience method for aligning an array of items by their bottom attribute.
  @param        items Array of two or more items that are to be bottom-aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignBottom(items: [AutoLayoutAttributable]) {
    AlignItems(items, .Bottom)
}

/**
  Convenience method for horizontally aligning two or more items.
  @param        items Two or more items that are to be horizontally aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignHorizontally(items: AutoLayoutAttributable...) {
    AlignHorizontally(items)
}

/**
  Convenience method for horizontally aligning an array of items.
  @param        items Array of two or more items that are to be horizontally aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignHorizontally(items: [AutoLayoutAttributable]) {
    AlignItems(items, .CenterX)
}

/**
  Convenience method for vertically aligning two or more items.
  @param        items Two or more items that are to be vertically aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignVertically(items: AutoLayoutAttributable...) {
    AlignVertically(items)
}

/**
  Convenience method for vertically aligning an array of items.
  @param        items Array of two or more items that are to be vertically aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignVertically(items: [AutoLayoutAttributable]) {
    AlignItems(items, .CenterY)
}

/**
  Convenience method for horizontally and vertically aligning two or more items.
  @param        items Two or more items that are to be horizontally and vertically aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignCenters(items: AutoLayoutAttributable...) {
    AlignCenters(items)
}

/**
  Convenience method for horizontally and vertically aligning an array of items.
  @param        items Array of two or more items that are to be horizontally and vertically aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignCenters(items: [AutoLayoutAttributable]) {
    AlignItems(items, .CenterX)
    AlignItems(items, .CenterY)
}

/**
  Convenience method for aligning two or more items by their baseline attribute.
  @param        items Two or more items that are to be baseline-aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignBaselines(items: AutoLayoutAttributable...) {
    AlignBaselines(items)
}

/**
  Convenience method for aligning an array of items by their baseline attribute.
  @param        items Array of two or more items that are to be baseline-aligned.
  @discussion   The layout constraints created by this function are applied to the appropriate view.  If fewer than two items are provided, an error is thrown.
*/
public func AlignBaselines(items: [AutoLayoutAttributable]) {
    AlignItems(items, .Baseline)
}



private func AlignItems(items: [AutoLayoutAttributable], attribute: NSLayoutAttribute) {
    AssertAlignmentItemCount(items.count)

    let firstItem = items.first!.attributedItemForLayoutAttribute(attribute)
    for item in items[1..<items.endIndex] {
        let attributedItem = item.attributedItemForLayoutAttribute(attribute)
        (attributedItem =* firstItem).apply()
    }
}

private func AssertAlignmentItemCount(count: Int) {
    assert(count > 1, "Multiple views are required for alignment")
}

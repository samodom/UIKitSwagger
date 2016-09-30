//
//  ViewFillingTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 10/10/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import XCTest
@testable import UIKitSwagger

class ViewFillingTests: XCTestCase {
    
    var superview = UIView()
    let subview = UIView()
    var returnedConstraints: [NSLayoutConstraint]!

    override func setUp() {
        super.setUp()

        superview.addSubview(subview)
    }

    //  MARK: Default directions

    func testCannotFillViewWithoutSuperview() {
        returnedConstraints = superview.fillSuperview()
        assertFillingConstraintCount(0)
        XCTAssertEqual(superview.constraints.count, 0, "No constraints should be activated")
    }

    func testFillingSuperviewUsingDefaults() {
        returnedConstraints = subview.fillSuperview()
        assertSuperviewFilledWithIdiom(.lingual)
    }

    func testFillingSuperviewInMarginsUsingDefaults() {
        returnedConstraints = subview.fillSuperview(inMargins: true)
        assertSuperviewFilledWithIdiom(.lingual, inMargins: true)
    }

    //  MARK: Single directions

    func testFillingSuperviewUsingLeadingToTrailingDirection() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leadingToTrailing])
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.leading)
        assertSubviewConstrainedToSuperviewEdge(.trailing)
    }

    func testFillingSuperviewUsingTrailingToLeadingDirection() {
        returnedConstraints = subview.fillSuperview(inDirections: [.trailingToLeading])
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.leading)
        assertSubviewConstrainedToSuperviewEdge(.trailing)
    }

    func testFillingSuperviewUsingLeftToRightDirection() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leftToRight])
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.left)
        assertSubviewConstrainedToSuperviewEdge(.right)
    }

    func testFillingSuperviewUsingRightToLeftDirection() {
        returnedConstraints = subview.fillSuperview(inDirections: [.rightToLeft])
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.left)
        assertSubviewConstrainedToSuperviewEdge(.right)
    }

    func testFillingSuperviewUsingTopToBottomDirection() {
        returnedConstraints = subview.fillSuperview(inDirections: [.topToBottom])
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.top)
        assertSubviewConstrainedToSuperviewEdge(.bottom)
    }

    func testFillingSuperviewUsingBottomToTopDirection() {
        returnedConstraints = subview.fillSuperview(inDirections: [.bottomToTop])
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.top)
        assertSubviewConstrainedToSuperviewEdge(.bottom)
    }

    //  MARK: Single directions in margins

    func testFillingSuperviewUsingLeadingToTrailingDirectionInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leadingToTrailing], inMargins: true)
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.leading, usingMargins: true)
        assertSubviewConstrainedToSuperviewEdge(.trailing, usingMargins: true)
    }

    func testFillingSuperviewUsingTrailingToLeadingDirectionInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.trailingToLeading], inMargins: true)
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.leading, usingMargins: true)
        assertSubviewConstrainedToSuperviewEdge(.trailing, usingMargins: true)
    }

    func testFillingSuperviewUsingLeftToRightDirectionInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leftToRight], inMargins: true)
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.left, usingMargins: true)
        assertSubviewConstrainedToSuperviewEdge(.right, usingMargins: true)
    }

    func testFillingSuperviewUsingRightToLeftDirectionInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.rightToLeft], inMargins: true)
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.left, usingMargins: true)
        assertSubviewConstrainedToSuperviewEdge(.right, usingMargins: true)
    }

    func testFillingSuperviewUsingTopToBottomDirectionInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.topToBottom], inMargins: true)
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.top, usingMargins: true)
        assertSubviewConstrainedToSuperviewEdge(.bottom, usingMargins: true)
    }

    func testFillingSuperviewUsingBottomToTopDirectionInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.bottomToTop], inMargins: true)
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.top, usingMargins: true)
        assertSubviewConstrainedToSuperviewEdge(.bottom, usingMargins: true)
    }

    //  MARK: Double directions

    func testFillingSuperviewUsingLeadingToTrailingAndTopToBottom() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leadingToTrailing, .topToBottom])
        assertSuperviewFilledWithIdiom(.lingual)
    }

    func testFillingSuperviewUsingTrailingToLeadingAndTopToBottom() {
        returnedConstraints = subview.fillSuperview(inDirections: [.trailingToLeading, .topToBottom])
        assertSuperviewFilledWithIdiom(.lingual)
    }

    func testFillingSuperviewUsingLeadingToTrailingAndBottomToTop() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leadingToTrailing, .bottomToTop])
        assertSuperviewFilledWithIdiom(.lingual)
    }

    func testFillingSuperviewUsingTrailingToLeadingAndBottomToTop() {
        returnedConstraints = subview.fillSuperview(inDirections: [.trailingToLeading, .bottomToTop])
        assertSuperviewFilledWithIdiom(.lingual)
    }

    func testFillingSuperviewUsingLeftToRightAndTopToBottom() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leftToRight, .topToBottom])
        assertSuperviewFilledWithIdiom(.geometric)
    }

    func testFillingSuperviewUsingRightToLeftAndTopToBottom() {
        returnedConstraints = subview.fillSuperview(inDirections: [.rightToLeft, .topToBottom])
        assertSuperviewFilledWithIdiom(.geometric)
    }

    func testFillingSuperviewUsingLeftToRightAndBottomToTop() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leftToRight, .topToBottom])
        assertSuperviewFilledWithIdiom(.geometric)
    }

    func testFillingSuperviewUsingRightToLeftAndBottomToTop() {
        returnedConstraints = subview.fillSuperview(inDirections: [.rightToLeft, .topToBottom])
        assertSuperviewFilledWithIdiom(.geometric)
    }

    //  MARK: Double directions in margins

    func testFillingSuperviewUsingLeadingToTrailingAndTopToBottomInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leadingToTrailing, .topToBottom], inMargins: true)
        assertSuperviewFilledWithIdiom(.lingual, inMargins: true)
    }

    func testFillingSuperviewUsingTrailingToLeadingAndTopToBottomInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.trailingToLeading, .topToBottom], inMargins: true)
        assertSuperviewFilledWithIdiom(.lingual, inMargins: true)
    }

    func testFillingSuperviewUsingLeadingToTrailingAndBottomToTopInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leadingToTrailing, .bottomToTop], inMargins: true)
        assertSuperviewFilledWithIdiom(.lingual, inMargins: true)
    }

    func testFillingSuperviewUsingTrailingToLeadingAndBottomToTopInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.trailingToLeading, .bottomToTop], inMargins: true)
        assertSuperviewFilledWithIdiom(.lingual, inMargins: true)
    }

    func testFillingSuperviewUsingLeftToRightAndTopToBottomInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leftToRight, .topToBottom], inMargins: true)
        assertSuperviewFilledWithIdiom(.geometric, inMargins: true)
    }

    func testFillingSuperviewUsingRightToLeftAndTopToBottomInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.rightToLeft, .topToBottom], inMargins: true)
        assertSuperviewFilledWithIdiom(.geometric, inMargins: true)
    }

    func testFillingSuperviewUsingLeftToRightAndBottomToTopInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leftToRight, .topToBottom], inMargins: true)
        assertSuperviewFilledWithIdiom(.geometric, inMargins: true)
    }

    func testFillingSuperviewUsingRightToLeftAndBottomToTopInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.rightToLeft, .topToBottom], inMargins: true)
        assertSuperviewFilledWithIdiom(.geometric, inMargins: true)
    }

    //  MARK: Excluding edges

    func testExcludingOneEdge() {
        returnedConstraints = subview.fillSuperview(inDirections: [.leftToRight], excludeEdges: [.left])
        assertFillingConstraintCount(1)
        assertSubviewConstrainedToSuperviewEdge(.right)
    }

    func testExcludingOneEdgeInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.rightToLeft], excludeEdges: [.left], inMargins: true)
        assertFillingConstraintCount(1)
        assertSubviewConstrainedToSuperviewEdge(.right, usingMargins: true)
    }

    func testExcludingTwoEdges() {
        returnedConstraints = subview.fillSuperview(excludeEdges: [.trailing, .bottom])
        assertSuperviewFilledWithIdiom(.lingual, excludingEdges: [.trailing, .bottom])
    }

    func testExcludingTwoEdgesInMargins() {
        returnedConstraints = subview.fillSuperview(excludeEdges: [.leading, .top], inMargins: true)
        assertSuperviewFilledWithIdiom(.lingual, excludingEdges: [.leading, .top], inMargins: true)
    }

    func testExcludingThreeEdges() {
        returnedConstraints = subview.fillSuperview(excludeEdges: [.leading, .trailing, .bottom])
        assertFillingConstraintCount(1)
        assertSubviewConstrainedToSuperviewEdge(.top)
    }

    func testExcludingThreeEdgesInMargins() {
        returnedConstraints = subview.fillSuperview(
            inDirections: [.leftToRight, .topToBottom],
            excludeEdges: [.left, .right, .bottom],
            inMargins: true
        )
        assertFillingConstraintCount(1)
        assertSubviewConstrainedToSuperviewEdge(.top, usingMargins: true)
    }

    func testExcludingFourEdges() {
        returnedConstraints = subview.fillSuperview(excludeEdges: [.leading, .trailing, .top, .bottom])
        assertFillingConstraintCount(0)
        XCTAssertEqual(superview.constraints.count, 0, "No constraints should be applied")
    }

    func testExcludingFourEdgesInMargins() {
        returnedConstraints = subview.fillSuperview(
            inDirections: [.rightToLeft, .bottomToTop],
            excludeEdges: [.left, .right, .top, .bottom])
        assertFillingConstraintCount(0)
        XCTAssertEqual(superview.constraints.count, 0, "No constraints should be applied")
    }

    //  MARK: Custom assertions

    fileprivate func assertSuperviewFilledWithIdiom(
        _ idiom: HoriontalDirectionIdiom,
        excludingEdges edgeExclusions: Set<LayoutEdge> = [],
        inMargins usingMargins: Bool = false,
        inFile file: String = #file,
        atLine line: UInt = #line
        ) {
            let horizontalEdges: Set<LayoutEdge>
            switch idiom {
            case .lingual:
                horizontalEdges = [.leading, .trailing]

            case .geometric:
                horizontalEdges = [.left, .right]
            }

            let verticalEdges: Set<LayoutEdge> = [.top, .bottom]
            let expectedEdges = (verticalEdges.union(horizontalEdges)).subtracting(edgeExclusions)

            assertFillingConstraintCount(expectedEdges.count, inFile: file, atLine: line)
            expectedEdges.forEach {
                assertSubviewConstrainedToSuperviewEdge($0, usingMargins: usingMargins, inFile: file, atLine: line)
            }
    }

    fileprivate func assertFillingConstraintCount(_ count: Int, inFile file: String = #file, atLine line: UInt = #line) {
        var countString = ""
        switch count {
        case 0:
            countString = "no"

        case 1:
            countString = "one"

        case 2:
            countString = "two"

        case 3:
             countString = "three"

        case 4:
            countString = "four"

        default:
            assert(false, "Only 0-4 are allowed")
        }

        if returnedConstraints.count != count {
            let pluralString = count == 1 ? "" : "s"
            let andOrString = count == 0 ? "or" : "and"
            let errorString = "There should be \(countString) constraint\(pluralString) returned \(andOrString) activated"
            recordFailure(withDescription: errorString, inFile: file, atLine: line,  expected: true)
        }
    }

    fileprivate func assertSubviewConstrainedToSuperviewEdge(_ edge: LayoutEdge, usingMargins useMargins: Bool = false, inFile file: String = #file, atLine line: UInt = #line) {
        let subviewPair = AutoLayoutAttributedItem(subview, edge.getLayoutAttribute(usingMargins: false))
        let superviewPair = AutoLayoutAttributedItem(superview, edge.getLayoutAttribute(usingMargins: useMargins))
        let expected = subviewPair =* superviewPair

        if !returnedConstraints.contains(expected) || !superview.hasConstraint(expected) {
            let errorString = PinningErrorStringForEdge(edge, usingMargins: useMargins)
            recordFailure(withDescription: errorString, inFile: file, atLine: line, expected: true)
        }
    }
}

private func PinningErrorStringForEdge(_ edge: LayoutEdge, usingMargins useMargins: Bool) -> String {
    let edgeString = StringForEdge(edge)
    let edgeOrMargin = useMargins ? "margin" : "edge"
    return "The subview should be pinned to its superview's \(edgeString) \(edgeOrMargin)"
}

private func StringForEdge(_ edge: LayoutEdge) -> String {
    switch edge {
    case .leading:
        return "leading"

    case .trailing:
        return "trailing"

    case .left:
        return "left"

    case .right:
        return "right"

    case .top:
        return "top"

    case .bottom:
        return "bottom"
    }
}

private enum HoriontalDirectionIdiom {
    case lingual
    case geometric
}

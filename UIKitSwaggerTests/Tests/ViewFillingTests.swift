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
        assertSuperviewFilledWithIdiom(.Lingual)
    }

    func testFillingSuperviewInMarginsUsingDefaults() {
        returnedConstraints = subview.fillSuperview(inMargins: true)
        assertSuperviewFilledWithIdiom(.Lingual, inMargins: true)
    }

    //  MARK: Single directions

    func testFillingSuperviewUsingLeadingToTrailingDirection() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeadingToTrailing])
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.Leading)
        assertSubviewConstrainedToSuperviewEdge(.Trailing)
    }

    func testFillingSuperviewUsingTrailingToLeadingDirection() {
        returnedConstraints = subview.fillSuperview(inDirections: [.TrailingToLeading])
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.Leading)
        assertSubviewConstrainedToSuperviewEdge(.Trailing)
    }

    func testFillingSuperviewUsingLeftToRightDirection() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeftToRight])
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.Left)
        assertSubviewConstrainedToSuperviewEdge(.Right)
    }

    func testFillingSuperviewUsingRightToLeftDirection() {
        returnedConstraints = subview.fillSuperview(inDirections: [.RightToLeft])
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.Left)
        assertSubviewConstrainedToSuperviewEdge(.Right)
    }

    func testFillingSuperviewUsingTopToBottomDirection() {
        returnedConstraints = subview.fillSuperview(inDirections: [.TopToBottom])
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.Top)
        assertSubviewConstrainedToSuperviewEdge(.Bottom)
    }

    func testFillingSuperviewUsingBottomToTopDirection() {
        returnedConstraints = subview.fillSuperview(inDirections: [.BottomToTop])
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.Top)
        assertSubviewConstrainedToSuperviewEdge(.Bottom)
    }

    //  MARK: Single directions in margins

    func testFillingSuperviewUsingLeadingToTrailingDirectionInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeadingToTrailing], inMargins: true)
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.Leading, usingMargins: true)
        assertSubviewConstrainedToSuperviewEdge(.Trailing, usingMargins: true)
    }

    func testFillingSuperviewUsingTrailingToLeadingDirectionInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.TrailingToLeading], inMargins: true)
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.Leading, usingMargins: true)
        assertSubviewConstrainedToSuperviewEdge(.Trailing, usingMargins: true)
    }

    func testFillingSuperviewUsingLeftToRightDirectionInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeftToRight], inMargins: true)
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.Left, usingMargins: true)
        assertSubviewConstrainedToSuperviewEdge(.Right, usingMargins: true)
    }

    func testFillingSuperviewUsingRightToLeftDirectionInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.RightToLeft], inMargins: true)
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.Left, usingMargins: true)
        assertSubviewConstrainedToSuperviewEdge(.Right, usingMargins: true)
    }

    func testFillingSuperviewUsingTopToBottomDirectionInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.TopToBottom], inMargins: true)
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.Top, usingMargins: true)
        assertSubviewConstrainedToSuperviewEdge(.Bottom, usingMargins: true)
    }

    func testFillingSuperviewUsingBottomToTopDirectionInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.BottomToTop], inMargins: true)
        assertFillingConstraintCount(2)
        assertSubviewConstrainedToSuperviewEdge(.Top, usingMargins: true)
        assertSubviewConstrainedToSuperviewEdge(.Bottom, usingMargins: true)
    }

    //  MARK: Double directions

    func testFillingSuperviewUsingLeadingToTrailingAndTopToBottom() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeadingToTrailing, .TopToBottom])
        assertSuperviewFilledWithIdiom(.Lingual)
    }

    func testFillingSuperviewUsingTrailingToLeadingAndTopToBottom() {
        returnedConstraints = subview.fillSuperview(inDirections: [.TrailingToLeading, .TopToBottom])
        assertSuperviewFilledWithIdiom(.Lingual)
    }

    func testFillingSuperviewUsingLeadingToTrailingAndBottomToTop() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeadingToTrailing, .BottomToTop])
        assertSuperviewFilledWithIdiom(.Lingual)
    }

    func testFillingSuperviewUsingTrailingToLeadingAndBottomToTop() {
        returnedConstraints = subview.fillSuperview(inDirections: [.TrailingToLeading, .BottomToTop])
        assertSuperviewFilledWithIdiom(.Lingual)
    }

    func testFillingSuperviewUsingLeftToRightAndTopToBottom() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeftToRight, .TopToBottom])
        assertSuperviewFilledWithIdiom(.Geometric)
    }

    func testFillingSuperviewUsingRightToLeftAndTopToBottom() {
        returnedConstraints = subview.fillSuperview(inDirections: [.RightToLeft, .TopToBottom])
        assertSuperviewFilledWithIdiom(.Geometric)
    }

    func testFillingSuperviewUsingLeftToRightAndBottomToTop() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeftToRight, .TopToBottom])
        assertSuperviewFilledWithIdiom(.Geometric)
    }

    func testFillingSuperviewUsingRightToLeftAndBottomToTop() {
        returnedConstraints = subview.fillSuperview(inDirections: [.RightToLeft, .TopToBottom])
        assertSuperviewFilledWithIdiom(.Geometric)
    }

    //  MARK: Double directions in margins

    func testFillingSuperviewUsingLeadingToTrailingAndTopToBottomInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeadingToTrailing, .TopToBottom], inMargins: true)
        assertSuperviewFilledWithIdiom(.Lingual, inMargins: true)
    }

    func testFillingSuperviewUsingTrailingToLeadingAndTopToBottomInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.TrailingToLeading, .TopToBottom], inMargins: true)
        assertSuperviewFilledWithIdiom(.Lingual, inMargins: true)
    }

    func testFillingSuperviewUsingLeadingToTrailingAndBottomToTopInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeadingToTrailing, .BottomToTop], inMargins: true)
        assertSuperviewFilledWithIdiom(.Lingual, inMargins: true)
    }

    func testFillingSuperviewUsingTrailingToLeadingAndBottomToTopInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.TrailingToLeading, .BottomToTop], inMargins: true)
        assertSuperviewFilledWithIdiom(.Lingual, inMargins: true)
    }

    func testFillingSuperviewUsingLeftToRightAndTopToBottomInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeftToRight, .TopToBottom], inMargins: true)
        assertSuperviewFilledWithIdiom(.Geometric, inMargins: true)
    }

    func testFillingSuperviewUsingRightToLeftAndTopToBottomInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.RightToLeft, .TopToBottom], inMargins: true)
        assertSuperviewFilledWithIdiom(.Geometric, inMargins: true)
    }

    func testFillingSuperviewUsingLeftToRightAndBottomToTopInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeftToRight, .TopToBottom], inMargins: true)
        assertSuperviewFilledWithIdiom(.Geometric, inMargins: true)
    }

    func testFillingSuperviewUsingRightToLeftAndBottomToTopInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.RightToLeft, .TopToBottom], inMargins: true)
        assertSuperviewFilledWithIdiom(.Geometric, inMargins: true)
    }

    //  MARK: Excluding edges

    func testExcludingOneEdge() {
        returnedConstraints = subview.fillSuperview(inDirections: [.LeftToRight], excludeEdges: [.Left])
        assertFillingConstraintCount(1)
        assertSubviewConstrainedToSuperviewEdge(.Right)
    }

    func testExcludingOneEdgeInMargins() {
        returnedConstraints = subview.fillSuperview(inDirections: [.RightToLeft], excludeEdges: [.Left], inMargins: true)
        assertFillingConstraintCount(1)
        assertSubviewConstrainedToSuperviewEdge(.Right, usingMargins: true)
    }

    func testExcludingTwoEdges() {
        returnedConstraints = subview.fillSuperview(excludeEdges: [.Trailing, .Bottom])
        assertSuperviewFilledWithIdiom(.Lingual, excludingEdges: [.Trailing, .Bottom])
    }

    func testExcludingTwoEdgesInMargins() {
        returnedConstraints = subview.fillSuperview(excludeEdges: [.Leading, .Top], inMargins: true)
        assertSuperviewFilledWithIdiom(.Lingual, excludingEdges: [.Leading, .Top], inMargins: true)
    }

    func testExcludingThreeEdges() {
        returnedConstraints = subview.fillSuperview(excludeEdges: [.Leading, .Trailing, .Bottom])
        assertFillingConstraintCount(1)
        assertSubviewConstrainedToSuperviewEdge(.Top)
    }

    func testExcludingThreeEdgesInMargins() {
        returnedConstraints = subview.fillSuperview(
            inDirections: [.LeftToRight, .TopToBottom],
            excludeEdges: [.Left, .Right, .Bottom],
            inMargins: true
        )
        assertFillingConstraintCount(1)
        assertSubviewConstrainedToSuperviewEdge(.Top, usingMargins: true)
    }

    func testExcludingFourEdges() {
        returnedConstraints = subview.fillSuperview(excludeEdges: [.Leading, .Trailing, .Top, .Bottom])
        assertFillingConstraintCount(0)
        XCTAssertEqual(superview.constraints.count, 0, "No constraints should be applied")
    }

    func testExcludingFourEdgesInMargins() {
        returnedConstraints = subview.fillSuperview(
            inDirections: [.RightToLeft, .BottomToTop],
            excludeEdges: [.Left, .Right, .Top, .Bottom])
        assertFillingConstraintCount(0)
        XCTAssertEqual(superview.constraints.count, 0, "No constraints should be applied")
    }

    //  MARK: Custom assertions

    private func assertSuperviewFilledWithIdiom(
        idiom: HoriontalDirectionIdiom,
        excludingEdges edgeExclusions: Set<LayoutEdge> = [],
        inMargins usingMargins: Bool = false,
        inFile file: String = __FILE__,
        atLine line: UInt = __LINE__
        ) {
            let horizontalEdges: Set<LayoutEdge>
            switch idiom {
            case .Lingual:
                horizontalEdges = [.Leading, .Trailing]

            case .Geometric:
                horizontalEdges = [.Left, .Right]
            }

            let verticalEdges: Set<LayoutEdge> = [.Top, .Bottom]
            let expectedEdges = (verticalEdges.union(horizontalEdges)).subtract(edgeExclusions)

            assertFillingConstraintCount(expectedEdges.count, inFile: file, atLine: line)
            expectedEdges.forEach {
                assertSubviewConstrainedToSuperviewEdge($0, usingMargins: usingMargins, inFile: file, atLine: line)
            }
    }

    private func assertFillingConstraintCount(count: Int, inFile file: String = __FILE__, atLine line: UInt = __LINE__) {
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
            recordFailureWithDescription(errorString, inFile: file, atLine: line,  expected: true)
        }
    }

    private func assertSubviewConstrainedToSuperviewEdge(edge: LayoutEdge, usingMargins useMargins: Bool = false, inFile file: String = __FILE__, atLine line: UInt = __LINE__) {
        let subviewPair = AutoLayoutAttributedItem(subview, edge.getLayoutAttribute(usingMargins: false))
        let superviewPair = AutoLayoutAttributedItem(superview, edge.getLayoutAttribute(usingMargins: useMargins))
        let expected = subviewPair =* superviewPair

        if !returnedConstraints.contains(expected) || !superview.hasConstraint(expected) {
            let errorString = PinningErrorStringForEdge(edge, usingMargins: useMargins)
            recordFailureWithDescription(errorString, inFile: file, atLine: line, expected: true)
        }
    }
}

private func PinningErrorStringForEdge(edge: LayoutEdge, usingMargins useMargins: Bool) -> String {
    let edgeString = StringForEdge(edge)
    let edgeOrMargin = useMargins ? "margin" : "edge"
    return "The subview should be pinned to its superview's \(edgeString) \(edgeOrMargin)"
}

private func StringForEdge(edge: LayoutEdge) -> String {
    switch edge {
    case .Leading:
        return "leading"

    case .Trailing:
        return "trailing"

    case .Left:
        return "left"

    case .Right:
        return "right"

    case .Top:
        return "top"

    case .Bottom:
        return "bottom"
    }
}

private enum HoriontalDirectionIdiom {
    case Lingual
    case Geometric
}

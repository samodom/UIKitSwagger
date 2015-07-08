//
//  ViewAddableSyntaxTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 12/5/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest
@testable import UIKitSwagger

class ViewAddableSyntaxTests: XCTestCase {

    let view = UIView()
    var subview1 = UIView()
    var subview2 = UIView()
    var effect1 = UIInterpolatingMotionEffect()
    var effect2 = UIInterpolatingMotionEffect()
    var recognizer1 = UIGestureRecognizer()
    var recognizer2 = UIGestureRecognizer()

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //  MARK: Adding

    func testAddingSubviewWithOperator() {
        view += subview1
        XCTAssertEqual(subview1.superview!, view, "The supplied subview operand should be added to the view")
    }

    func testAddingSubviewArrayWithOperator() {
        view += [subview1, subview2]
        XCTAssertEqual(subview1.superview!, view, "Each supplied subview should be added to the view")
        XCTAssertEqual(subview2.superview!, view, "Each supplied subview should be added to the view")
    }

    @available(iOS 9.0, *)
    func testAddingLayoutGuideWithOperator() {
        let guide = UILayoutGuide()
        view += guide
        XCTAssertEqual(guide.owningView!, view, "The supplied layout guide operand should be added to the view")
    }

    @available(iOS 9.0, *)
    func testAddingLayoutGuideArrayWithOperator() {
        let guide1 = UILayoutGuide()
        let guide2 = UILayoutGuide()
        view += [guide1, guide2]
        XCTAssertEqual(guide1.owningView!, view, "Each supplied layout guide should be added to the view")
        XCTAssertEqual(guide2.owningView!, view, "Each supplied layout guide should be added to the view")
    }

    func testAddingMotionEffectWithOperator() {
        subview1 += effect1
        XCTAssertEqual(subview1.motionEffects, [effect1], "The supplied motion effect operand should be added to the view")
    }

    func testAddingMotionEffectArrayWithOperator() {
        subview1 += [effect1, effect2]
        XCTAssertTrue(subview1.motionEffects.contains(effect1), "Each supplied motion effect should be added to the view")
        XCTAssertTrue(subview1.motionEffects.contains(effect2), "Each supplied motion effect should be added to the view")
    }

    func testAddingGestureRecognizerWithOperator() {
        view += recognizer1
        XCTAssertEqual(view.gestureRecognizers!, [recognizer1], "The supplied gesture recognizer operand should be added to the view")
    }

    func testAddingGestureRecognizerArrayWithOperator() {
        view += [recognizer1, recognizer2]
        XCTAssertTrue(view.gestureRecognizers!.contains(recognizer1), "Each supplied gesture recognizer should be added to the view")
        XCTAssertTrue(view.gestureRecognizers!.contains(recognizer2), "Each supplied gesture recognizer should be added to the view")
    }

    func testAddingMixOfAddablesWithOperator() {
        var addables = [effect1, recognizer2, subview1, effect2, subview2, recognizer1] as [UIViewAddable]
        var guide1: UIViewAddable!
        var guide2: UIViewAddable!
        if #available(iOS 9.0, *) {
            guide1 = UILayoutGuide()
            guide2 = UILayoutGuide()
            addables += [guide1, guide2]
        }
        view += addables
        XCTAssertEqual(subview1.superview!, view, "Each supplied subview should be added to the view")
        XCTAssertEqual(subview2.superview!, view, "Each supplied subview should be added to the view")
        if #available(iOS 9.0, *) {
            XCTAssertEqual((guide1 as! UILayoutGuide).owningView!, view, "Each supplied layout guide should be added to the view")
            XCTAssertEqual((guide2 as! UILayoutGuide).owningView!, view, "Each supplied layout guide should be added to the view")
        }
        XCTAssertTrue(view.motionEffects.contains(effect1), "Each supplied motion effect should be added to the view")
        XCTAssertTrue(view.motionEffects.contains(effect2), "Each supplied motion effect should be added to the view")
        XCTAssertTrue(view.gestureRecognizers!.contains(recognizer1), "Each supplied gesture recognizer should be added to the view")
        XCTAssertTrue(view.gestureRecognizers!.contains(recognizer2), "Each supplied gesture recognizer should be added to the view")
    }

    //  MARK: Removing

    func testCannotRemoveSubviewNotInView() {
        subview1.addSubview(subview2)
        view -= subview2
        XCTAssertEqual(subview2.superview!, subview1, "The unowned subview operand should not be removed from its superview")
    }

    func testRemovingSubviewWithOperator() {
        view.addSubview(subview1)
        view -= subview1
        XCTAssertNil(subview1.superview, "The supplied subview operand should be removed from the view")
    }

    func testRemovingSubviewArrayWithOperator() {
        view.addSubview(subview1)
        view.addSubview(subview2)
        view -= [subview1, subview2]
        XCTAssertNil(subview1.superview, "Each supplied subview should be removed from the view")
        XCTAssertNil(subview2.superview, "Each supplied subview should be removed from the view")
    }

    @available(iOS 9.0, *)
    func testCannotRemoveLayoutGuideNotInView() {
        let guide = UILayoutGuide()
        subview1.addLayoutGuide(guide)
        view -= guide
        XCTAssertEqual(guide.owningView!, subview1, "The unowned layout guide should not be removed from its owning view")
    }

    @available(iOS 9.0, *)
    func testRemovingLayoutGuideWithOperator() {
        let guide = UILayoutGuide()
        view.addLayoutGuide(guide)
        view -= guide
        XCTAssertNil(guide.owningView, "The supplied layout guide operand should be removed from the view")
    }

    @available(iOS 9.0, *)
    func testRemovingLayoutGuideArrayWithOperator() {
        let guide1 = UILayoutGuide()
        let guide2 = UILayoutGuide()
        view.addLayoutGuide(guide1)
        view.addLayoutGuide(guide2)
        view -= [guide1, guide2]
        XCTAssertNil(guide1.owningView, "Each supplied layout guide should be removed from the view")
        XCTAssertNil(guide2.owningView, "Each supplied layout guide should be removed from the view")
    }

    func testRemovingMotionEffectWithOperator() {
        subview1.addMotionEffect(effect1)
        subview1 -= effect1
        XCTAssertEqual(subview1.motionEffects.count, 0, "The supplied motion effect operand should be removed from the view")
    }

    func testRemovingMotionEffectArrayWithOperator() {
        subview1.addMotionEffect(effect1)
        subview1.addMotionEffect(effect2)
        subview1 -= [effect1, effect2]
        XCTAssertEqual(subview1.motionEffects.count, 0, "Each supplied motion effect should be removed from the view")
    }

    func testCannotRemoveGestureRecognizerNotOwnedByView() {
        subview1.addGestureRecognizer(recognizer1)
        view -= recognizer1
        XCTAssertEqual(recognizer1.view!, subview1, "The gesture recognizer should not be removed from its owning view")
    }

    func testRemovingGestureRecognizerWithOperator() {
        view.addGestureRecognizer(recognizer1)
        view -= recognizer1
        XCTAssertEqual(view.gestureRecognizers!.count, 0, "The supplied gesture recognizer operand should be removed from the view")
    }

    func testRemovingGestureRecognizerArrayWithOperator() {
        view.addGestureRecognizer(recognizer1)
        view.addGestureRecognizer(recognizer2)
        view -= [recognizer1, recognizer2]
        XCTAssertEqual(view.gestureRecognizers!.count, 0, "Each supplied gesture recognizer should be removed from the view")
    }

    func testRemovingMixOfAddablesWithOperator() {
        var addables = [effect1, recognizer2, subview1, effect2, subview2, recognizer1] as [UIViewAddable]
        var guide1: UIViewAddable!
        var guide2: UIViewAddable!
        if #available(iOS 9.0, *) {
            guide1 = UILayoutGuide()
            guide2 = UILayoutGuide()
            addables += [guide1, guide2]
        }
        view += addables
        view -= addables
        XCTAssertNil(subview1.superview, "Each supplied subview should be removed from the view")
        XCTAssertNil(subview2.superview, "Each supplied subview should be removed from the view")
        if #available(iOS 9.0, *) {
            XCTAssertNil((guide1 as! UILayoutGuide).owningView, "Each supplied layout guide should be removed from the view")
            XCTAssertNil((guide2 as! UILayoutGuide).owningView, "Each supplied layout guide should be removed from the view")
        }
        XCTAssertEqual(view.constraints.count, 0, "Each supplied constraint should be removed from the view")
        XCTAssertEqual(view.motionEffects.count, 0, "Each supplied motion effect should be removed from the view")

        if let recognizerCount = view.gestureRecognizers?.count {
            XCTAssertEqual(recognizerCount, 0, "If there is still a recognizer array, it shouldn't have any contents")
        }
        else {
            XCTAssertNil(view.gestureRecognizers, "Each supplied gesture recognizer should be removed from the view")
        }
    }

}

//
//  ButtonStateConfigurationTests.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 1/8/15.
//  Copyright (c) 2015 Swagger Soft. All rights reserved.
//

import UIKit
import XCTest

class ButtonStateConfigurationTests: XCTestCase {

    var configuration = UIButtonStateConfiguration()
    var otherConfiguration = UIButtonStateConfiguration()
    var button = UIButton()
    let title = "Sample Button"
    let attributes = [NSForegroundColorAttributeName:red]
    var attributedTitle: NSAttributedString!
    let image = UIImage()

    override func setUp() {
        super.setUp()

        attributedTitle = NSAttributedString(string: title, attributes: attributes)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //  MARK: Configuration type

    func testConfigurationHasTitle() {
        XCTAssertNil(configuration.title, "The configuration should not have a title by default")
        configuration.title = title
        XCTAssertEqual(configuration.title!, title, "The configuration should have a title")
    }

    func testConfigurationHasAttributedTitle() {
        XCTAssertNil(configuration.title, "The configuration should not have an attributed title by default")
        configuration.attributedTitle = attributedTitle
        XCTAssertEqual(configuration.attributedTitle!, attributedTitle, "The configuration should have an attributed title")
    }

    func testConfigurationHasTitleColor() {
        XCTAssertNil(configuration.titleColor, "The configuration should not have a title color by default")
        configuration.titleColor = orange
        XCTAssertEqual(configuration.titleColor!, orange, "The configuration should have a title color")
    }

    func testConfigurationHasTitleShadowColor() {
        XCTAssertNil(configuration.titleShadowColor, "The configuration should not have a title shadow color by default")
        configuration.titleShadowColor = purple
        XCTAssertEqual(configuration.titleShadowColor!, purple, "The configuration should have a title shadow color")
    }

    func testConfigurationHasImage() {
        XCTAssertNil(configuration.image, "The configuration should not have an image by default")
        configuration.image = image
        XCTAssertEqual(configuration.image!, image, "The configuration should have an image")
    }

    func testConfigurationHasBackgroundImage() {
        XCTAssertNil(configuration.backgroundImage, "The configuration should not have a background image by default")
        configuration.backgroundImage = image
        XCTAssertEqual(configuration.backgroundImage!, image, "The configuration should have a background image")
    }


    //  MARK: Equatability

    func testEmptyEqualConfigurations() {
        XCTAssertEqual(configuration, otherConfiguration, "Empty configurations should be considered equal")
    }

    func testTitleOnlyEqualConfigurations() {
        configuration.title = title
        otherConfiguration.title = title
        XCTAssertEqual(configuration, otherConfiguration, "Title-only configurations should be considered equal if their titles are equal")
    }

    func testAttributedTitleOnlyEqualConfigurations() {
        configuration.attributedTitle = attributedTitle
        otherConfiguration.attributedTitle = attributedTitle
        XCTAssertEqual(configuration, otherConfiguration, "Attributed-title-only configurations should be considered equal if their attributed titles are equal")
    }

    func testTitleColorOnlyEqualConfigurations() {
        configuration.titleColor = orange
        otherConfiguration.titleColor = orange
        XCTAssertEqual(configuration, otherConfiguration, "Title-color-only configurations should be considered equal if their title colors are equal")
    }

    func testTitleShadowColorOnlyEqualConfigurations() {
        configuration.titleShadowColor = purple
        otherConfiguration.titleShadowColor = purple
        XCTAssertEqual(configuration, otherConfiguration, "Title-shadow-color-only configurations should be considered equal if their title shadow colors are equal")
    }

    func testImageOnlyEqualConfigurations() {
        configuration.image = image
        otherConfiguration.image = image
        XCTAssertEqual(configuration, otherConfiguration, "Image-only configurations should be considered equal if their images are equal")
    }

    func testBackgroundImageOnlyEqualConfigurations() {
        configuration.backgroundImage = image
        otherConfiguration.backgroundImage = image
        XCTAssertEqual(configuration, otherConfiguration, "Background-image-only configurations should be considered equal if their background images are equal")
    }

    func testFullyConfiguredEqualConfigurations() {
        createEquivalentConfigurations()
        XCTAssertEqual(configuration, otherConfiguration, "Fully configured state configurations should be considered equal if all of their values are equal")
    }

    func testConfigurationsUnequalWithMismatchedTitles() {
        createEquivalentConfigurations()
        otherConfiguration.title = "Another Button"
        XCTAssertNotEqual(configuration, otherConfiguration, "The two configurations should not be considered equal if their titles are not equal")

        otherConfiguration.title = nil
        XCTAssertNotEqual(configuration, otherConfiguration, "The two configurations should not be considered equal if one of the titles is missing")
    }

    func testConfigurationsUnequalWithMismatchedAttributedTitles() {
        createEquivalentConfigurations()
        otherConfiguration.attributedTitle = NSAttributedString(string: "Another Button", attributes: attributes)
        XCTAssertNotEqual(configuration, otherConfiguration, "The two configurations should not be considered equal if their attributed titles are not equal")

        otherConfiguration.attributedTitle = nil
        XCTAssertNotEqual(configuration, otherConfiguration, "The two configurations should not be considered equal if one of the attributed titles is missing")
    }

    func testConfigurationsUnequalWithMismatchedTitleColors() {
        createEquivalentConfigurations()
        otherConfiguration.titleColor = green
        XCTAssertNotEqual(configuration, otherConfiguration, "The two configurations should not be considered equal if their title colors are not equal")

        otherConfiguration.titleColor = nil
        XCTAssertNotEqual(configuration, otherConfiguration, "The two configurations should not be considered equal if one of the title colors is missing")
    }

    func testConfigurationsUnequalWithMismatchedTitleShadowColors() {
        createEquivalentConfigurations()
        otherConfiguration.titleShadowColor = brown
        XCTAssertNotEqual(configuration, otherConfiguration, "The two configurations should not be considered equal if their title shadow colors are not equal")

        otherConfiguration.titleShadowColor = nil
        XCTAssertNotEqual(configuration, otherConfiguration, "The two configurations should not be considered equal if one of the title shadow colors is missing")
    }

    func testConfigurationsUnequalWithMismatchedImages() {
        createEquivalentConfigurations()
        otherConfiguration.image = UIImage()
        XCTAssertNotEqual(configuration, otherConfiguration, "The two configurations should not be considered equal if their images are not equal")

        otherConfiguration.image = nil
        XCTAssertNotEqual(configuration, otherConfiguration, "The two configurations should not be considered equal if one of the images is missing")
    }

    func testConfigurationsUnequalWithMismatchedBackgroundImages() {
        createEquivalentConfigurations()
        otherConfiguration.backgroundImage = UIImage()
        XCTAssertNotEqual(configuration, otherConfiguration, "The two configurations should not be considered equal if their background images are not equal")

        otherConfiguration.backgroundImage = nil
        XCTAssertNotEqual(configuration, otherConfiguration, "The two configurations should not be considered equal if one of the background images is missing")
    }

    private func createEquivalentConfigurations() {
        configuration.title = title
        configuration.attributedTitle = attributedTitle
        configuration.titleColor = orange
        configuration.titleShadowColor = purple
        configuration.image = image
        configuration.backgroundImage = image

        otherConfiguration.title = title
        otherConfiguration.attributedTitle = attributedTitle
        otherConfiguration.titleColor = orange
        otherConfiguration.titleShadowColor = purple
        otherConfiguration.image = image
        otherConfiguration.backgroundImage = image
    }

}

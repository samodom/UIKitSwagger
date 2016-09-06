//
//  RGBComponentsMirror.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 7/8/15.
//  Copyright © 2015 Swagger Soft. All rights reserved.
//

import UIKit

public struct RGBComponentsMirror: Mirror {

    private let components: RGBComponents
    public init(_ components: RGBComponents) {
        self.components = components
    }

    /*
    public var value: Any { components }

    public var valueType: Any.Type { RGBComponents.self }

    public var objectIdentifier: ObjectIdentifier? { return nil }

    public var disposition: MirrorDisposition { MirrorDisposition.Struct }

    public var count: Int { 4 }

    public subscript(index: Int) -> (String, MirrorType) {
        guard (0 ..< count).contains(index) else { fatalError("Invalid child index") }
        switch index {
        case 0:
            ("Red", reflect(components.red))

        case 1:
            ("Green", reflect(components.green))

        case 2:
            ("Blue", reflect(components.blue))

        case 3:
            ("Alpha", reflect(components.alpha))
        }
    }

    public var summary: String { "foo" }

    public var quickLookObject: QuickLookObject? { return nil }
*/
}

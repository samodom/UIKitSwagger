//
//  ObjectAssociation.swift
//  UIKitSwagger
//
//  Created by Sam Odom on 4/28/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

import Foundation

internal extension NSObject {

    //  MARK: Instances

    internal func associateObject(object: AnyObject, withKey key: String) {
        objc_setAssociatedObject(self, key, object, .OBJC_ASSOCIATION_RETAIN)
        print(objc_getAssociatedObject(self, key))
    }

    internal func associationForKey(key: String) -> AnyObject? {
        return objc_getAssociatedObject(self, key)
    }

    internal func dissociateKey(key: String) {
        objc_setAssociatedObject(self, key, nil, .OBJC_ASSOCIATION_ASSIGN)
    }

    internal func removeAllAssociations() {
        objc_removeAssociatedObjects(self)
    }


    //  MARK: Classes

//    internal class func associateObject(object: AnyObject, withKey key: String) {
//        print(object)
//        objc_setAssociatedObject(self, key, object, .OBJC_ASSOCIATION_RETAIN)
//        print(objc_getAssociatedObject(self, key))
//    }

    internal class func associateObject(object: AnyObject, withKey key: String) {
        objc_setAssociatedObject(self, key, object, .OBJC_ASSOCIATION_RETAIN)
    }

    internal class func associationForKey(key: String) -> AnyObject? {
        return objc_getAssociatedObject(self, key)
    }

    internal class func dissociateKey(key: String) {
        objc_setAssociatedObject(self, key, nil, .OBJC_ASSOCIATION_ASSIGN)
    }

    internal class func removeAllAssociations() {
        objc_removeAssociatedObjects(self)
    }

}

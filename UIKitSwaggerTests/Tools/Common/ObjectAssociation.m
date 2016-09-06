//
//  ObjectAssociation.m
//  UIKitSwagger
//
//  Created by Sam Odom on 4/29/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

#import "ObjectAssociation.h"

#import <objc/runtime.h>

@implementation NSObject (ObjectAssociation)

- (void)associateObject:(id __nullable)object withKey:(void * __nonnull)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN);
}

- (id __nullable)associationForKey:(void * __nonnull)key {
    return objc_getAssociatedObject(self, key);
}

- (void)dissociateKey:(void * __nonnull)key {
    objc_setAssociatedObject(self, key, nil, OBJC_ASSOCIATION_ASSIGN);
}

- (void)removeAllAssociations {
    objc_removeAssociatedObjects(self);
}

+ (void)associateObject:(id __nullable)object withKey:(void * __nonnull)key {
    objc_setAssociatedObject(self, key, object, OBJC_ASSOCIATION_RETAIN);
}

@end

//
//  ObjectAssociation.h
//  UIKitSwagger
//
//  Created by Sam Odom on 4/29/16.
//  Copyright © 2016 Swagger Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ObjectAssociation)

- (void)associateObject:(id __nullable)object withKey:(void * __nonnull)key;

- (id __nullable)associationForKey:(void * __nonnull)key;

- (void)dissociateKey:(void * __nonnull)key;

- (void)removeAllAssociations;

+ (void)associateObject:(id __nullable)object withKey:(void * __nonnull)key;

@end

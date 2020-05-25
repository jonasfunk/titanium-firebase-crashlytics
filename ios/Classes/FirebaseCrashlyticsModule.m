/**
 * firebaseCrashlytics
 *
 * Created by Your Name
 * Copyright (c) 2018 Your Company. All rights reserved.
 */


#import <Firebase/Firebase.h>
#import <FirebaseCrashlytics/FirebaseCrashlytics.h>
#import "FirebaseCrashlyticsModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiExceptionHandler.h"


@implementation FirebaseCrashlyticsModule

#pragma mark Internal

// This is generated for your module, please do not change it
- (id)moduleGUID
{
  return @"1e200175-3db7-4741-a27c-4aca22dd872f";
}

// This is generated for your module, please do not change it
- (NSString *)moduleId
{
  return @"firebase.crashlytics";
}

#pragma mark Lifecycle

- (void)startup
{
  // This method is called when the module is first loaded
  // You *must* call the superclass
  [super startup];
  DebugLog(@"[DEBUG] %@ loaded", self);
  [FIRApp configure];
}

#pragma Public APIs


- (void)log:(id)message
{
    ENSURE_SINGLE_ARG(message, NSString);    
}

- (void)crash:(id)message
{
    
}
    
- (void)recordCustomException:(id)params
{
    NSString *name = params[@"name"];
    NSString *reason = params[@"reason"];
    NSArray<NSString *> *frames = params[@"frames"];
    
    NSMutableArray<FIRStackFrame *> *frameArray = [NSMutableArray arrayWithCapacity:frames.count];
    
    for (NSString *frame in frames) {
        [frameArray addObject:[FIRStackFrame stackFrameWithSymbol:frame]];
    }
    
    [[FIRCrashlytics crashlytics] recordCustomExceptionName:name
                                                     reason:reason
                                                 frameArray:frameArray];
}
    
    
    - (void)setUserIdentifier:(id)userIdentifier
    {
        ENSURE_SINGLE_ARG(userIdentifier, NSString);
        [[FIRCrashlytics crashlytics] setUserID:userIdentifier];
    }

       
    - (void)initialize:(id)args
    {
        ENSURE_SINGLE_ARG(args, NSDictionary);
        BOOL debuggable = [TiUtils boolValue:[args valueForKey:@"debuggable"] def:NO];
        NSLog(@"CRASHLYTICS IS DEBUGGABLE? %d",debuggable);
        [Fabric.sharedSDK setDebug:debuggable];
    }

    - (void)throwException:(id)unused
    {
        [[FIRCrashlytics crashlytics]  throwException];
    }

    - (void)setString:(id)args
    {
        // This method exposings a native method that accepts 2
        // arguments (2 string values)
        // Arguments from JavaScript are passed to the native methods as an NSArray
        
        enum Args {
            kArgValue = 0,
            kArgKey,
            kArgCount
        };
        
        // Validate correct number of arguments
        ENSURE_ARG_COUNT(args, kArgCount);
        
        // Use the TiUtils methods to get the values from the arguments
        NSString *value = [TiUtils stringValue:[args objectAtIndex:kArgValue]];
        NSString *key = [TiUtils stringValue:[args objectAtIndex:kArgKey]];
        [[FIRCrashlytics crashlytics] setObjectValue:(id)value forKey:(NSString *)key];
    }

    - (void)setInt:(id)args
    {
        // This method exposings a native method that accepts 2
        // arguments (1 string and 1 int value)
        // Arguments from JavaScript are passed to the native methods as an NSArray
        
        enum Args {
            kArgValue = 0,
            kArgKey,
            kArgCount
        };
        
        // Validate correct number of arguments
        ENSURE_ARG_COUNT(args, kArgCount);
        
        // Use the TiUtils methods to get the values from the arguments
        NSInteger value = [TiUtils intValue:[args objectAtIndex:kArgValue]];
        NSString *key = [TiUtils stringValue:[args objectAtIndex:kArgKey]];
        [[FIRCrashlytics crashlytics] setIntValue:(int)value forKey:(NSString *)key];
    }

    - (void)setBool:(id)args
    {
        // This method exposings a native method that accepts 2
        // arguments (2 string values)
        // Arguments from JavaScript are passed to the native methods as an NSArray
        
        enum Args {
            kArgValue = 0,
            kArgKey,
            kArgCount
        };
        
        // Validate correct number of arguments
        ENSURE_ARG_COUNT(args, kArgCount);
        
        // Use the TiUtils methods to get the values from the arguments
        BOOL value = [TiUtils boolValue:[args objectAtIndex:kArgValue]];
        NSString *key = [TiUtils stringValue:[args objectAtIndex:kArgKey]];
        [[FIRCrashlytics crashlytics] setBoolValue:(int)value forKey:(NSString *)key];
    }
@end

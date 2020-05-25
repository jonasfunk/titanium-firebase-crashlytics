/**
 * firebaseCrashlytics
 *
 * Created by Your Name
 * Copyright (c) 2018 Your Company. All rights reserved.
 */

#import "TiModule.h"

@interface FirebaseCrashlyticsModule : TiModule {

}

- (void)crash:(id)message;
    
    
    /**
     *  Log a Custom Event to see user actions that are uniquely important for your app in real-time.
     *
     *  @params args The log message and additional arguments
     */
- (void)log:(NSArray *)args;
    
    /**
     *  Specify a user identifier which will be visible in the Crashlytics UI.
     *
     *  @param userIdentifier An user identifier
     */
- (void)setUserIdentifier:(id)userIdentifier;
    
    /**
     *  Specify a user name which will be visible in the Crashlytics UI.
     *
     *  @param userName An user name
     */
- (void)setUserName:(id)userName;
    
    /**
     *  Specify a user email which will be visible in the Crashlytics UI.
     *
     *  @param userIdentifier An user email
     */
- (void)setUserEmail:(id)userEmail;
    
    /**
     *  This method can be used to record a single exception structure in a report.
     *
     *  @param params The exception parameters
     */
- (void)recordCustomException:(id)params;
    
    /**
     *  The easiest way to cause a crash with an exception - great for testing.
     *
     *  @param unused An unused proxy parameter
     */
- (void)throwException:(id)unused;

- (void)initialize:(id)params;
- (void)setString:(id)args;
- (void)setInt:(id)args;
- (void)setBool:(id)args;

@end

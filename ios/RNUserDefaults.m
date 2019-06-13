
#import "RNUserDefaults.h"

@implementation RNUserDefaults

NSString* defaultSuiteName = nil;

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

- (NSUserDefaults *) getDefaultUser{
    if(defaultSuiteName == nil){
        NSLog(@"No prefer suite for userDefaults. Using standard one.");
        return [NSUserDefaults standardUserDefaults];
    } else {
        NSLog(@"Using %@ suite for userDefaults", defaultSuiteName);
        return [[NSUserDefaults alloc] initWithSuiteName:defaultSuiteName];
    }
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(objectForKey:(NSString *)key
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject) {
    
    resolve([[self getDefaultUser] objectForKey:key]);
}

RCT_EXPORT_METHOD(setName:(NSString *)name
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject)
{
    defaultSuiteName = name;
    resolve([NSNull null]);
}

RCT_EXPORT_METHOD(get:(NSString *)key
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject)
{
    resolve([[self getDefaultUser] stringForKey:key]);
}

RCT_EXPORT_METHOD(set:(NSString *)key value:(NSString *)value
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject)
{
    [[self getDefaultUser] setObject:value forKey:key];
    resolve([NSNull null]);
}

RCT_EXPORT_METHOD(clear:(NSString *)key
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject)
{
    [[self getDefaultUser] removeObjectForKey:key];
    resolve([NSNull null]);
}

@end

#import "RNUserDefaults.h"

@implementation RNUserDefaults

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

+ (NSUserDefaults *)getDefaultUser {
    NSString *suiteName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"AppGroup"];
    if(suiteName == nil){
        return [NSUserDefaults standardUserDefaults];
    } else {
        return [[NSUserDefaults alloc] initWithSuiteName:suiteName];
    }
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setObjectForKey:(NSString *)key object:object
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject) {

    [[RNUserDefaults getDefaultUser] setObject:object forKey:key];
    
    resolve([NSNull null]);
}

RCT_EXPORT_METHOD(objectForKey:(NSString *)key
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject) {
    
    resolve([[RNUserDefaults getDefaultUser] objectForKey:key]);
}

RCT_EXPORT_METHOD(get:(NSString *)key
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject)
{
    resolve([[RNUserDefaults getDefaultUser] stringForKey:key]);
}

RCT_EXPORT_METHOD(set:(NSString *)key value:(NSString *)value
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject)
{
    [[RNUserDefaults getDefaultUser] setObject:value forKey:key];
    resolve([NSNull null]);
}

RCT_EXPORT_METHOD(clear:(NSString *)key
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject)
{
    [[RNUserDefaults getDefaultUser] removeObjectForKey:key];
    resolve([NSNull null]);
}

RCT_EXPORT_METHOD(clearMultiple:(NSArray *)keys
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject)
{
    for(NSString *key in keys) {
        [[RNUserDefaults getDefaultUser] removeObjectForKey:key];
    }
    resolve([NSNull null]);
}

RCT_EXPORT_METHOD(clearAll:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
    NSArray *keys = [[[RNUserDefaults getDefaultUser] dictionaryRepresentation] allKeys];
    [self clearMultiple:keys resolve:resolve reject:reject];
}

@end

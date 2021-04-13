#import <CoreFoundation/CFNumber.h>
#include <CoreFoundation/CFPreferences.h>
#include <Dispatch/queue.h>

static __attribute__((constructor)) void Init() {
    CFPreferencesSetAppValue(CFSTR("SBDontLockAfterCrash"), kCFBooleanTrue, CFSTR("com.apple.springboard"));

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 7.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        CFPreferencesSetAppValue(CFSTR("SBDontLockAfterCrash"), kCFBooleanFalse, CFSTR("com.apple.springboard"));
    });
}

#import <CoreFoundation/CFNumber.h>
#include <CoreFoundation/CFPreferences.h>

static __attribute__((destructor)) void deInit() {
    CFPreferencesSetAppValue(CFSTR("SBDontLockAfterCrash"), kCFBooleanFalse, CFSTR("com.apple.springboard"));
}

static __attribute__((constructor)) void Init() {
    CFPreferencesSetAppValue(CFSTR("SBDontLockAfterCrash"), kCFBooleanTrue, CFSTR("com.apple.springboard"));
}
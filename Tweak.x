%group SBBootDefaults
%hook SBBootDefaults
-(BOOL)dontLockAfterCrash{
    return YES;
}
%end //SBBootDefaults
%end

static Boolean (*orig_CFPreferencesGetAppBooleanValue)(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat);
static Boolean my_CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat){
    if(CFEqual(CFSTR("SBDontLockAfterCrash"),key)){
        MSHookFunction((void *)CFPreferencesGetAppBooleanValue, (void *)orig_CFPreferencesGetAppBooleanValue, NULL);
        return YES;
    }
    return orig_CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

%ctor{
    NSLog(@"NoPassAfterRespring");
    if(@available(iOS 9.0, *)){
        %c(SBBootDefaults);//not work on iOS 10 without this line
        %init(SBBootDefaults);
    }
    else{
        MSHookFunction((void *)CFPreferencesGetAppBooleanValue, (void *)my_CFPreferencesGetAppBooleanValue, (void **)&orig_CFPreferencesGetAppBooleanValue);
    }
    

}

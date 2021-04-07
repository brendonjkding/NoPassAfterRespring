%group SBBootDefaults
%hook SBBootDefaults
-(BOOL)dontLockAfterCrash{
    return YES;
}
%end //SBBootDefaults
%end

%group CFPreferencesGetAppBooleanValue
%hookf(Boolean, CFPreferencesGetAppBooleanValue, CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat){
    if(CFEqual(CFSTR("SBDontLockAfterCrash"),key)){
        return YES;
    }
    return %orig;
}
%end//CFPreferencesGetAppBooleanValue

%ctor{
    NSLog(@"NoPassAfterRespring");
    if(@available(iOS 9.0, *)){
        %c(SBBootDefaults);//not work on iOS 10 without this line
        %init(SBBootDefaults);
    }
    else{
        %init(CFPreferencesGetAppBooleanValue);
    }
    

}

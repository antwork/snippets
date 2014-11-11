// application:didFinishLauching
// @application_didFinishLauching_functions
//
// IDECodeSnippetCompletionPrefix: @application_didFinishLauching_functions
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: 20E9E44D-6736-45DE-A399-B41BF7B8DDAC
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetPlatformFamily: iphoneos
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
- (void)extendSetups{
    //配置内支付
    [[CCIAPCenter sharedInstance] addIapHelperByClassName:@"<#NSString#>"];
    
    // 配置广告
    CCAdMoGoObserver *observer = [[CCAdMoGoObserver alloc] initWithAppKey:
                                  [Utility iPad] ? @"<#NSString#>" : @"<#NSString#>"
                                                                   adType:[Utility iPad] ? AdViewTypeLargeBanner : AdViewTypeNormalBanner
                                                              expressMode:YES];
    [observer setViewController:<#UIViewController#>];
    [[CCADManager sharedInstance] setAdObserver:observer];
    [observer release];
    
    //添加分享
    [self setupShareSDK];
    
    //添加友盟
    [MobClick startWithAppkey:<#NSString#>];
    
    // 添加友盟渠道跟踪
    [self addUMSupport];
}

- (void)setupShareSDK
{
    //添加分享
    [ShareSDK registerApp:<#NSString#>];
    [ShareSDK ssoEnabled:NO];
    
    //添加新浪微博应用
    [ShareSDK connectSinaWeiboWithAppKey:@"2135569555"
                               appSecret:@"c310c0736ae393f59508c95e03ae80db"
                             redirectUri:@"http://linghit.ggwan.com/Login/sina"];
    //添加腾讯微博应用
    [ShareSDK connectTencentWeiboWithAppKey:@"cb779c36cbcf46ec98d0234d33d646ad"
                                  appSecret:@"0e6f70a01a7c6c55e2baf4f92c6157dc"
                                redirectUri:@"http://s.ggwan.com"];
}

// 添加友盟渠道跟踪
- (void)addUMTrackSupport {
    NSString * appKey = @"<#NSString#>";
    NSString * deviceName = [[[UIDevice currentDevice] name] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * mac = [self macString];
    NSString * urlString = [NSString stringWithFormat:@"http://log.umtrack.com/ping/%@/?devicename=%@&mac=%@", appKey,deviceName,mac];
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:urlString]] delegate:nil];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self registerLocalNotifications];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // 注册远程消息成功
    [BaokuLib registerPushNotificationSuccessWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"error %@", error.localizedDescription);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // 收到远程消息
    [BaokuLib applicationRecievePushNotification:userInfo];
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
}

- (void)handleLocationNotification:(UILocalNotification *)notification hasAlert:(BOOL)hasAlert {
    if (notification != nil) {
        NSDictionary *userInfo = [notification userInfo];
        self.userInfo = userInfo;
        if (hasAlert) {
            NSString *alertBody = [notification alertBody];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[@"运势提醒" toLocal] message:alertBody delegate:self cancelButtonTitle:[@"关闭" toLocal] otherButtonTitles:[@"前去查看" toLocal], nil];
            [alert show];
            [alert release];
        } else {
            [self handleLocationNotificationWithUserInfo:self.userInfo];
        }
        CLog(@"userInfo %@", userInfo);
    }
}

- (NSString * )macString{
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *macString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return macString;
}
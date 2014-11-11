// didFinishLauching_setups
// @application_didFinishLauching
//
// IDECodeSnippetCompletionPrefix: @application_didFinishLauching
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: DCE9CF33-CDFD-4DF9-9B30-79FC2C03DD87
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetPlatformFamily: iphoneos
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
// Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.<#Class#> = [[[<#Class#> alloc] initWithNibName:@"<#Class#>" bundle:nil] autorelease];
    } else {
        self.<#Class#> = [[[<#Class#> alloc] initWithNibName:@"<#Class#>" bundle:nil] autorelease];
    }
    
    _navigationController = [[UINavigationController alloc] initWithRootViewController:self.<#Class#>];
    self.window.rootViewController = self.navigationController;
    
    [self.window makeKeyAndVisible];
    
    // 添加扩展配置
    [self extendSetups];
    
    //显示灵机视频
    [CCMVLoading showMV];
    
    // 开始宝库
    [BaokuLib startWithRootViewController:self.window.rootViewController withLaunchOptions:launchOptions withRegisterRemoteNotifecationTypes:UIRemoteNotificationTypeBadge andAppItunesId:<#NSString#> enableRateRemind:YES];
    [[BaokuLib shareBaokuViewController] setCommentNoticePopupBaseTime:5 andRepeatTime:2];
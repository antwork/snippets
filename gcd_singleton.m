// gcd_singleton
// @singleton
//
// IDECodeSnippetCompletionPrefix: @singleton
// IDECodeSnippetCompletionScopes: [ClassImplementation]
// IDECodeSnippetIdentifier: EC8F3E3A-B9B3-4BE3-BCEB-8DCEE627E9EF
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
+ (instancetype)sharedInstance {
    static <#Class#> *_<#id#>;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        <#id#> = [[<#id#> alloc] init];
    });
    
    return <#id#>;
}
// Notification
// @notification
//
// IDECodeSnippetCompletionPrefix: @notification
// IDECodeSnippetCompletionScopes: [CodeExpression]
// IDECodeSnippetIdentifier: 84587A91-678A-4727-9EBA-6F9D327EF485
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(<#methodName#>) name:kLoginNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  // post notification
  NSDictionary * userInfo = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:200] forKey:@"code"];
[[NSNotificationCenter defaultCenter] postNotificationName:<#notification_name#> object:self userInfo:userInfo];

- (void)<#functionname#>:(NSNotification*)notification {
    
    
}

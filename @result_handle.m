// @result_handle
// @result_handle
//
// IDECodeSnippetCompletionPrefix: @result_handle
// IDECodeSnippetCompletionScopes: [CodeBlock]
// IDECodeSnippetIdentifier: DDD57420-8A30-497E-BA4F-764DD6A8A738
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
if (success) {
    [weakSelf showHUDInViewController:self title:@"请求成功"];
} else {
    [weakSelf showHUDInViewController:self title:@"请求失败"];
}

[weakSelf hideHudAfterDelay:1.5];
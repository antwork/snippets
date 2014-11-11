// UIApplication IgnoringInteractionEvents
// @beginIgnoringInteractionEvents
//
// IDECodeSnippetCompletionPrefix: @beginIgnoringInteractionEvents
// IDECodeSnippetCompletionScopes: [CodeBlock]
// IDECodeSnippetIdentifier: 71018DC7-375D-4E4D-B707-68F5CC2940BD
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetPlatformFamily: iphoneos
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
// 开始忽略用户点击事件
[[UIApplication sharedApplication] beginIgnoringInteractionEvents];

// 停止忽略用户点击事件
if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
    [[UIApplication sharedApplication] endIgnoringInteractionEvents];
}
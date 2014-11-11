// UIBarButtonItem
// UIBarButtonItem_
//
// IDECodeSnippetCompletionPrefix: UIBarButtonItem_
// IDECodeSnippetCompletionScopes: [CodeBlock]
// IDECodeSnippetIdentifier: 9CF362BD-F7A2-47CC-8122-BA4730FD1A70
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
    self.title = @"<#NSString#>";
    
    UIBarButtonItem *leftItem= [[UIBarButtonItem alloc] initWithTitle:<#(NSString *)#> style:UIBarButtonItemStyleBordered target:self action:@selector(<#selector#>)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:<#(NSString *)#> style:UIBarButtonItemStyleBordered target:self action:@selector(<#selector#>)];

    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
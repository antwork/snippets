// UIAlertview(Input)
// UIAlertView_input
//
// IDECodeSnippetCompletionPrefix: UIAlertView_input
// IDECodeSnippetCompletionScopes: [CodeBlock]
// IDECodeSnippetIdentifier: 6A1BB34C-BBDA-46F2-A69B-53A27CF51EDA
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"<#string#>"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"<#string#>"
                                          otherButtonTitles:@"<#string#>",nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.tag = <#NSNumber#>;
    UITextField *textField = [alert textFieldAtIndex:0];
    textField.placeholder = @"<#string#>";
    textField.text = @"<#string#>";
    [alert show];
    [alert release];
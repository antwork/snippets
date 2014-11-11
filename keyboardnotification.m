// KeyboardNotification
// @keyboard_notification
//
// IDECodeSnippetCompletionPrefix: @keyboard_notification
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: D57DB338-A74A-4B47-95C7-F8BF627FAED8
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
- (void)keyboardWasShow:(NSNotification *)notification {
    NSDictionary* info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    oldInsets = self.scrollView.contentInset;
    UIEdgeInsets contentInsets = oldInsets;
    contentInsets.bottom = kbSize.height;
    
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    CGFloat contentSizeY = self.scrollView.contentSize.height;
    CGFloat frameHeight = self.scrollView.bounds.size.height;
    [UIView animateWithDuration:0.2 animations:^{
        [self.scrollView setContentOffset:CGPointMake(0, contentSizeY - (frameHeight - kbSize.height)) animated:YES];
    }];
}

- (void)keyboardWillBeHidden:(NSNotification *)notification {
    self.scrollView.contentInset = oldInsets;
    self.scrollView.scrollIndicatorInsets = oldInsets;
    [UIView animateWithDuration:0.2 animations:^{
        [self.scrollView scrollsToTop];
    }];
}

- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)unregisterForKeyboardNotifications{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}
// UITextViewKeyboard
// UITextViewKeyboard
//
// IDECodeSnippetCompletionPrefix: @UITextViewKeyboard
// IDECodeSnippetCompletionScopes: [ClassImplementation]
// IDECodeSnippetIdentifier: D6925641-819A-4393-A89E-791F0950BFFA
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self registerForKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self unregisterForKeyboardNotifications];
}

- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
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


- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary* info = [notification userInfo];
    CGFloat keyboardHeight = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [self setTableViewBottomInset:keyboardHeight];
    
    [self showCursorLocationAfterDelay:duration];
}

- (void)keyboardWillBeHidden:(NSNotification *)notification {

}


- (void)showCursorLocationAfterDelay:(CGFloat)delay {
    CGRect caretRect = [self.textView caretRectForPosition:self.textView.selectedTextRange.end];
    
    //This is the visible rect of the textview.
    CGRect visibleRect = self.textView.bounds;
    visibleRect.size.height -= (self.textView.contentInset.top + self.textView.contentInset.bottom);
    visibleRect.origin.y = self.textView.contentOffset.y;
    
    if (!CGRectContainsRect(visibleRect, caretRect)) {
        CGPoint newOffset = self.textView.contentOffset;
        
        newOffset.y = MAX((caretRect.origin.y + caretRect.size.height) - visibleRect.size.height + 5, 0);
        
        [UIView animateWithDuration:0.2 delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [self.textView setContentOffset:newOffset];
        } completion:nil];
    }
}

- (void)setTableViewBottomInset:(CGFloat)bottom {
    UIEdgeInsets inset = self.textView.contentInset;
    inset.bottom = bottom;
    self.textView.contentInset = inset;
    self.textView.scrollIndicatorInsets = inset;
}

- (void)textViewDidChange:(UITextView *)textView {
    [self showCursorLocationAfterDelay:0.0f];
}
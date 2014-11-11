// @constraintNew
// @constraintNew
//
// IDECodeSnippetCompletionPrefix: @constraintNew
// IDECodeSnippetCompletionScopes: [All]
// IDECodeSnippetIdentifier: F70F272F-CA8B-4731-B07A-8C8C26307301
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:<#...#> attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:<#...#>.0f];
    [<#...#> addConstraint:widthConstraint];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:<#...#> attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:<#...#>.0f];
    [<#...#> addConstraint:heightConstraint];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:<#...#> attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:<#...#> attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:<#...#>.0f];
    [<#...#> addConstraint:centerXConstraint];
    
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:<#...#> attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:<#...#> attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:<#...#>.0f];
    [<#...#> addConstraint:centerYConstraint];
    
    
    UIView *layoutView = <#id#>;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[layoutView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(layoutView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[layoutView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(layoutView)]];
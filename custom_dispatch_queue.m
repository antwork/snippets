// Custom dispatch queue
// @custom_dispatch
//
// IDECodeSnippetCompletionPrefix: @custom_dispatch
// IDECodeSnippetCompletionScopes: [CodeBlock]
// IDECodeSnippetIdentifier: 1C071233-5D65-4101-9C7C-A43509BB57B8
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
    dispatch_queue_t urls_queue = dispatch_queue_create("com.elctech.image_queue", NULL);
    
    dispatch_async(urls_queue, ^{
        [self getImageUrls];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self downloadImages];
        });
    });
    
    dispatch_release(urls_queue);
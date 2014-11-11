// LightOnOff
// turn on light or turn off light
//
// IDECodeSnippetCompletionPrefix: @lightonoff
// IDECodeSnippetCompletionScopes: [CodeBlock]
// IDECodeSnippetIdentifier: 7DCCE241-9C30-47B2-94B5-89AF16F8D92E
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// IDECodeSnippetVersion: 2
AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        
        AVCaptureTorchMode mode = [device torchMode];
        AVCaptureTorchMode nextModel;// = mode == ?
        if (mode == AVCaptureTorchModeOn) {
            nextModel = AVCaptureTorchModeOff;
        } else if (mode == AVCaptureTorchModeOff) {
            nextModel = AVCaptureTorchModeOn;
        }
        
        [device lockForConfiguration:nil];
        [device setTorchMode:nextModel];  // use AVCaptureTorchModeOff to turn off
        [device unlockForConfiguration];
    }
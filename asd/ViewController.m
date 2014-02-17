//
//  ViewController.m
//  asd
//
//  Created by crazypoo on 13-7-4.
//  Copyright (c) 2013年 crazypoo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeInputMode:) name:UITextInputCurrentInputModeDidChangeNotification object:nil];
    UITextView *lol = [[UITextView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:lol];
    // Do any additional setup after loading the view, typically from a nib.
}

UIView *resignFirstResponder(UIView *theView)
{
    if([theView isFirstResponder])
    {
        [theView resignFirstResponder];
        return theView;
    }
    for(UIView *subview in theView.subviews)
    {
        UIView *result = resignFirstResponder(subview);
        if(result) return result;
    }
    return nil;
}

-(void)changeInputMode:(NSNotification *)notification{
    NSString *inputMethod = [[UITextInputMode currentInputMode] primaryLanguage];
        NSString *modeIdentifier = [[UITextInputMode currentInputMode] respondsToSelector:@selector(identifier)] ? (NSString *)[[UITextInputMode currentInputMode] performSelector:@selector(identifier)] : nil;
    
    NSLog(@"inputMethod=%@----%@",inputMethod,modeIdentifier);
    if([inputMethod isEqualToString:@"emoji"])
    {
        [UIView setAnimationsEnabled:NO];
        UIView *resigned = resignFirstResponder([UIApplication sharedApplication].keyWindow);
        [resigned becomeFirstResponder];
        [UIView setAnimationsEnabled:YES];
    }
    if ([inputMethod isEqualToString:@"emoji"])
    {
        NSLog(@"---------------");
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

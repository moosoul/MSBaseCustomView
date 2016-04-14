//
//  ViewController.m
//  MSBaseCustomView
//
//  Created by moosoul on 4/11/16.
//  Copyright © 2016 moosoul. All rights reserved.
//

#import "ViewController.h"
#import "MSSliderView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MSSliderView *sliderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    MSSliderView *sliderView = [[MSSliderView alloc] initWithFrame:CGRectMake(0, 300, 320, 64)];
//    sliderView.fontSize = 15.0f;
//    sliderView.selectedFontSizeBold = YES;
//    sliderView.defaultSelectedIndex = 0;
//    sliderView.scrollAnimated = YES;
//    sliderView.showUnderline = YES;
//    sliderView.underlineHeight = 3.0f;
//    sliderView.datasource = [NSMutableArray arrayWithArray:@[@"AAAAAAAAAA", @"VCDADSDASD", @"AA", @"CCCCS"]];
//
//    [self.view addSubview:sliderView];

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setSliderView:(MSSliderView *)sliderView
{
    sliderView.fontSize = 14.0f;
    sliderView.selectedFontSizeBold = YES;
    sliderView.defaultSelectedIndex = 0;
    sliderView.scrollAnimated = YES;
    sliderView.showUnderline = YES;
    sliderView.underlineHeight = 3.0f;
    sliderView.margin = 32.0f;
    sliderView.datasource = [NSMutableArray arrayWithArray:@[@"AAAAAAAAAA", @"VCDADSDASD", @"AA", @"CCCCS", @"CCCCC", @"CCCCC", @"CCCCC", @"CCCCC"]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [sliderView selectItemAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0] animated:YES];
    });
    
    _sliderView = sliderView;
}


@end

//
//  commonViewController.m
//  HelloWorld
//
//  Created by Wendy Lorimer on 4/1/14.
//  Copyright (c) 2014 WendyLorimer. All rights reserved.
//

#import "commonViewController.h"
#import "fakeData.h"

@interface commonViewController ()

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *dataDisplayLabelArray;
@property (strong, nonatomic) NSTimer *aTimer;
@property (weak, nonatomic) IBOutlet UIButton *resetJoulesButton;
@property double secondsLast;
@property double elapsedSeconds;
@property (weak, nonatomic) IBOutlet UILabel *elapsedTimeLabel;

@end


@implementation commonViewController

- (IBAction)resetJoules:(UIButton *)sender {
    self.elapsedSeconds = 0;
    self.elapsedTimeLabel.text = [NSString stringWithFormat:@"%g seconds",self.elapsedSeconds];

}

#define DEFAULT_TIME_INCREMENT 1;

@synthesize timerIntervalInSeconds = _timerIntervalInSeconds;

-(int)timerIntervalInSeconds    // the getter for the timer increment
{
    if (_timerIntervalInSeconds <= 0 ) {
        return DEFAULT_TIME_INCREMENT;
    } else {
        return _timerIntervalInSeconds;
    }

}
-(void)setTimerIntervalInSeconds:(int)timerIntervalInSeconds
{
    if (timerIntervalInSeconds != _timerIntervalInSeconds) {
           _timerIntervalInSeconds = timerIntervalInSeconds;
    }
}

-(void)timerFired:(NSTimer *) theTimer
{
    double secondsNow = CFAbsoluteTimeGetCurrent();
    for (int i=0; i<[self.dataDisplayLabelArray count]; i++) {
        fakeData *data =[[fakeData alloc] init];
        UILabel *label = self.dataDisplayLabelArray[i];
        label.text = [NSString stringWithFormat:@"data = %d",[data dataPoint:1024]];
        }
    if (self.secondsLast) {
        self.elapsedSeconds = self.elapsedSeconds+ secondsNow-self.secondsLast;
        self.elapsedTimeLabel.text = [NSString stringWithFormat:@"%g seconds",self.elapsedSeconds];
    }
    self.secondsLast = secondsNow;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.aTimer = [NSTimer scheduledTimerWithTimeInterval:self.timerIntervalInSeconds
                                              target:self
                                            selector:@selector(timerFired:)
                                          userInfo:nil
                                             repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

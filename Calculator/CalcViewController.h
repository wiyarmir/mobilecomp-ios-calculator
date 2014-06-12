//
//  CalcViewController.h
//  Calculator
//
//  Created by Guillermo Orellana on 11/06/14.
//  Copyright (c) 2014 Guillermo Orellana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalcViewController : UIViewController

- (IBAction)zero:(id)sender;
- (IBAction)one:(id)sender;
- (IBAction)two:(id)sender;
- (IBAction)three:(id)sender;
- (IBAction)four:(id)sender;
- (IBAction)five:(id)sender;
- (IBAction)six:(id)sender;
- (IBAction)seven:(id)sender;
- (IBAction)eight:(id)sender;
- (IBAction)nine:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)dot:(id)sender;
- (IBAction)backspace:(id)sender;
- (IBAction)eq:(id)sender;
- (IBAction)plus:(id)sender;
- (IBAction)minus:(id)sender;
- (IBAction)times:(id)sender;
- (IBAction)fraction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *opdisplay;

typedef enum{
    EQ, ADD,SUB,MUL,DIV
} OpsType;

@end

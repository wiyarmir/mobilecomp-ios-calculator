//
//  CalcViewController.m
//  Calculator
//
//  Created by Guillermo Orellana on 11/06/14.
//  Copyright (c) 2014 Guillermo Orellana. All rights reserved.
//

#import "CalcViewController.h"

@interface CalcViewController () {
    NSString *stack;
    double result;
    OpsType lastop;
}

@end

@implementation CalcViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self clear:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zero:(id)sender {
    [self addnumber: 0];
}

- (IBAction)one:(id)sender {
    [self addnumber: 1];
}

- (IBAction)two:(id)sender {
    [self addnumber: 2];
}

- (IBAction)three:(id)sender {
    [self addnumber: 3];
}

- (IBAction)four:(id)sender {
    [self addnumber: 4];
}

- (IBAction)five:(id)sender {
    [self addnumber: 5];
}

- (IBAction)six:(id)sender {
    [self addnumber: 6];
}

- (IBAction)seven:(id)sender {
    [self addnumber: 7];
}

- (IBAction)eight:(id)sender {
    [self addnumber: 8];
}

- (IBAction)nine:(id)sender {
    [self addnumber: 9];
}

- (IBAction)clear:(id)sender {
    stack = @"0";
    result = 0.0;
    [_display setText:stack];
}

- (IBAction)dot:(id)sender {
    [self adddot];
}

- (IBAction)backspace:(id)sender {
    [self addnumber: -1];
}

- (IBAction)eq:(id)sender {
    [self logic: EQ];
}

- (IBAction)plus:(id)sender {
    [self logic: ADD];
}

- (IBAction)minus:(id)sender {
    [self logic: SUB];
}

- (IBAction)times:(id)sender {
    [self logic: MUL];
}

- (IBAction)fraction:(id)sender {
    [self logic: DIV];
}

-(void)addnumber:(int)number{
    
    if(stack == NULL){
        stack = @"0";
    }
    
    if(number > -1){
        if (![stack compare:@"0" ] ) {
            stack = [NSString stringWithFormat:@"%1$d", number];
        }else{
            stack = [NSString stringWithFormat:@"%1$@%2$d", stack, number];
        }
    }else if([stack length] > 0){
        stack = [stack substringToIndex:[stack length] + number];
    }
    
    if([stack length] <= 0){
        stack = @"";
    }
    
    [_display setText:stack];
}

-(void)adddot{
    stack = [NSString stringWithFormat:@"%1$@.", stack];
    [_display setText:stack];
}


-(void)logic:(OpsType)type{
    if(type == EQ){
        switch (lastop) {
            case ADD:
                stack = [NSString stringWithFormat:@"%f", [stack doubleValue] + result];
                break;
                
            case SUB:
                stack = [NSString stringWithFormat:@"%f", result - [stack doubleValue]];
                break;
                
            case MUL:
                stack = [NSString stringWithFormat:@"%f", [stack doubleValue] * result];
                break;
                
            case DIV:
                stack = [NSString stringWithFormat:@"%f", result / [stack doubleValue]];
                break;
            default:
                break;
        }
        [_opdisplay setText:@"="];
        
    }else{
        switch (type) {
            case ADD:
                [_opdisplay setText:@" "];
                break;
            case SUB:
                [_opdisplay setText:@"-"];
                break;
            case MUL:
                [_opdisplay setText:@"x"];
                break;
            case DIV:
                [_opdisplay setText:@"/"];
                break;
                
            default:
                break;
        }
        lastop = type;
        result = [stack doubleValue];
        stack = @"0";
    }
    [_display setText: stack];
}


@end

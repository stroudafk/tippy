//
//  TipViewController.m
//  tippy
//
//  Created by Sj Stroud on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercantageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;

@end

@implementation TipViewController

- (void)viewDidLoad {
    self.billAmountField.placeholder = @"$";
    [self.billAmountField becomeFirstResponder];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    
    [self.view endEditing:(true)];
}
- (IBAction)updateLabels:(id)sender {
    if (self.billAmountField.text.length == 0){
        [self hideLabels];
    }
    else {
        [self showLabels];
    }
    double tipPercentages[] = {0.15, 0.20, 0.25};
    double tipPercentage = tipPercentages[self.tipPercantageControl.selectedSegmentIndex];
    double bill = [self.billAmountField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
}
- (void) hideLabels {
    [UIView animateWithDuration:0.25 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y += 200;
        
        self.billAmountField.frame = billFrame;
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        labelsFrame.origin.y += 200;
        
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 0;
        
        
        billFrame.origin.y -= 200;
        labelsFrame.origin.y -= 200;
        self.billAmountField.frame = billFrame;
        self.labelsContainerView.frame = labelsFrame;
    }];

}

- (void) showLabels {
    [UIView animateWithDuration:0.35 animations:^{
        self.labelsContainerView.alpha = 3;
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

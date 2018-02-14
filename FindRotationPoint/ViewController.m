//
//  ViewController.m
//  FindRotationPoint
//
//  Created by Venkata Narasimham Peetla on 2/13/18.
//  Copyright © 2018 PEETLA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray<NSString *> *words =   @[@"knife", @"apple", @"cat", @"window", @"umbrella", @"van", @"dog", @"tiger", @"lion", @"cheetah"];
    NSUInteger rotationIndex = (unsigned long)FindRotationPoint(words);
    NSLog(@"Rotation Point index is %lu", rotationIndex);
    NSLog(@"Rotation Point  is %@", words[rotationIndex]);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Complexity: O(lgn) time and O(1) time.
NSUInteger FindRotationPoint(NSArray<NSString *> *words) {

    NSString *firstWord = words[0];
    NSUInteger floorIndex = 0;
    NSUInteger ceilingIndex = words.count - 1;

    while (floorIndex < ceilingIndex) {

        // guess a point halfway between floor and ceiling
        NSUInteger guessIndex = floorIndex + ((ceilingIndex - floorIndex) / 2);

        // if guess comes after first word or is the first word
        if ([words[guessIndex] compare:firstWord] >= NSOrderedSame) {
            NSLog(@"Right side");
            // go right
            floorIndex = guessIndex;
        }
        else {
            NSLog(@"Left side");
            // go left
            ceilingIndex = guessIndex;
        }

        // if floor and ceiling have converged
        if (floorIndex + 1 == ceilingIndex) {

            /* between floor and ceiling is where we flipped to the beginning
             so ceiling is alphabetically first */
            break;
        }
    }

    return ceilingIndex;
}

@end

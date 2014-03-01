//
//  CAMViewController.m
//  MergeSort
//
//  Created by Chris Meehan on 2/28/14.
//  Copyright (c) 2014 Chris Meehan. All rights reserved.
//

#import "CAMViewController.h"

@interface CAMViewController (){
    NSMutableArray *finalArray, *oddArray;
    BOOL isOdd;
}

@end

@implementation CAMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    isOdd = FALSE;
    
    NSMutableArray* theArray = [NSMutableArray arrayWithArray:@[@4,@7,@9,@1,@0,@29,@5,@3,@2,@6,@8,@11, @20, @15, @13, @17, @19]];

    finalArray = [NSMutableArray new];
    oddArray = [NSMutableArray new];

    for(int i = 0 ; i < theArray.count ;  i = i+2){
        if(i+1 != theArray.count){
            if([theArray[i]integerValue] > [theArray[i+1]integerValue]){
                NSMutableArray *newArray = [NSMutableArray new];
                [newArray addObject:theArray[i+1]];
                [newArray addObject:theArray[i]];
                
                [finalArray addObject:newArray];
                //swap em
            }
            else{
                NSMutableArray *newArray = [NSMutableArray new];
                [newArray addObject:theArray[i]];
                [newArray addObject:theArray[i+1]];
                
                [finalArray addObject:newArray];
                // no swap
            }
        } else {
            [finalArray[finalArray.count - 1] addObject:@[theArray[i]]];
            
            isOdd = TRUE;
        }
        
    }
    
    
    
    NSLog(@"%@", finalArray);
    
    [self mergeArrays];
    
//    NSLog(@"%@", finalArray);
    
    
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)mergeArrays
{

        NSMutableArray *tempArray = finalArray;
        finalArray = [NSMutableArray new];
        
        while (tempArray.count > 0) {
            NSMutableArray *array1 = tempArray[0];
            NSMutableArray *array2 = tempArray[1];
            NSMutableArray *sorted = [NSMutableArray new];
            
            while (array1.count !=0 && array2.count != 0) {
//                NSLog(@"%d", tempArray.count);
                
                //If first object in array 1 has greater value
                if ([array1[0] integerValue] > [array2[0] integerValue]) {
                    [sorted addObject:array2[0]];
                    [array2 removeObjectAtIndex:0];
                }
                //If first object in array 2 has greater value
                else if ([array1[0] integerValue] < [array2[0] integerValue]) {
                    [sorted addObject:array1[0]];
                    [array1 removeObjectAtIndex:0];
                }
                //If first object in array 1 and array 2 are equal
                else {
                    [sorted addObject:array1[0]];
                    [sorted addObject:array2[0]];
                    [array1 removeObjectAtIndex:0];
                    [array2 removeObjectAtIndex:0];
                }
            }
            
            //Remove remaining objects in array 1 (if any)
            while (array1.count > 0) {
                [sorted addObject:array1[0]];
                [array1 removeObjectAtIndex:0];
            }
            //Remove remaining objects in array 2 (if any)
            while (array2.count > 0) {
                [sorted addObject:array2[0]];
                [array2 removeObjectAtIndex:0];
            }
            
            [tempArray removeObjectAtIndex:0];
            [tempArray removeObjectAtIndex:0];
            [finalArray addObject:sorted];

        }
        
        if (finalArray.count != 1) {
                [self mergeArrays];
            
        } else  {
            
            NSLog(@"Final: %@", finalArray[0]);
        }
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

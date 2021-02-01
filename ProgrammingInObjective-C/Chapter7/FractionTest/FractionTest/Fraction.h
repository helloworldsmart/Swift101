//
//  Fraction.h
//  FractionTest
//
//  Created by Michael on 2021/2/1.
//

#import <Foundation/Foundation.h>

// The Fraction class

@interface Fraction : NSObject

@property int numerator, denominator;

-(void)    print;
-(void)    setTo: (int) n over: (int) d;
-(double)  convertToNum;

@end

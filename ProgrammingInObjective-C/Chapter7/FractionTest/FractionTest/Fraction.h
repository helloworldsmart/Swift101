//
//  Fraction.h
//  FractionTest
//
//  Created by Michael on 2021/2/1.
//

#import <Foundation/Foundation.h>

// The Fraction class

@interface Fraction : NSObject

-(void)    print;
-(void)    setNumerator: (int) n;
-(void)    setDenominator: (int) d;
-(int)     numerator;
-(int)     denominator;
-(double)  convertToNum;

@end

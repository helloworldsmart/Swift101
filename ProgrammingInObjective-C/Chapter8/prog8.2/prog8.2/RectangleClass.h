//
//  Rectangle.h
//  prog8.2
//
//  Created by Michael on 2021/2/2.
//

#import <Foundation/Foundation.h>

@interface RectangleClass : NSObject
@property int width, height;
-(void) setWidth: (int) w andHeight: (int) h;
-(int) area;
-(int) perimeter;
@end

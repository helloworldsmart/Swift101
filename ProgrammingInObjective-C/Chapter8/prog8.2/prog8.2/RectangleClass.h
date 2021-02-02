//
//  Rectangle.h
//  prog8.2
//
//  Created by Michael on 2021/2/2.
//

// TODO: Fuck bug: Cannot find interface declaration for 'NSObject', superclass of 'RectangleClass'
// Class 'RectangleClass' defined without specifying a base class

@interface RectangleClass : NSObject
@property int width, height;
-(void) setWidth: (int) w andHeight: (int) h;
-(int) area;
-(int) perimeter;
@end

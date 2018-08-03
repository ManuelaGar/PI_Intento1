//
//  OpenCVWrapper.h
//  PI_Intento1
//
//  Created by Manuela Garcia on 2/08/18.
//  Copyright © 2018 Manuela Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OpenCVWrapper : NSObject
    + (NSString *)openCVVersionString;
    - (void) isThisWorking;
    +(UIImage *)ConvertImage:(UIImage *)image;
@end

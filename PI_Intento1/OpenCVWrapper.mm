//
//  OpenCVWrapper.m
//  PI_Intento1
//
//  Created by Manuela Garcia on 2/08/18.
//  Copyright © 2018 Manuela Garcia. All rights reserved.
//

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import "OpenCVWrapper.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

using namespace std;
using namespace cv;

@implementation OpenCVWrapper
    
    + (NSString *)openCVVersionString {
        return [NSString stringWithFormat:@"OpenCV Version %s",  CV_VERSION];
    }

    - (void) isThisWorking {
        cout << "Hey" << endl;
    }
    
    +(UIImage *)ConvertImage:(UIImage *)image {
        
        int threshold_value = 0;
        int const max_BINARY_value = 2147483647;
        
        cv::Mat mat;
        UIImageToMat(image, mat);
        
        cv::Mat gray;
        cv::cvtColor(mat, gray, CV_RGB2GRAY);
        
//        cv::Mat hsv;
//        cv::cvtColor(mat, hsv, CV_RGB2HSV);
//
//        cv::InputArray lower_red();
//        lower_red() = {1,150,134};
//
//        cv::InputArray upper_red();
//        upper_red() = {1,150,134};
//        float upper_red[3] = {3,211,220};
//
//        cv::Mat mask;
//        cv::inRange(<#cv::InputArray src#>, <#cv::InputArray lowerb#>, <#cv::InputArray upperb#>, <#cv::OutputArray dst#>)
        
//        //    cv::Mat src_gray=[self cvMatFromUIImage:img.image];
//        cv::Mat dst;
//        dst = gray;
//        //    cv::cvtColor(src_gray, dst, cv::COLOR_RGB2GRAY);
//
//        cv::Mat canny_output;
//        std::vector<std::vector<cv::Point> > contours;
//        std::vector<cv::Vec4i> hierarchy;
//
//        cv::RNG rng(12345);
//
//        cv::threshold(dst, dst, threshold_value, max_BINARY_value,cv::THRESH_OTSU );
//
//        cv::Mat contourOutput = dst.clone();
//        cv::findContours( contourOutput, contours, cv::RETR_LIST, cv::CHAIN_APPROX_NONE );
//
//        //Draw the contours
//        cv::Mat contourImage(dst.size(), CV_8UC3, cv::Scalar(0,0,0));
//        cv::Scalar colors[3];
//        colors[0] = cv::Scalar(255, 0, 0);
//        colors[1] = cv::Scalar(0, 255, 0);
//        colors[2] = cv::Scalar(0, 0, 255);
//        for (size_t idx = 0; idx < contours.size(); idx++) {
//            cv::drawContours(contourImage, contours, idx, colors[idx % 3]);
//        }
        
//        cv::Mat bin;
//        cv::threshold(gray, bin, 0, 255, cv::THRESH_BINARY | cv::THRESH_OTSU);
//
//        cv::Mat gaussianBlur;
//        cv::GaussianBlur(gray, gaussianBlur, cv::Size(5,5), 2, 2);
//
//        cv::Mat edges;
//        cv::Canny(gaussianBlur, edges, 0, 50);
        
        UIImage *binImg = MatToUIImage(gray);
        return binImg;
    }

@end

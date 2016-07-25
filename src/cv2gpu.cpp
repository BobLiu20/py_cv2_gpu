// Done by Bob.Liu in 2016.07.25
#include <iostream>
#include <string>
#include <vector>

#include "cv2gpu.h"

using namespace cv;

cv2gpu::cv2gpu()
{
    
}

cv2gpu::~cv2gpu()
{

}

void cv2gpu::init()
{
    
}

int cv2gpu::getCudaEnabledDeviceCount()
{
   return cv::gpu::getCudaEnabledDeviceCount();
}

void cv2gpu::_matchTemplate(const Mat& image, const Mat& templ, int method, float *score, int *x, int *y)
{
    double minVal; double maxVal; Point minLoc; Point maxLoc;
    double matchVal;
    Point matchLoc;

    gpu::GpuMat d_src(image), d_templ(templ), d_dst;
    //d_templ.upload(templ);
    gpu::matchTemplate(d_src, d_templ, d_dst, method);
    gpu::minMaxLoc(d_dst, &minVal, &maxVal, &minLoc, &maxLoc);

    if(method  == CV_TM_SQDIFF || method == CV_TM_SQDIFF_NORMED)
    {
        matchVal = minVal;
        matchLoc = minLoc;
    }
    else
    {
        matchVal = maxVal;
        matchLoc = maxLoc;
    }

    *x = matchLoc.x;
    *y = matchLoc.y;
    *score = matchVal;
}

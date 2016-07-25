// Done by Bob.Liu in 2016.07.25
#ifndef __CV2GPU_H
#define __CV2GPU_H

#include "opencv2/core/core.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/gpu/gpu.hpp"

class cv2gpu
{
public:
    cv2gpu();
    ~cv2gpu();

    void init();
    int getCudaEnabledDeviceCount();
    void _matchTemplate(const cv::Mat& image, const cv::Mat& templ, int method, float *score, int *x, int *y);
};

#endif

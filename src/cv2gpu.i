/* -*- C -*-  (not really, but good for syntax highlighting) */
// Done by Bob.Liu in 2016.07.25
/* cv2gpu.i */
%module cv2gpu

%{
    #define SWIG_FILE_WITH_INIT
    #include "../inc/cv2gpu.h"
%}

%include stl.i
%include "typemaps.i"
%include numpy.i

%init %{
    import_array();
%}

%apply (unsigned char* IN_FARRAY3, int DIM1, int DIM2, int DIM3) {
        (unsigned char *arr_in1, int dim1_in1, int dim2_in1, int dim3_in1),
        (unsigned char *arr_in2, int dim1_in2, int dim2_in2, int dim3_in2)}
%apply float *OUTPUT { float *score, int *x, int *y };


%include "../inc/cv2gpu.h"
%extend cv2gpu{
    void cv2gpu::matchTemplate(unsigned char *arr_in1, int dim1_in1, int dim2_in1, int dim3_in1,
                                unsigned char *arr_in2, int dim1_in2, int dim2_in2, int dim3_in2,
                                int method,
                                float *score, int *x, int *y)
    {
        cv::Mat M1(dim1_in1, dim2_in1, CV_8UC3, arr_in1);
        cv::Mat M2(dim1_in2, dim2_in2, CV_8UC3, arr_in2);
        self->_matchTemplate(M1, M2, method, score, x, y);
    };
}

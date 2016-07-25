#! /bin/bash

rm build -rf
mkdir build

swig -python -c++  -o build/cv2gpu_wrap.cxx -Ilib src/cv2gpu.i

g++ -fPIC -std=c++11 -c src/cv2gpu.cpp -o build/cv2gpu.o\
    `pkg-config --cflags --libs opencv` \
    -I./inc -I/usr/local/include -I/usr/include -I/usr/include/python2.7 \
    -L/usr/local/cuda-7.5/lib64

g++ -fPIC -std=c++11 -c build/cv2gpu_wrap.cxx -o build/cv2gpu_wrap.o\
    `pkg-config --cflags --libs opencv` \
    -I./inc -I/usr/local/include -I/usr/include -I/usr/include/python2.7 \
    -L/usr/local/cuda-7.5/lib64

g++ -shared -std=c++11 build/cv2gpu.o build/cv2gpu_wrap.o -o build/_cv2gpu.so \
    `pkg-config --cflags --libs opencv` \
    -I/usr/include/python2.7 -I/usr/include -I/usr/local/include -L/usr/lib \
    -L/usr/local/lib -L/usr/local/cuda-7.5/lib64

cp build/_cv2gpu.so .
cp build/cv2gpu.py .

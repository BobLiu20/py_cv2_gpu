#!/usr/bin/env python
# Done by Bob.Liu in 2016.07.25

import os
import cv2
import sys
_mypath = os.path.abspath('./../')
sys.path.append(_mypath)
import cv2gpu

def main():
    _cv2gpu = cv2gpu.cv2gpu()
    print 'count = ', _cv2gpu.getCudaEnabledDeviceCount()
    _main_image = cv2.imread('main.jpg')
    _templ_image = cv2.imread('sub.jpg')
    print _cv2gpu.matchTemplate(_main_image, _templ_image, cv2.TM_CCOEFF_NORMED)

if __name__ == '__main__':
    main()

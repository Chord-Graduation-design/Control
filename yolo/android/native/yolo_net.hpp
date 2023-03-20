#pragma once

#include <net.h>

class Yolo{
    ncnn::Net net;
public:
    Yolo(){};
    ~Yolo(){};
    void load_model(char* model_path, char* param_path);
    void detect();
};
#include "yolo_net.hpp"


void Yolo::load_model(char* model_path, char* param_path){
    net.clear();
    net.opt = ncnn::Option();
    //加载模型
    net.load_param(param_path);
    net.load_model(model_path);

}
void Yolo::detect(){

}
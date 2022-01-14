import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

}

// Obter a altura proporcional de acordo com ao tamanho da tela
double getProportionateScreenHeight(double inputHeight){
  double screenHeight = SizeConfig.screenHeight;

  return (inputHeight / 812.0) * screenHeight;
}

// Obter a altura proporcional de acordo com a largura da tela
double getProportionateScreenWidth(double inputWidth){
  double screenWidth = SizeConfig.screenHeight;

  return (inputWidth / 375.0) * screenWidth;
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors/app_colors.dart';

class HomeController extends GetxController {
  Rx<Color> maleColor = AppColors.inactiveColor.obs;
  Rx<Color> femaleColor = AppColors.inactiveColor.obs;

  Rx<double> heightValue = 70.0.obs;
  Rx<int> weight = 60.obs;
  Rx<int> age = 25.obs;
  void male() {
    maleColor.value = AppColors.activeColor;
    femaleColor.value = AppColors.inactiveColor;
  }

  void famele() {
    femaleColor.value = AppColors.activeColor;
    maleColor.value = AppColors.inactiveColor;
  }

  void minuswight() {
    weight.value--;
  }

  void pluswight() {
    weight.value++;
  }

  void minusAge() {
    age.value--;
  }

  void plusAge() {
    age.value++;
  }
}

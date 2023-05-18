import 'dart:math';

import 'package:bmi_calculator_/constants/colors/app_colors.dart';
import 'package:bmi_calculator_/data/local/bmi_data.dart';
import 'package:bmi_calculator_/components/buttons/calculate_widjet.dart';
import 'package:bmi_calculator_/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  ResultPage();
  HomeController _controller = Get.put(HomeController());
  // final double height;
  //final int kg;

  @override
  Widget build(BuildContext context) {
    final bmi = BmiData.bmiCalculate(
      _controller.heightValue.value,
      _controller.weight.value,
    );

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Жыйынтык',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    BmiData.bmiResult(bmi).toString(),
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greenColor.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    BmiData.bmiCalculate(
                      _controller.heightValue.value,
                      _controller.weight.value,
                    ).toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 84,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Text(
                    BmiData.giveDescription(bmi).toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CalculateWidjet(
          text: 'Re-Calculate',
          onTap: () {
            Navigator.pop(context);
          }),
    );
  }
}

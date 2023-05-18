import 'package:bmi_calculator_/constants/colors/app_colors.dart';
import 'package:bmi_calculator_/modules/home/home_controller.dart';
import 'package:bmi_calculator_/modules/resuit/result_page.dart';
import 'package:bmi_calculator_/components/buttons/calculate_widjet.dart';
import 'package:bmi_calculator_/components/buttons/weightAge_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/buttons/custom_container_widjet.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.mainColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Bmi Calculator',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() => CustomContainer(
                        icon: Icons.male,
                        text: 'Male',
                        tus: _homeController.maleColor.value,
                        onTap: _homeController.male,
                      )),
                  Obx(() => CustomContainer(
                        onTap: _homeController.famele,
                        icon: Icons.female,
                        text: 'FeMale',
                        tus: _homeController.femaleColor.value,
                      )),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Height'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Obx(() => Text(
                              _homeController.heightValue.value
                                  .toStringAsFixed(0),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Text(
                          'cm',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Obx(() => Slider(
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey,
                          thumbColor: Colors.blue,
                          max: 220,
                          min: 50,
                          value: _homeController.heightValue.value,
                          onChanged: (adamdinBasuusu) {
                            _homeController.heightValue.value = adamdinBasuusu;
                            //setState(() {});
                          },
                        )),
                  ],
                ),
              ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WeightAge(
                        tag1: '3',
                        tag2: '4',
                        title: 'weight',
                        number: _homeController.weight.value.toString(),
                        onPressedMines: _homeController.minuswight,
                        onPressedPlus: _homeController.pluswight,
                      ),
                      WeightAge(
                        tag1: '1',
                        tag2: '2',
                        title: 'Age',
                        number: _homeController.age.value.toString(),
                        onPressedMines: _homeController.minusAge,
                        onPressedPlus: _homeController.plusAge,
                      ),
                    ],
                  )),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CalculateWidjet(
              text: 'Calculate',
              onTap: () {
                Get.to(ResultPage());
                // Navigator.push(
                //context,
                // MaterialPageRoute(
                // builder: (context) => ResultPage(
                //  height: _homeController.heightValue.value,
                //  kg: _homeController.weight.value,
                // ),
                // ),
                //);
              },
            ),
          ),
        ),
      ),
    );
  }
}

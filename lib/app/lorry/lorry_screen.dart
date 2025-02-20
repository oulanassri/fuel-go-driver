import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../auth/components/custom_text_form_field.dart';
import '../common/custom_app_bar.dart';
import '../common/custom_material_button.dart';
import '../common/custom_text_form_field1.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import 'components/cargo_tank_widget.dart';
import 'lorry_controller.dart';

class LorryScreen extends GetView<LorryController> {
  const LorryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LorryController());

    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: CustomAppBar(
        title: 'شاحنة الوقود',
      ),
      body: Container(
          padding: EdgeInsets.all(defaultPadding),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: gradientColorBg,
          ),
          child: Column(
            spacing: defaultPadding,
            children: [
              SizedBox(
                height: defaultPadding,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/Truck_FuelGo.png",
                    fit: BoxFit.contain,
                    width: 200,
                    height: 200,
                  ),
                  CargoTankWidget()
                ],
              ),
              Column(spacing: defaultPadding,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: MaterialButton(
                      onPressed: () {
                        Get.defaultDialog(
                            cancelTextColor: secondaryButton,
                            buttonColor: secondaryButton,
                            title: "تعبئة وقود للشاحنة",
                            textConfirm: "إضافة",
                            textCancel: "إلغاء",
                            titleStyle: Theme.of(context).textTheme.titleMedium,
                            content: Column(
                              children: [
                                CustomTextFormField1(
                                  hintText: 'نوع الوقود',
                                  controller: controller.fuelTypeController,
                                ),
                                CustomTextFormField1(
                                  hintText: 'الكمية',
                                  controller: controller.quantityController,
                                ),
                                CustomTextFormField1(
                                  hintText: 'السّعر',
                                  controller: controller.priceController,
                                ),
                                CustomTextFormField1(
                                  hintText: 'محطة الوقود',
                                  controller: controller.fuelStationController,
                                ),
                              ],
                            ),
                            onConfirm: () {
                              print("confirm");
                            },
                            onCancel: () {
                              print("cancel");
                            });
                      },
                      height: 50,
                      // margin: EdgeInsets.symmetric(horizontal: 50),
                      color: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      // decoration: BoxDecoration(
                      // ),
                      child: Center(
                        child: Text(
                          "تعبئة وقود للشاحنة",
                          style: TextStyle(
                              color: secondaryText,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: MaterialButton(
                      onPressed: () {
                        Get.defaultDialog(
                            cancelTextColor: secondaryButton,
                            buttonColor: secondaryButton,
                            title: "إضافة وقود لخزان الشاحنة",
                            textConfirm: "إضافة",
                            textCancel: "إلغاء",
                            titleStyle: Theme.of(context).textTheme.labelMedium,
                            content: Column(
                              children: [
                                CustomTextFormField1(
                                  hintText: 'نوع الوقود',
                                  controller: controller.fuelTypeController,
                                ),
                                CustomTextFormField1(
                                  hintText: 'الكمية',
                                  controller: controller.quantityController,
                                ),
                                CustomTextFormField1(
                                  hintText: 'السّعر',
                                  controller: controller.priceController,
                                ),
                                CustomTextFormField1(
                                  hintText: 'محطة الوقود',
                                  controller: controller.fuelStationController,
                                ),
                              ],
                            ),
                            onConfirm: () {
                              print("confirm");
                            },
                            onCancel: () {
                              print("cancel");
                            });
                      },
                      height: 50,
                      // margin: EdgeInsets.symmetric(horizontal: 50),
                      color: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      // decoration: BoxDecoration(
                      // ),
                      child: Center(
                        child: Text(
                          "إضافة وقود لخزان الشاحنة",
                          style: TextStyle(
                              color: secondaryText,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

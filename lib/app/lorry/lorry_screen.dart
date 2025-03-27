import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../models/gas_station_model.dart';
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
    Get.put(LorryController()).getGasStations();

    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: CustomAppBar(
        title: 'شاحنة الوقود',
      ),
      body: Container(
          padding: EdgeInsets.all(defaultPadding),
          width: double.infinity,
          height:double.infinity ,
          decoration: BoxDecoration(
            gradient: gradientColorBg,
          ),
          child: SingleChildScrollView(child: Column(
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
                  Obx(()=>
                  controller.isLoading.value
                      ?Center(child: CircularProgressIndicator(),) :CargoTankWidget(
                    cargoTankAmount: controller.cargoTankAmount.value,
                  )
                  )
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
                                Text(
                                  "اختر محطة الوقود",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Obx(()=>DropdownButton<String>(
                                  // updated
                                    onChanged: (String? newValue) {
                                      controller.setSelectedGasStation(newValue ?? '');
                                    },
                                    value: controller.selectedGasStation.value,
                                    onTap: () {}, //updated
                                    items: [
                                      for (GasStationModel value in controller.gasStations)
                                        DropdownMenuItem(
                                          value: value.name,
                                          child: Text(
                                            value.name ?? "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge, //updated
                                          ),
                                        ),
                                    ]),),
                                CustomTextFormField1(
                                  hintText: 'الكمية',
                                  controller: controller.quantityController,
                                ),
                                CustomTextFormField1(
                                  hintText: 'السّعر',
                                  controller: controller.priceController,
                                ),

                              ],
                            ),
                            onConfirm: () {
                              controller.refillFuelTank();
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

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: MaterialButton(
                      onPressed: () {
                        Get.defaultDialog(
                            cancelTextColor: secondaryButton,
                            buttonColor: secondaryButton,
                            title: " إضافة وقود لخزان الشاحنة الخارجي",
                            textConfirm: "إضافة",
                            textCancel: "إلغاء",
                            titleStyle: Theme.of(context).textTheme.labelMedium,
                            content: Column(
                              children: [

                                Obx(()=>DropdownButton<String>(
                                  // updated
                                    onChanged: (String? newValue) {
                                      controller.setSelectedGasStation(newValue ?? '');
                                    },
                                    value: controller.selectedGasStation.value,
                                    onTap: () {}, //updated
                                    items: [
                                      for (GasStationModel value in controller.gasStations)
                                        DropdownMenuItem(
                                          value: value.name,
                                          child: Text(
                                            value.name ?? "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge, //updated
                                          ),
                                        ),
                                    ]),),
                                CustomTextFormField1(
                                  hintText: 'الكمية',
                                  controller: controller.quantityController,
                                ),
                                CustomTextFormField1(
                                  hintText: 'السّعر',
                                  controller: controller.priceController,
                                ),

                              ],
                            ),
                            onConfirm: () {
                              print("confirm");
                              controller.refillCargoTank();
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
                        child: Text(  "تعبئة وقود لخزان الشاحنة الخارجي",

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
          ),)),
    );
  }
}

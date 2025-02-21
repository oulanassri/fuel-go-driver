import 'package:flutter/material.dart';
import 'package:fuel_go_driver/app/home/home_controller.dart';
import 'package:fuel_go_driver/getx_bindings/home_binding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../routes/app_routes.dart';
import '../../auth/components/custom_material_button.dart';
import '../../common/common_material_button.dart';
import '../../common/common_material_unclick_able_button.dart';
import '../../common/custom_text_form_field1.dart';
import '../../constants.dart';
import 'invoice_table.dart';

class ActiveOrder extends StatelessWidget {
  HomeController controller;
  RxString activeOrderStatus =
      "ontheway" //ontheway  arrivedlocation  startservicing
          .obs;

  ActiveOrder({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: defaultPadding,
          children: [
            SizedBox(
              height: defaultPadding * 2,
            ),
            Text(
              "طلب قيد التّنفيذ",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,

                  // margin: EdgeInsets.symmetric(horizontal: defaultPadding * 3 / 4),
                  padding: EdgeInsets.all(defaultPadding / 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: primaryColorOpicity,
                    border: Border.all(
                      width: 5.0,
                      // assign the color to the border color
                      color: primaryColor,
                    ),
                  ),

                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: defaultPadding / 4,
                      children: [
                        Text(
                          "تعبئة لمنزل",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Row(
                          children: [
                            Text(
                              "رقم الطلب : ",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              " 12",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "تارخ و وقت الطلب :",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              "   12:00PM",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        Text(
                          "الموقع : مدينة + الحيّ + تفاصيل عن الموقع",
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              "نوع الوقود:  ",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              "مازوت",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "كمية االتعبئة:  ",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              "100",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "اسم الزبون و هاتفه:  ",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              "الاسم الكامل",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Text(
                              "0936262626",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                        Center(
                          child: Obx(
                            () => activeOrderStatus.value == "ontheway"
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CommonMaterialButton(
                                        title: "الوصول إلى الموقع",
                                        function: () {
                                          activeOrderStatus.value =
                                              "arrivedlocation";
                                          print(activeOrderStatus.value);
                                        },
                                      ),
                                      CommonMaterialUnclickAbleButton(
                                        title: 'بدء عملية التعبئة',
                                      ),
                                      CommonMaterialUnclickAbleButton(
                                        title: 'إنهاء الطلب',
                                      ),
                                    ],
                                  )
                                : Container(),
                          ),
                        ),
                        Center(
                          child: Obx(
                              () => activeOrderStatus.value == "arrivedlocation"
                                  ? Row( mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                                      children: [
                                        CommonMaterialUnclickAbleButton(
                                          title: 'الوصول إلى الموقع',
                                        ),
                                        CommonMaterialButton(
                                          title: "بدء عملية التعبئة",
                                          function: () {
                                            Get.defaultDialog(
                                                cancelTextColor:
                                                    secondaryButton,
                                                buttonColor: secondaryButton,
                                                title: "أدخل الرّمز للمصادقة",
                                                textConfirm: "تأكيد",
                                                textCancel: "إلغاء",
                                                titleStyle: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium,
                                                content: Column(
                                                  children: [
                                                    CustomTextFormField1(
                                                      hintText: 'الرّمز',
                                                      controller: controller
                                                          .codeController,
                                                    ),
                                                  ],
                                                ),
                                                onConfirm: () {
                                                  Get.back();
                                                  activeOrderStatus.value =
                                                      "startservicing";
                                                });
                                          },
                                        ),
                                        CommonMaterialUnclickAbleButton(
                                          title: 'إنهاء الطلب',
                                        ),
                                      ],
                                    )
                                  : Container()),
                        ),
                        Center(
                          child: Obx(() => activeOrderStatus.value ==
                                  "startservicing"
                              ? Row( mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonMaterialUnclickAbleButton(
                                      title: 'الوصول إلى الموقع',
                                    ),
                                    CommonMaterialUnclickAbleButton(
                                      title: 'بدء عملية التعبئة',
                                    ),
                                    CommonMaterialButton(
                                      title: "إنهاء الطلب",
                                      function: () {
                                        Get.defaultDialog(
                                            cancelTextColor: secondaryButton,
                                            buttonColor: secondaryButton,
                                            title: "أدخل كميّة التّعبئة",
                                            textConfirm: "تأكيد ",
                                            textCancel: "إلغاء",
                                            titleStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                            content: Column(
                                              children: [
                                                CustomTextFormField1(
                                                  hintText: 'كميّة التّعبئة',
                                                  controller: controller
                                                      .fuelQuantityController,
                                                ),
                                              ],
                                            ),
                                            onConfirm: () {
                                              Get.back();
                                              Get.defaultDialog(
                                                  cancelTextColor:
                                                      secondaryButton,
                                                  buttonColor: secondaryButton,
                                                  title: "الفاتورة",
                                                  textConfirm:
                                                      "تم إنجاز المهمة",
                                                  textCancel: "إلغاء",
                                                  titleStyle: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium,
                                                  content: InvoiceTable(),
                                                  onConfirm: () {
                                                    Get.back();
                                                    controller
                                                        .updateDriverStatus(
                                                            "pending");
                                                  });
                                            });
                                      },
                                    ),
                                  ],
                                )
                              : Container()),
                        ),
                      ]),
                ),
                Image.asset(
                  "assets/images/Home_FuelGo.png",
                  fit: BoxFit.contain,
                  width: 50,
                  height: 50,
                ),
              ],
            ),
            SizedBox(
              height: defaultPadding * 2,
            ),
          ],
        ),
      ),
    );
  }
}

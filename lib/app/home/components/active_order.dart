import 'package:flutter/material.dart';
import 'package:fuel_go_driver/app/home/home_controller.dart';
import 'package:fuel_go_driver/getx_bindings/home_binding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/orders_model.dart';
import '../../../routes/app_routes.dart';
import '../../auth/components/custom_material_button.dart';
import '../../common/common_material_button.dart';
import '../../common/common_material_unclick_able_button.dart';
import '../../common/custom_text_form_field1.dart';
import '../../constants.dart';
import '../../common/invoice_table.dart';
import 'invoice.dart';

class ActiveOrder extends StatelessWidget {
  HomeController controller;

  /*RxString activeOrderStatus =
      "ontheway" //ontheway  arrivedlocation  startservicing
          .obs;*/

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
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Text(
                                      controller.activeOrder.orderNumber ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ],
                                ),
                                Text(
                                  "تارخ و وقت الطلب :",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  controller.activeOrder.date ?? "",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "الموقع : ${controller.activeOrder.locationDescription ?? ""}",
                                  style: Theme.of(context).textTheme.labelSmall,
                                  maxLines: 3,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "كمية االتعبئة:  ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Text(
                                      controller.activeOrder.orderedQuantity ??
                                          "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ],
                                ),
                                /*  Column(
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
                        ),*/
                                Center(
                                  child: Obx(
                                    () => controller
                                                .activeOrderStatusId.value ==
                                            4
                                        ? Column(
                                           /* mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,*/
                                            children: [
                                              CommonMaterialButton(
                                                title: "الوصول إلى الموقع",
                                                function: () {
                                                  controller.arrivedLocation();
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
                                  child: Obx(() =>
                                      controller.activeOrderStatusId.value == 5
                                          ? Column(
                                             /* mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,*/
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
                                                        buttonColor:
                                                            secondaryButton,
                                                        title:
                                                            "أدخل الرّمز للمصادقة",
                                                        textConfirm: "تأكيد",
                                                        textCancel: "إلغاء",
                                                        titleStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .labelMedium,
                                                        content: Column(
                                                          children: [
                                                            CustomTextFormField1(
                                                              hintText:
                                                                  'الرّمز',
                                                              controller: controller
                                                                  .codeController,
                                                            ),
                                                          ],
                                                        ),
                                                        onConfirm: () {
                                                          Get.back();
                                                          controller.startServicingOrder(
                                                              authCode: controller
                                                                  .codeController
                                                                  .text);
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
                                  child: Obx(() => controller
                                              .activeOrderStatusId.value ==
                                          6
                                      ? Column(
                                         /* mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,*/
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
                                                    cancelTextColor:
                                                        secondaryButton,
                                                    buttonColor:
                                                        secondaryButton,
                                                    title:
                                                        "أدخل كميّة التّعبئة",
                                                    textConfirm: "تأكيد ",
                                                    textCancel: "إلغاء",
                                                    titleStyle:
                                                        Theme.of(context)
                                                            .textTheme
                                                            .labelMedium,
                                                    content: Column(
                                                      children: [
                                                        CustomTextFormField1(
                                                          hintText:
                                                              'كميّة التّعبئة',
                                                          controller: controller
                                                              .fuelQuantityController,
                                                        ),
                                                      ],
                                                    ),
                                                    onConfirm: () async {
                                                      Get.back();
                                                      if (await controller
                                                          .completeOrder(
                                                              quantity: controller
                                                                  .fuelQuantityController
                                                                  .text)) {
                                                        Get.defaultDialog(
                                                            cancelTextColor:
                                                                secondaryButton,
                                                            buttonColor:
                                                                secondaryButton,
                                                            title: "الفاتورة",
                                                            textConfirm:
                                                                "تم إنجاز المهمة",
                                                            textCancel: "إلغاء",
                                                            titleStyle: Theme
                                                                    .of(context)
                                                                .textTheme
                                                                .labelMedium,
                                                            content: Invoice(
                                                              completeOrderResponse:
                                                                  controller
                                                                      .completeOrderResponse,
                                                            ),
                                                            onConfirm: () {
                                                              Get.back();
                                                              /* controller.completeOrder(quantity: controller
                                                                  .fuelQuantityController.text);*/
                                                            });
                                                      }
                                                    });
                                              },
                                            ),
                                          ],
                                        )
                                      : Container()),
                                ),
                                CommonMaterialButton(
                                  title: "موقع الطلب",
                                  function: () {
                                    controller.openMap(
                                        controller.activeOrder.lat ?? "",
                                        controller.activeOrder.long ?? "");
                                  },
                                )
                              ]),
                        ),
                        controller.activeOrder.customerCarId ==
                            "null" ?
                        Image.asset(
                          "assets/images/Home_FuelGo.png",
                          fit: BoxFit.contain,
                          width: 50,
                          height: 50,
                        ):Image.asset(
                          "assets/images/Car_FuelGo.png",
                          fit: BoxFit.contain,
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
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

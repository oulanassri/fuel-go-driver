import 'package:flutter/material.dart';
import 'package:fuel_go_driver/app/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../models/pending_order.dart';
import '../../../routes/app_routes.dart';
import '../../auth/components/custom_material_button.dart';
import '../../common/common_material_button.dart';
import '../../constants.dart';

class CarPendingOrderWidget extends StatelessWidget {
  HomeController controller;
  PendingOrder pendingOrder;

  CarPendingOrderWidget(
      {Key? key, required this.controller, required this.pendingOrder})
      : super(key: key);
 // RxBool open = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: defaultPadding),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            // margin: EdgeInsets.symmetric(horizontal: defaultPadding * 3 / 4),
            padding: EdgeInsets.all(defaultPadding / 2),
            decoration: BoxDecoration(
              border: Border.all(
                width: 5.0,
                // assign the color to the border color
                color: primaryColor,
              ),
              borderRadius: BorderRadius.circular(15),
              color: primaryColorOpicity,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: defaultPadding / 4,
                children: [
                  Text(
                    "تعبئة لسيّارة",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),Text(
                    "رقم الطلب :",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    pendingOrder.orderNumber ?? "",
                    style: Theme.of(context).textTheme.labelSmall,
                  ), Text(
                    "تارخ و وقت الطلب :  ",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    pendingOrder.date ?? "",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),

                  Text(
                    "الموقع : ${pendingOrder.locationDescription}",
                    style: Theme.of(context).textTheme.labelSmall,
                    maxLines: 3,
                  ),
                  /*  open.value == true
                          ? Row(
                              children: [
                                Text(
                                  "نوع الوقود:  ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  "مازوت",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            )
                          : Container(),*/
                  Row(
                    children: [
                      Text(
                        "كمية االتعبئة:  ",
                        style:
                        Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        pendingOrder.orderedQuantity.toString(),
                        style:
                        Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                  /*   open.value == true
                          ? Column(
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
                            )
                          : Container(),*/
                  CommonMaterialButton(
                    title: "موقع الطلب",
                    function: () {
                      controller.openMap(pendingOrder.lat??"", pendingOrder.long??"");
                    },
                  ),
                  CommonMaterialButton(
                    title: "قبول الطّلب",
                    function: () {
                      controller.acceptOrder(
                          orderNumber:
                          pendingOrder.orderNumber ?? "");
                    },
                  ),

                ]),
          ),

          Image.asset(
            "assets/images/Car_FuelGo.png",
            fit: BoxFit.contain,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}

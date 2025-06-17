import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../home_controller.dart';
import 'car_pending_order_widget.dart';
import 'house_pending_order_widget.dart';

class PendingOrders extends StatelessWidget {
  HomeController controller;

  PendingOrders({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: defaultPadding / 2,
          children: [
            SizedBox(height: defaultPadding / 2,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(right: 200),
                child: MaterialButton(
                  onPressed: () {
                    controller.endJob();
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
                      "إنهاء العمل",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                  ),
                ),
              ),
            ),

            Text(
              "طلبات قيد الانتظار",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge,
            ),
            //HousePendingOrderWidget(controller: controller,),
            //CarPendingOrderWidget(controller: controller,),
            // HousePendingOrderWidget(controller: controller,),
            //  CarPendingOrderWidget(controller: controller,),
            Obx(() =>
                SingleChildScrollView(
                  child: Column(
                    spacing: defaultPadding,
                    children: [
                      SizedBox(
                        height: defaultPadding / 2,
                      ),
                      //     PreviousOrder(),
                      //    PreviousOrder(),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.orders.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onLongPress: () {},
                              child: controller.orders[index].customerCarId ==
                                  "null" ? HousePendingOrderWidget(
                                controller: controller,
                                pendingOrder: controller.orders[index],
                              ):CarPendingOrderWidget(
                                controller: controller,
                                pendingOrder: controller.orders[index],
                              ),
                            );
                          }),
                      SizedBox(
                        height: defaultPadding,
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: defaultPadding * 2,
            ),
          ],
        ),
      ),
    );
  }
}

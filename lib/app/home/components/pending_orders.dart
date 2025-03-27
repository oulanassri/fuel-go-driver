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
          spacing: defaultPadding,
          children: [
            SizedBox(
              height: defaultPadding * 2,
            ),
            Text(
              "طلبات قيد الانتظار",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            //HousePendingOrderWidget(controller: controller,),
            //CarPendingOrderWidget(controller: controller,),
           // HousePendingOrderWidget(controller: controller,),
          //  CarPendingOrderWidget(controller: controller,),
            Obx(() => controller.isLoading.value
                ? Center(
              child: CircularProgressIndicator(),
            )
                : SingleChildScrollView(
              child: Column(
                spacing: defaultPadding,
                children: [
                  SizedBox(
                    height: defaultPadding * 2,
                  ),
                  //     PreviousOrder(),
                  //    PreviousOrder(),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.orders.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onLongPress: () {

                          },
                          child: HousePendingOrderWidget(
                            controller: controller, pendingOrder: controller.orders[index],
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

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
    return SingleChildScrollView(child: Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding ),
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
          HousePendingOrderWidget(),
          CarPendingOrderWidget(),
          HousePendingOrderWidget(),
          CarPendingOrderWidget(),
          SizedBox(
            height: defaultPadding * 2,
          ),
        ],
      ),
    ),);
  }
}

import 'package:flutter/material.dart';
import 'package:fuel_go_driver/app/home/components/start_job.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../routes/app_routes.dart';
import '../common/custom_app_bar.dart';
import '../common/custom_material_button.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import 'components/active_order.dart';
import 'components/pending_orders.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  RxString title = "الواجهة الرّئيسيّة".obs;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      //extendBody:true ,
      //extendBodyBehindAppBar: true,
      drawer: CustomNavigationDrawer(),
      appBar: CustomAppBar(
        title: 'الواجهة الرئيسية',
      ),

      body: Obx(() => Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: gradientColorBg,
            ),
            child: controller.driverStatus.value == "offline"
                ? StartJob(
                    controller: controller,
                  )
                : (controller.driverStatus.value == "متاح"//متاح
                    ? PendingOrders(
                        controller: controller,
                      )
                    : ActiveOrder(
                        controller: controller,
                      )),
          )),
    );
  }
}

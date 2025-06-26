import 'package:flutter/material.dart';
import 'package:fuel_go_driver/app/home/components/start_job.dart';
import 'package:fuel_go_driver/utils/helpers/getx_network_manager.dart';
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

  //final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    NetworkController networkController = Get.find();
    return Scaffold(
      //extendBody:true ,
      //extendBodyBehindAppBar: true,
      drawer: CustomNavigationDrawer(),
      appBar: CustomAppBar(
        title: 'الواجهة الرئيسية',
      ),

      body: Obx(
        () => (networkController.connectstatus.value == "Mobile Internet" ||
                networkController.connectstatus.value == "VPN")
            ? Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: gradientColorBg,
                ),
                child: controller.driverStatus.value == "غير نشط"
                    ? StartJob(
                        controller: controller,
                      )
                    : (controller.driverStatus.value == "انتظار" //انتظار
                        ? PendingOrders(
                            controller: controller,
                          )
                        : ActiveOrder(
                            controller: controller,
                          )),
              )
            : Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: gradientColorBg,
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/no_internet.png",
                    fit: BoxFit.cover,
                    width: 200,
                  ),
                ),
              ),
      ), /*GetBuilder<GetXNetworkManager>(
          builder: (builder) => _networkManager.connectionType == 0
              ? Text("No Internet")
              : )*/
    );
  }
}
//no_internet.png

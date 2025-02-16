import 'package:flutter/material.dart';
import 'package:fuel_go_driver/app/settings/settings_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());

    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: AppBar(
        title:  Text(
          "الإعدادات",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient:gradientColorBg,
          ),
          child: Column()),
    );
  }
}

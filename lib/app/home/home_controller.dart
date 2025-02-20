import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../native_service/get_storage.dart';

class HomeController extends GetxController {
  late UserStorage storage;
  RxString driverStatus = "offline"
      .obs; //pending  offline  ontheway  arrivedlocation  startservicing
  TextEditingController codeController = TextEditingController();
  TextEditingController fuelQuantityController = TextEditingController();
  @override
  void onInit() {
    storage = UserStorage();
    super.onInit();
  }

  void updateDriverStatus(String status) {
    driverStatus.value = status;
  }
}

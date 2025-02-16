import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../native_service/get_storage.dart';

class LorryController extends GetxController {
  late UserStorage storage;
  TextEditingController fuelTypeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController fuelStationController = TextEditingController();

  TextEditingController houseLocationDetailsController = TextEditingController();
  TextEditingController houseCityController = TextEditingController();
  TextEditingController houseNeighborhoodController = TextEditingController();
  @override
  void onInit() {
    storage = UserStorage();
    super.onInit();
  }
}

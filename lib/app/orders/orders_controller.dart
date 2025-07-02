import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/orders_model.dart';
import '../../native_service/get_storage.dart';
import '../../utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class OrdersController extends GetxController {
  static final String token = UserStorage.read('token');
  List<OrdersModel> orders = [];
  RxInt ordersListLength=0.obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    getMyOrders();
    super.onInit();
  }
  Future<void> getMyOrders() async {
    print("getMyOrders");
    try {
      isLoading(true);


      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getMyOrders}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);
        print(body.length.toString());
        orders.clear();
        for (int i = 0; i < body.length; i++) {
          orders.add(
            OrdersModel(
              date: body[i]["date"].toString(),
              orderNumber: body[i]["orderNumber"].toString(),
              locationDescription: body[i]["locationDescription"].toString(),
              neighborhoodName: body[i]["neighborhoodName"].toString(),
              fuelTypeName: body[i]["fuelTypeName"].toString(),
              orderedQuantity: body[i]["orderedQuantity"].toString(),
              price: body[i]["price"].toString(),
              finalQuantity: body[i]["finalQuantity"].toString(),
              finalPrice: body[i]["finalPrice"].toString(),
              customerCarBrand: body[i]["customerCarBrand"].toString(),
              customerApartmentName: body[i]["customerApartmentName"].toString(),
              authCode: body[i]["authCode"].toString(),
              statusName: body[i]["statusName"].toString(),
              customerName:  body[i]["customerName"].toString(),
              customerPhone:  body[i]["customerPhone"].toString(),
              driverName:  body[i]["driverName"].toString(),
              driverPhone:  body[i]["driverPhone"].toString(),
              deliveryFee: body[i]["deliveryFee"].toString(),
              centerName: body[i]["centerName"].toString(),
            ),
          );
        }
        ordersListLength.value=orders.length;
        print("ordersListLength ${ordersListLength.toString()}");
        isLoading(false);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
      //Get.back();
    } catch (e) {
      print(e);
    } finally {

    }
  }

}
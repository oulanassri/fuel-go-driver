import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../models/active_order.dart';
import '../../models/complete_order_response.dart';
import '../../models/driver_status.dart';
import '../../models/order_status_model.dart';
import '../../models/pending_order.dart';
import '../../native_service/get_storage.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  static final String token = UserStorage.read('token');
  var isLoading = false.obs;
  List orders = [].obs;
  late ActiveOrder activeOrder = ActiveOrder();
  DriverStatusModel driverStatusModel=DriverStatusModel();
  OrderStatusModel orderStatusModel=OrderStatusModel();
  RxString driverStatus = "غير نشط".obs; //  انتظار غير نشط /متاح /مشغول

  RxString activeOrderStatus = "في الطريق".obs; //بدء تعبئة الطلب1  في الطريق4  وصل للموقع5
  RxInt activeOrderStatusId = 4.obs; //
  CompleteOrderResponse completeOrderResponse=CompleteOrderResponse();
  TextEditingController codeController = TextEditingController();
  TextEditingController fuelQuantityController = TextEditingController();

  var connectionStatus=0.obs;
 // bool isConnected=await InternetConnectionChecker().hasConnection;
  @override
  void onInit() {
    print('Here is the token at spalsh $token');

      Timer.periodic(Duration(seconds: 6), (timer){
      getDriverStatus();
    });

    super.onInit();
  }

  @override
  void onReady() {
    // getActiveOrder();

    super.onReady();
  }

  void updateDriverStatus(String status) {
    driverStatus.value = status;
    if (status == "انتظار") {
      getPendingOrders();
    }
    else if(status=="مشغول"){
      getActiveOrderStatus();
    }
  }

  void updateActiveOrderStatus(String status,int id) {
    activeOrderStatus.value = status; //ontheway arrivedlocation startservicing
    activeOrderStatusId.value=id;
  }
  Future<void> getDriverStatus() async {
    print("getDriverStatus");
    try {
     // isLoading(true);

      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getDriverStatus}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        var body = json.decode(response.body);
        driverStatusModel = DriverStatusModel(
          id: body["id"].toString() ?? "",
          name: body["name"].toString() ?? "",
          statusTypeId: body["statusTypeId"].toString() ?? "",

        );
      //  driverStatus.value=driverStatusModel.name!;
        print("driverStatusModel.name ${driverStatusModel.name}");

        updateDriverStatus(driverStatusModel.name!);
        print(driverStatusModel.name);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
      //Get.back();
    } catch (e) {
      print(e);
    } finally {
   //   isLoading(false);
    }
  }
  Future<void> getActiveOrderStatus() async {
    print("getActiveOrderStatus");
    try {
     // isLoading(true);

      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getActiveOrderStatus}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      if (response.statusCode == 200 || response.statusCode == 201 ||response.statusCode == 204) {
        var body = json.decode(response.body);
      //  print(body.toString());
        orderStatusModel = OrderStatusModel(
          id: body["id"].toString() ?? "",
          name: body["name"].toString()??"",
          statusTypeId: body["statusTypeId"].toString() ?? "",

        );

        print("orderStatusModel.name ${orderStatusModel.name}");

        updateActiveOrderStatus(orderStatusModel.name!,int.parse(orderStatusModel.id??"4"));
        print("orderStatusModel.name  ${orderStatusModel.name}+  orderStatusModel.id ${orderStatusModel.id}");
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
      //Get.back();
    } catch (e) {
      print(e);
    } finally {
     // isLoading(false);
    }
  }
  /*Future<void> getDriverStatus() async {
    print("getDriverStatus");
    try {
      isLoading(true);
      String body =
      await THttpHelper.getString(APIConstants.endPoints.getDriverStatus);
     // cargoTankAmount.value=body;

      print(body);
      isLoading(false);

      /* if (response.statusCode == 200 || response.statusCode == 201) {

        String body = json.decode(response.body);
        if (body == "متاح") {
          updateDriverStatus("متاح");
        }
        print(body);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }*/
      //Get.back();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }*/

  Future<void> startJob() async {
    print("startJob");

    try {
      final response = await http.post(
        Uri.parse('${APIConstants.baseUrl}${APIConstants.endPoints.startJob}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {


        THelperFunctions.showSnackBar(
            message: 'تم بدء العمل', title: 'حالة العمل');
        getDriverStatus();
      } else {
        if (kDebugMode) {
          print(response.body);
        }
        print(response.body);

        throw Exception('Failed to load date: ${response.statusCode}');
      }

      print(driverStatus.value);
    } catch (e) {
      print(e);
    }
  }

  Future<void> endJob() async {
    print("endJob");
    try {
      final response = await http.post(
        Uri.parse('${APIConstants.baseUrl}${APIConstants.endPoints.endJob}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        getDriverStatus();
        THelperFunctions.showSnackBar(
            message: 'تم إنتهاء العمل', title: 'حالة العمل');
      } else {
        print(response.body);
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> acceptOrder({required String orderNumber}) async {
    print("acceptOrder");
    try {
      Map data = {"orderNumber": orderNumber};
      print(data);
      Map<String, dynamic> body = await THttpHelper.post(
          endpoint: APIConstants.endPoints.acceptOrder, data: data);
      print(body);
      getDriverStatus();
      getActiveOrder();


      THelperFunctions.showSnackBar(
          message: 'تم الموافقة على الطلب', title: 'جالة الطلب');
      getActiveOrderStatus();
    } catch (e) {
      print(e);
    }
  }

  Future<void> arrivedLocation() async {
    print("arrivedLocation");
    try {
    final response = await http.post(Uri.parse('${APIConstants.baseUrl}${APIConstants.endPoints.arrivedLocation}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
         );
      if (response.statusCode == 200 || response.statusCode == 201) {
        getDriverStatus();

        getActiveOrderStatus();

        THelperFunctions.showSnackBar(
            message: 'تم الوصول إلى الموقع', title: 'حالة الطلب');
      } else {
        print(response.body);
        throw Exception('Failed to load date: ${response.statusCode}');
      }

    } catch (e) {
      print(e);
    }
  }

  Future<void> startServicingOrder({required String authCode}) async {
    print("startServicingOrder");

    try {
      final response = await http.post(
        Uri.parse(
            '${APIConstants.baseUrl}${APIConstants.endPoints.startServicingOrder}?authCode=$authCode'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${UserStorage.read('token')}'
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        getActiveOrderStatus();
        codeController.clear();
        THelperFunctions.showSnackBar(
            message: 'تتم عملية التعبئة', title: 'حالة الطلب');
      } else {
        print("response body ${response.body}");
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> completeOrder({required String quantity}) async {
    print("completeOrder");

    try {
      final response = await http.post(
        Uri.parse(
            '${APIConstants.baseUrl}${APIConstants.endPoints.completeOrder}?plateNum=${int.parse(quantity)}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${UserStorage.read('token')}'
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("response body  ${response.body}");
        final temp=jsonDecode(response.body);
        completeOrderResponse=CompleteOrderResponse(finalPrice: temp["finalPrice"],finalQuantity: temp["finalQuantity"],price: temp["price"]);
       // updateDriverStatus("متاح");

   getDriverStatus();
        THelperFunctions.showSnackBar(
            message: 'تمّ إتتهاء عملية التعبئة بنجاح', title: 'حالة الطلب');
        return true;
      } else {
      //  print("response body  ${response.body}");
        return false;
        throw Exception('Failed to load date: ${response.statusCode}');

      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> updateDriverLocation() async {
    print("updateDriverLocation");
    try {
      Map data = {"latitude": 0, "longitude": 0};
      Map<String, dynamic> body = await THttpHelper.post(
        endpoint: APIConstants.endPoints.updateDriverLocation,
        data: data,
      );
      print(body);

      THelperFunctions.showSnackBar(
          message: 'تم الوصول إلى الموقع', title: 'حالة الطلب');
    } catch (e) {
      print(e);
    }
  }

  Future<void> getPendingOrders() async {
    print("getPendingOrders");
    try {
      isLoading(true);

      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getPendingOrders}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);
        orders.clear();
        for (int i = 0; i < body.length; i++) {
          orders.add(
            PendingOrder(
              date: body[i]["date"].toString() ?? "",
              orderNumber: body[i]["orderNumber"].toString() ?? "",
              locationDescription:
                  body[i]["locationDescription"].toString() ?? "",
              lat: body[i]["lat"].toString() ?? "",
              long: body[i]["long"].toString() ?? "",
              orderedQuantity: body[i]["orderedQuantity"].toString() ?? "",
              neighborhoodId: body[i]["neighborhoodId"].toString() ?? "",
              fuelTypeId: body[i]["fuelTypeId"].toString() ?? "",
              customerCarId: body[i]["customerCarId"].toString() ?? "",
            ),
          );


        }
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
      //Get.back();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getActiveOrder() async {
    print("getActiveOrder");
    try {
      isLoading(true);

      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getActiveOrder}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      if (response.statusCode == 200 || response.statusCode == 201) {
        var body = json.decode(response.body);
        activeOrder = ActiveOrder(
          date: body["date"].toString() ?? "",
          orderNumber: body["orderNumber"].toString() ?? "",
          locationDescription: body["locationDescription"].toString() ?? "",
          lat: body["lat"].toString() ?? "",
          long: body["long"].toString() ?? "",
          orderedQuantity: body["orderedQuantity"].toString() ?? "",
          neighborhoodId: body["neighborhoodId"].toString() ?? "",
          fuelTypeId: body["fuelTypeId"].toString() ?? "",
          customerCarId: body["customerCarId"].toString() ?? "",
        );
        print(activeOrder.orderNumber);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
      //Get.back();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> openMap(String lat, String long) async {
    print("https://www.google.com/maps/search/?api=1&query=$lat,$long");
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    await canLaunchUrlString(googleUrl)
        ? await launchUrlString(googleUrl)
        : throw 'Could not launch $googleUrl';
  }
}

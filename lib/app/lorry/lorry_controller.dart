import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/gas_station_model.dart';
import '../../native_service/get_storage.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../utils/http/http_client.dart';
import 'package:http/http.dart' as http;

class LorryController extends GetxController {
  static final String token = UserStorage.read('token');
  List<GasStationModel> gasStations = [];

  var isLoading = false.obs;
  TextEditingController fuelTypeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController fuelStationController = TextEditingController();

  TextEditingController houseLocationDetailsController =
      TextEditingController();
  TextEditingController houseCityController = TextEditingController();
  TextEditingController houseNeighborhoodController = TextEditingController();
  RxString cargoTankAmount = '0'.obs;
  RxInt selectedGasStationId = 0.obs;
  RxString selectedGasStation = "".obs;

  @override
  void onInit() {
    cargoTank();
    getGasStations();
    super.onInit();
  }

  @override
  void onReady() {
    cargoTank();
    getGasStations();
    super.onReady();
  }
  void setSelectedGasStation(String value) {

    selectedGasStation.value = value;
    //selectedCityId=id;
    for (int i = 0; i < gasStations.length; i++) {
      if (gasStations[i].name == value) {
        print(gasStations[i].id);
        selectedGasStationId.value = int.parse(gasStations[i].id??"0");
      }
    }
  }
  Future<void> cargoTank() async {
    print("cargoTank");
    try {
      isLoading(true);
      String body =
          await THttpHelper.getString(APIConstants.endPoints.cargoTank);
      cargoTankAmount.value = body;
      isLoading(false);
      print(body);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getGasStations() async {


    print("getGasStations");
    try {
      isLoading(true);

      final response = await http.get(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.getGasStations}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> body = json.decode(response.body);
        print(body.length.toString());
        gasStations.clear();
        for (int i = 0; i < body.length; i++) {
          gasStations.add(
            GasStationModel(
              id: body[i]["id"].toString(),
              neighborhoodId: body[i]["neighborhoodId"].toString(),
              name: body[i]["name"].toString(),
              lat: body[i]["lat"].toString(),
              long: body[i]["long"].toString(),
              locationDescription: body[i]["locationDescription"].toString(),
              neighborhood: body[i]["neighborhood"].toString(),
              truckTankRefills: body[i]["truckTankRefills"].toString(),
            ),
          );
        }
         selectedGasStationId.value =int.parse(gasStations[0].id??"0");
         selectedGasStation.value = gasStations[0].name??"";
        print("ordersListLength ${gasStations.length.toString()}");
        isLoading(false);
      } else {
        throw Exception('Failed to load date: ${response.statusCode}');
      }
      //Get.back();
    } catch (e) {
      print(e);
    } finally {}
  }

  Future<void> refillCargoTank() async {
    Get.back();
    print("refillCargoTank");
    try {
      isLoading(true);
      Map data = {
        "quantityCargoRefill": int.parse(quantityController.text),
        "price": int.parse(priceController.text),
        "gasStationId": selectedGasStationId.value
      };
      print(data);

      final response = await http.post(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.refillCargoTank}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: json.encode(data));
      print("response statusCode  ${response.statusCode}");
      print("response body  ${response.body}");
      if (response.statusCode == 200) {
        cargoTank();
        THelperFunctions.showSnackBar(
            message: 'تم تعبئة الخزان الخارجي', title: 'تعبئة الخزان');
        quantityController.clear();
        priceController.clear();
      } else {
        /*THelperFunctions.showSnackBar(
          message: response.body, title: 'تعبئة الخزان');*/
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
  Future<void> refillFuelTank() async {
    Get.back();
    print("refillFuelTank");
    try {
      isLoading(true);
      Map data = {
        "quantityFuelRefill": int.parse(quantityController.text),
        "price": int.parse(priceController.text),
        "gasStationId": selectedGasStationId.value
      };
      print(data);

      final response = await http.post(
          Uri.parse(
              '${APIConstants.baseUrl}${APIConstants.endPoints.refillFuelTank}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: json.encode(data));
      print("response statusCode  ${response.statusCode}");
      print("response body  ${response.body}");
      if (response.statusCode == 200) {
        THelperFunctions.showSnackBar(
            message: 'تم تعبئة خزان الشاحنة', title: 'تعبئة الخزان');
        quantityController.clear();
        priceController.clear();
      } else {
        /*THelperFunctions.showSnackBar(
          message: response.body, title: 'تعبئة الخزان');*/
        throw Exception('Failed to load date: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}

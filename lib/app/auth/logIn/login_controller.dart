import 'dart:convert';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../native_service/get_storage.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants/api_constants.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/http/http_client.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;


  @override
  void onInit() {

    super.onInit();
  }



  Future<void> login() async {
    print("login");
    try {isLoading(true);
      Map data = {
        "password": passwordController.text,
        "phone": phoneController.text,
      };
      print(data);

    final response = await http.post(Uri.parse('${APIConstants.baseUrl}${APIConstants.endPoints.login}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final temp=json.decode(response.body);
      UserStorage.save("token",temp["token"]);
      print("UserStorage.read(token)");

      print(UserStorage.read("token"));
      phoneController.clear();
      passwordController.clear();
      THelperFunctions.showSnackBar(
          message: 'تم تسجيل الدخول', title: 'تسجيل الدخول');
      Get.offNamed(Routes.HOME);
    //  return json.decode(response.body);
    } else {
      THelperFunctions.showSnackBar(
          message: 'كلمة السر خطأ أو الهاتف غير موجود', title: 'تسجيل الدخول');
      print(response.body);
      throw Exception('Failed to load date: ${response.statusCode}');
    }

    } catch (e) {
      print(e);
    }finally{
      isLoading(false);

    }
  }


}

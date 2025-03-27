import 'dart:convert';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../native_service/get_storage.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/constants/api_constants.dart';
import '../../../utils/http/http_client.dart';

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
      Map<String, dynamic> body = await THttpHelper.postLogin(
          endpoint: APIConstants.endPoints.login, data: data);

        print("UserStorage.read(token)");
      UserStorage.save("token", body["token"]);
    print(UserStorage.read("token"));
      UserStorage.save("phone", phoneController.text);
      phoneController.clear();
      passwordController.clear();

      Get.offNamed(Routes.HOME);
    } catch (e) {
      print(e);
    }finally{
      isLoading(false);

    }
  }


}

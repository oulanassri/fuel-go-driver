import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../constants.dart';
import '../components/custom_material_button.dart';
import '../components/custom_text_form_field.dart';
import 'login_controller.dart';

class LogInScreen extends GetView<LoginController> {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
      body:SingleChildScrollView(child:  Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient:gradientColorBg
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Text(
                        "تسجيل دخول",
                        style:Theme.of(context).textTheme.headlineMedium,
                      )),
                  SizedBox(
                    height: 10,
                  ),

                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    FadeInUp(
                        duration: Duration(milliseconds: 1400),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFFA3A3A3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              CustomTextFormField(
                                hintText: "البريد الإلكتروني",
                                controller: controller.emailController,
                              ),
                              CustomTextFormField(
                                hintText: "كلمة السّر",
                                controller: controller.passwordController,
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    FadeInUp(
                        duration: Duration(milliseconds: 1500),
                        child: Text(
                          "هل نسيت كلمة السّر",
                          style: TextStyle(color: Colors.grey),
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1600),
                      child: CustomMaterialButton(
                        route: Routes.HOME,
                        text: "تسجيل دخول",
                        buttonColor: secondaryColor,
                        textColor: white,
                      ),
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),),
    );
  }

  void onClickLogin() async {
    // EasyLoading.show(status: 'Loading....', dismissOnTap: true);

    /*bool loginSuccess = await controller.userLogin(
      email: controller.email,
      password: controller.password,
      phoneNumber: controller.mobileNumber,
    );
*/
    // EasyLoading.dismiss(); // Dismiss the loading indicator

    /* if (loginSuccess) {

      /*buttonAudio("song_assets/tada.mp3");
      Get.lazyPut(() => SuccessController());
      Get.bottomSheet(
        const SuccessBottomSheet(),
        backgroundColor: Themes.backGroundDialogColor,
      );*/
    }/* else if(controller.statusCode==403){
     controller.storage.save('email',controller.email);
       Get.offAllNamed(Routes.AUTHENTICATED);

    }*/else {

   /*   buttonAudio("song_assets/error1.mp3");
      Get.defaultDialog(
        backgroundColor:
        Themes.backGroundDialogColor,
        title: '',
        content: const FulsDialog(),
      );
      print("*********** Error here ************");
    }*/
  }*/
  }
}

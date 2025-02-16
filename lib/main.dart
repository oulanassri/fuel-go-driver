import 'package:flutter/material.dart';
import 'package:fuel_go_driver/routes/app_pages.dart';
import 'package:fuel_go_driver/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // builder:DevicePreview.appBuilder ,
      locale: Locale("ar"),
      debugShowCheckedModeBanner: false,

      theme: TAppTheme
          .lightTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

    );
  }
}

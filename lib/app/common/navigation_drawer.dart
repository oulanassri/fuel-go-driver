import 'package:flutter/material.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:get/get.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import '../../routes/app_routes.dart';
import '../constants.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: white,
        child: ListView(
          children: [
            buildDrawerHeader(context),
            Divider(
              color: Colors.grey,
            ),
            buildDrawerItem(
              icon: Icons.home,
              text: "الواجهة الرّئيسيّة",
              onTap: () => navigate(0),
              tileColor:
                  Get.currentRoute == Routes.HOME ? secondaryColor : null,
              textIconColor: Get.currentRoute == Routes.HOME
                  ? secondaryColor
                  : Colors.black,context: context
            ),
           
            buildDrawerItem(
                icon: Maki.fuel,
                text: "الطّلبات",
                onTap: () => navigate(1),
                tileColor:
                    Get.currentRoute == Routes.ORDERS ? secondaryColor : null,
                textIconColor: Get.currentRoute == Routes.ORDERS
                    ? secondaryColor
                    : Colors.black,context: context),
            buildDrawerItem(
                icon: Icons.person,
                text: "الملف الشّخصي",
                onTap: () => navigate(2),
                tileColor:
                    Get.currentRoute == Routes.PROFILE ? secondaryColor : null,
                textIconColor: Get.currentRoute == Routes.PROFILE
                    ? secondaryColor
                    : Colors.black,context: context),
            buildDrawerItem(
                icon: IcoFontIcons.searchProperty,
                text: "شاحنة الوقود",
                onTap: () => navigate(3),
                tileColor: Get.currentRoute == Routes.LORRY
                    ? secondaryColor
                    : null,
                textIconColor: Get.currentRoute == Routes.LORRY
                    ? secondaryColor
                    : Colors.black,context: context),
            buildDrawerItem(
                icon: Icons.settings,
                text: "الإعدادات",
                onTap: () => navigate(4),
                tileColor:
                    Get.currentRoute == Routes.SETTINGS ? secondaryColor : null,
                textIconColor: Get.currentRoute == Routes.SETTINGS
                    ? secondaryColor
                    : Colors.black, context: context),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: primaryColor),
      accountName: Text("username"),
      accountEmail: Text("email"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: white,
      ),
      currentAccountPictureSize: Size.square(72),
      otherAccountsPicturesSize: Size.square(50),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed(Routes.HOME);
    } else if (index == 1) {
      Get.toNamed(Routes.ORDERS);
    }
    else if (index == 2) {
      Get.toNamed(Routes.PROFILE);
    }
    else if (index == 3) {
      Get.toNamed(Routes.LORRY);
    }
    else if (index == 4) {
      Get.toNamed(Routes.SETTINGS);
    }
  }
}

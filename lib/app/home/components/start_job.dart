import 'package:flutter/material.dart';
import 'package:fuel_go_driver/app/home/home_controller.dart';

import '../../constants.dart';
class StartJob extends StatelessWidget {
  HomeController controller;
   StartJob({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: defaultPadding * 2,
      children: [
        SizedBox(
          height: defaultPadding * 2,
        ),
        Center(
          child: Image.asset(
            "assets/images/logo.png",
            height: 150,
            width: 150,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: MaterialButton(
            onPressed: () {
 controller.updateDriverStatus(
    "pending");
            },
            height: 50,

            // margin: EdgeInsets.symmetric(horizontal: 50),
            color: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            // decoration: BoxDecoration(
            // ),
            child: Center(
              child: Text(
                "بدء العمل",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
              ),
            ),
          ),
        ),


      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fuel_go_driver/app/constants.dart';
class CommonMaterialUnclickAbleButton extends StatelessWidget {
  String title;
   CommonMaterialUnclickAbleButton({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal:2),
      child: MaterialButton(
        onPressed:(){}

        ,

        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        // decoration: BoxDecoration(
        // ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,fontSize: 12,fontFamily:"Tajawal" ),
          ),
        ),
      ),
    );
  }
}

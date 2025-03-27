import 'package:flutter/material.dart';

import '../../constants.dart';

class CargoTankWidget extends StatelessWidget {
   CargoTankWidget({Key? key,required this.cargoTankAmount}) : super(key: key);
String cargoTankAmount;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      margin: EdgeInsets.symmetric(horizontal: defaultPadding * 3 / 4),
      padding: EdgeInsets.all(defaultPadding / 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 5, color: Colors.black12),
        color: white,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: defaultPadding / 2,
          children: [
            Text(
              "خزان الشاحنة",
              style: Theme.of(context).textTheme.titleMedium,
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             spacing: 10,
             children: [ Text(
               "liter",
               style: Theme.of(context).textTheme.titleMedium,
             ), Text(
               cargoTankAmount,
             style: Theme.of(context).textTheme.titleMedium,
           ),],)
          ]),
    );
  }
}

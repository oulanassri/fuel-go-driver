import 'package:flutter/material.dart';

import '../../../../models/house.dart';
import '../../../constants.dart';
class HouseCard extends StatelessWidget {
  const HouseCard({Key? key, required this.house, required this.chosen}) : super(key: key);
  final House house;
  final bool chosen;
  @override
  Widget build(BuildContext context) {
    return Card( margin: EdgeInsets.symmetric(horizontal: defaultPadding),
      elevation: 5.0,
      color: chosen?secondaryButton:Colors.white12,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width/2,
        padding: EdgeInsets.only(top: 15,),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              //width:   MediaQuery.of(context).size.width/2,
              child:  Image.asset(
                "assets/images/Truck_FuelGo.png",
                fit: BoxFit.fill,

              ),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
                alignment: AlignmentDirectional.center,
                padding: EdgeInsets.only(left: 12),
                child: Text(
                    "${house.location}",
                    style: Theme.of(context).textTheme.titleLarge
                )),
            SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
    );
  }
}

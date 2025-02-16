// import 'package:delivery_fuel_customer/app/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:sleek_circular_slider/sleek_circular_slider.dart';
//
// class CustomCarSleekSlider extends StatelessWidget {
//   const CustomCarSleekSlider({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return RotatedBox(
//       quarterTurns: 3,
//       child: SleekCircularSlider(
//           initialValue: 8,
//           min: 8,
//           max: 40,
//           appearance: CircularSliderAppearance(size:200 ,
//             customColors: CustomSliderColors(
//                 progressBarColor: secondaryColor, trackColor: primaryColor),
//           ),
//           onChange: (double value) {
//             print(value);
//           },
//           innerWidget: (value) {
//             return Center(
//               child: RotatedBox(
//                 quarterTurns: 1,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//
//                     Text(
//                       "\t liter ",
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ),Text(
//                       "${value.ceil()}",
//                       style: Theme.of(context).textTheme.headlineMedium,
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }

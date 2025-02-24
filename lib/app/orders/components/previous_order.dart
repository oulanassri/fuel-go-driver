import 'package:flutter/material.dart';
import 'package:fuel_go_driver/app/common/invoice_table.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../common/common_material_button.dart';
import '../../constants.dart';

class PreviousOrder extends StatelessWidget {
  PreviousOrder({Key? key}) : super(key: key);
  RxBool open = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            open.value = !(open.value);
          },
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,

                // margin: EdgeInsets.symmetric(horizontal: defaultPadding * 3 / 4),
                padding: EdgeInsets.all(defaultPadding / 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primaryColorOpicity,
                  border: Border.all(
                    width: 5.0,
                    // assign the color to the border color
                    color: primaryColor,
                  ),
                ),

                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: defaultPadding / 4,
                    children: [
                      Text(
                        "تعبئة لمنزل",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          Text(
                            "رقم الطلب :",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "   12",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "تارخ و وقت الطلب :",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "   12:00PM",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      open.value == true
                          ? Text(
                        "الموقع : مدينة + الحيّ + تفاصيل عن الموقع",
                        style: Theme.of(context).textTheme.labelSmall,
                        maxLines: 3,
                      )
                          : Container(),
                      open.value == true
                          ? Row(
                              children: [
                                Text(
                                  "نوع الوقود:  ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  "مازوت",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            )
                          : Container(),
                      open.value == true
                          ? Row(
                              children: [
                                Text(
                                  "كمية االتعبئة:  ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  "100",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            )
                          : Container(),
                      open.value == true
                          ? Column(
                              children: [
                                Text(
                                  "اسم الزبون و هاتفه:  ",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  "الاسم الكامل",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  "0936262626",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            )
                          : Container(),
                      open.value == true ? InvoiceTable() : Container(),
                      Center(
                        child: Icon(
                          open.value == false
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          color: primaryColor,
                        ),
                      ),
                    ]),
              ),
              Image.asset(
                "assets/images/Home_FuelGo.png",
                fit: BoxFit.contain,
                width: 50,
                height: 50,
              ),
            ],
          ),
        ));
  }
}

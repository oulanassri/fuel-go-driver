import 'package:flutter/material.dart';

import '../../../models/complete_order_response.dart';
import '../../constants.dart';

class Invoice extends StatelessWidget {
  Invoice({Key? key, required this.completeOrderResponse}) : super(key: key);
  final CompleteOrderResponse completeOrderResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label: Text(
                    "الكميّة ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "السعر",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DataColumn(
                  label: Text(
                    "الفاتورة",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
              rows: [
                invoiceDataRow(
                    context: context,
                    serviceName: completeOrderResponse.finalQuantity.toString() ?? "",
                    quantity:  completeOrderResponse.finalPrice.toString()??"",
                    amount: completeOrderResponse.price.toString() ?? ""),
                /*   invoiceDataRow(
                    context: context,
                    serviceName: 'خدمة',
                    quantity: 'إجرة التوصيل',
                    amount: '6\$'),
                invoiceDataRow(
                    context: context,
                    serviceName: '',
                    quantity: 'المبلغ الكلّي',
                    amount: '36\$'),*/
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow invoiceDataRow({
    required BuildContext context,
    required String serviceName,
    required String quantity,
    required String amount,
  }) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            serviceName ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            quantity ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        DataCell(
          Text(
            amount ?? "",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}

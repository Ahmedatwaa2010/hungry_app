import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_text.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.order,
    required this.taxes,
    required this.fees,
    required this.total,
  });
  final String order, taxes, fees, total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        checkoutWidget("Order", order, false, 15),
        Gap(20),
        checkoutWidget("Taxes", taxes, false, 15),
        Gap(20),
        checkoutWidget("Delivery fees", fees, false, 15),
        Gap(20),
        Divider(),
        Gap(35),
        checkoutWidget("Total:", "\$$total", true, 22),
        Gap(30),
        checkoutWidget("Estimated delivery time:", "15 - 30 mins", true, 15),
        Gap(30),
      ],
    );
  }
}

Widget checkoutWidget(String title, String price, bool isbold, double size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        text: title,
        fontSize: size,
        color: isbold ? Colors.black : Colors.grey.shade600,
        fontWeight: isbold ? FontWeight.bold : FontWeight.w500,
      ),
      CustomText(text: price, fontSize: 17, color: Colors.grey.shade600),
    ],
  );
}

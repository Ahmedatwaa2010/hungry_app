import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/check_out/widgets/check_out_widget.dart';
import 'package:hungry_app/features/check_out/widgets/order_details_widgets.dart';
import 'package:hungry_app/features/check_out/widgets/success_dialog.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/pop_icon.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  String selectedMethode = "Cash";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const PopIcon(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CustomText(
                text: "Order summary",
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderDetails(
                    order: "15",
                    taxes: "20",
                    fees: "1515",
                    total: "2000",
                  ),

                  Gap(30),
                  CustomText(
                    text: "Payment methods",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  Gap(50),
                  CheckOutWidget(
                    ontab: () => setState(() {
                      selectedMethode = "Cash";
                    }),
                    onChanged: (value) => setState(() {
                      selectedMethode = value!;
                    }),
                    values: "Cash",
                    groupValue: selectedMethode,
                    color: Color(0xff3C2F2F),
                    image: Image.asset(
                      "assets/logo/dollar Background Removed 1 (2).png",
                    ),
                    title: CustomText(
                      text: "Cash on Delivery",
                      color: Colors.white,
                    ),
                  ),
                  Gap(40),
                  CheckOutWidget(
                    ontab: () => setState(() {
                      selectedMethode = "Debit";
                    }),
                    onChanged: (value) => setState(() {
                      selectedMethode = value!;
                    }),
                    values: "Debit",
                    groupValue: selectedMethode,
                    image: Image.asset("assets/logo/image 13.png"),
                    color: Color(0xffF3F4F6),
                    title: CustomText(
                      text: "Debit card",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    subtitle: CustomText(
                      text: "3566 **** **** 0505",
                      color: Color(0xff808080),
                    ),
                  ),
                  Gap(10),

                  Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0xffEF2A39),
                        value: true,
                        onChanged: (v) {},
                      ),

                      CustomText(
                        text: "Save card details for future payments",
                        color: Color(0xff808080),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 15, offset: Offset(0, 0)),
          ],
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: "Total", fontSize: 18),
                  Gap(4),
                  CustomText(text: "18.19", fontSize: 25),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomButton(
                text: "Pay Now",
                width: 200,
                height: 70,
                onTap: () {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return SuccessDialog();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

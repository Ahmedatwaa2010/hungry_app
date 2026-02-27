import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/cart/view/widgets/card.dart';
import 'package:hungry_app/features/check_out/view/check_out_view.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late final List<int> quantity;
  static const int itemCount = 4;

  @override
  void initState() {
    super.initState();
    quantity = List<int>.filled(itemCount, 1);
  }

  void onAdd(int index) => setState(() => quantity[index]++);
  void onMins(int index) {
    if (quantity[index] > 1) setState(() => quantity[index]--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 50,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 150), // space for bottomSheet
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomCard(
                text: "Hamburger",
                dec: "Veggie Burger",
                imageurl: "assets/logo/test.png",
                number: quantity[index],
                onAdd: () => onAdd(index),
                onMins: () => onMins(index),
              ),
            );
          },
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 120,
        color: Colors.white,
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
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: "Check out",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckOutView(),
                    ),
                  );
                },
                width: 200,
                height: 51,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

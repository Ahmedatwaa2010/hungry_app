import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

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
          padding: const EdgeInsets.only(bottom: 100), // space for bottomSheet
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "assets/logo/test.png",
                              width: 111,
                              height: 102.17573547363281,
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 10,
                          ),
                          child: Column(
                            children: [
                              Gap(10),
                              CustomText(
                                text: "Hamburger",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              Gap(10),
                              CustomText(
                                text: "qty : x3",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              Gap(10),
                              CustomText(
                                text: "Price : 200\$",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                        color: Colors.grey.shade500,
                        text: "order again",
                        width: double.infinity,
                        height: 60,
                      ),
                    ),
                    Gap(30),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

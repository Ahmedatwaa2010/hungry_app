import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/product/widgets/spicy_slider.dart';
import 'package:hungry_app/features/product/widgets/toppings.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/pop_icon.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double value = 0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: PopIcon(),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              SpicySlider(
                value: value,
                onChanged: (v) => setState(() {
                  value = v;
                }),
              ),
              Gap(50),
              CustomText(text: "Toppings", fontSize: 30),
              Gap(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Toppings(
                        imageUrl: "assets/logo/pngwing 15.png",
                        title: "Tomato",
                        onAdd: () {},
                      ),
                    );
                  }),
                ),
              ),
              Gap(30),
              CustomText(text: "Side options", fontSize: 30),
              Gap(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Toppings(
                        imageUrl: "assets/logo/pngwing 15.png",
                        title: "Tomato",
                        onAdd: () {},
                      ),
                    );
                  }),
                ),
              ),
              Gap(60),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CustomText(text: "Total", fontSize: 18),

                        CustomText(text: "18.19", fontSize: 25),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: "Add To Cart",
                      onTap: () {},
                      width: 200,
                      height: 60,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

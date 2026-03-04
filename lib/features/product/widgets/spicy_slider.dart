import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constant/app_color.dart';
import 'package:hungry_app/shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({super.key, required this.value, required this.onChanged});
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/logo/h.png", height: 297, width: 200),
        Spacer(),
        Column(
          children: [
            CustomText(
              text:
                  "Customize Your\n Burger to Your Tastes.\n Ultimate Experience",
            ),

            Slider(
              min: 0,
              max: 0.7,
              value: widget.value,
              onChanged: widget.onChanged,
              activeColor: PrimaryColors.primaryColor,
              inactiveColor: Colors.grey.shade300,
            ),
            Row(
              children: [
                CustomText(text: "🥶"),
                Gap(100),
                CustomText(text: "🌶"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

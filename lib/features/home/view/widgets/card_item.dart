import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rate,
  });

  final String image, title, subtitle, rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/logo/test.png", width: 180),
            ),
            Gap(10),
            CustomText(text: title, fontSize: 18, fontWeight: FontWeight.bold),
            Gap(2),
            CustomText(
              text: subtitle,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            Row(
              children: [
                CustomText(
                  text: "⭐ $rate",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                Spacer(),
                Icon(CupertinoIcons.heart_fill),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

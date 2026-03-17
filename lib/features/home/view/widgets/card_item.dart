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
    final width = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            Expanded(
              flex: 5,
              child: Center(
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),

            const Gap(8),

            /// TITLE
            CustomText(
              text: title,
              fontSize: width * 0.04,
              fontWeight: FontWeight.bold,
              maxLines: 1,
            ),

            const Gap(4),

            /// DESCRIPTION
            CustomText(
              text: subtitle,
              fontSize: width * 0.032,
              fontWeight: FontWeight.w400,
              maxLines: 2,
            ),

            const Spacer(),

            /// RATING + FAVORITE
            Row(
              children: [
                CustomText(
                  color: Colors.black,
                  text: "⭐ $rate",
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.w400,
                ),
                const Spacer(),
                const Icon(
                  CupertinoIcons.heart_fill,
                  size: 20,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

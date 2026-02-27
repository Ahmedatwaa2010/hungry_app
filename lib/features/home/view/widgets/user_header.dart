import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constant/app_color.dart';
import 'package:hungry_app/shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/logo/logo.svg',
              color: PrimaryColors.primaryColor,
              height: 35,
            ),
            const Spacer(),
            CircleAvatar(
              radius: 31,
              backgroundColor: PrimaryColors.primaryColor,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ),
        CustomText(
          text: "Hello, Rich Sonic",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade500,
        ),
      ],
    );
  }
}

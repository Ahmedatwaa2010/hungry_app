import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constant/app_color.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 220),
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Gap(50),
            CircleAvatar(
              radius: 50,
              backgroundColor: PrimaryColors.primaryColor,
              child: Icon(Icons.check, color: Colors.white, size: 45),
            ),
            Gap(50),
            CustomText(
              text: "Success !",
              color: PrimaryColors.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            Gap(10),
            CustomText(
              text:
                  "Your payment was successful. \n A receipt for this purchase has \n been sent to your email.",
              color: Colors.grey.shade500,
            ),
            Gap(30),
            CustomButton(
              text: "Go Back",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

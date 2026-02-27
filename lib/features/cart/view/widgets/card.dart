import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constant/app_color.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.text,
    required this.dec,
    this.onAdd,
    this.onMins,
    required this.imageurl,
    required this.number,
  });
  final String text;
  final String dec;
  final VoidCallback? onAdd;
  final VoidCallback? onMins;
  final String imageurl;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                children: [
                  Image.asset(imageurl, width: 111, height: 102.17573547363281),
                  CustomText(text: text, fontWeight: FontWeight.bold),
                  CustomText(text: dec),
                ],
              ),

              Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onAdd,
                        child: CircleAvatar(
                          backgroundColor: PrimaryColors.primaryColor,
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                      Gap(20),
                      CustomText(
                        text: number.toString(),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      Gap(20),
                      GestureDetector(
                        onTap: onMins,
                        child: CircleAvatar(
                          backgroundColor: PrimaryColors.primaryColor,
                          child: Icon(
                            CupertinoIcons.minus,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(45),
                  Container(
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: PrimaryColors.primaryColor,
                    ),
                    child: Center(
                      child: CustomText(text: "Remove", color: Colors.white),
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

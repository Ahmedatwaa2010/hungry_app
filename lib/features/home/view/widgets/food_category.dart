import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constant/app_color.dart';
import 'package:hungry_app/shared/custom_text.dart';

class FoodCategory extends StatefulWidget {
  const FoodCategory({
    super.key,
    required this.categories,
    required this.selectedIndex,
  });
  final List categories;
  final int selectedIndex;
  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.categories.length, (index) {
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? PrimaryColors.primaryColor
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: CustomText(
                text: widget.categories[index],
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.white : Colors.black,
              ),
            ),
          );
        }),
      ),
    );
  }
}

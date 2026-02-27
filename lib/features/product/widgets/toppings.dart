import 'package:flutter/material.dart';

class Toppings extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onAdd;

  const Toppings({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: 80,
                height: 75,
              ),
            ),

            // Bottom section
            Container(
              height: 50,
              color: Color(0xff3C2F2F),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: onAdd,
                    borderRadius: BorderRadius.circular(12),
                    child: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  const CategoryText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 16,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 24,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TrendingText extends StatelessWidget {
  const TrendingText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 12,
        bottom: 16,
      ),
      child: Text(
        "Trending🔥",
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 24,
        ),
      ),
    );
  }
}

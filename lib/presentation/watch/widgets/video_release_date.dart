import 'package:flutter/material.dart';

class VideoReleaseDate extends StatelessWidget {
  final DateTime releaseDate;
  const VideoReleaseDate({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_month,
          size: 15,
          color: Colors.grey,
        ),
        Text(
          " ${releaseDate.toString().split(' ')[0]}",
          style: const TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}

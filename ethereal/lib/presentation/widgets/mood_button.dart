import 'package:flutter/material.dart';
import '../../data/models/mood.dart';

class MoodButton extends StatelessWidget {
  final Mood mood;
  final VoidCallback onTap;

  const MoodButton({super.key, required this.mood, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(width: 50, height: 50, decoration: BoxDecoration()),
    );
  }
}

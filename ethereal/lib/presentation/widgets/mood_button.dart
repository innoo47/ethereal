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
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(mood.emoji, style: TextStyle(fontSize: 30)),
            SizedBox(height: 10),
            Text(
              mood.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ethereal/data/models/mood.dart';
import 'package:ethereal/presentation/widgets/mood_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* mood 선택 위젯 */
              const Text(
                '현재 기분을 선택하세요!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,

                children:
                    moods
                        .map((mood) => MoodButton(mood: mood, onTap: () {}))
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

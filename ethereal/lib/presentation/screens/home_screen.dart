import 'package:ethereal/core/database_service.dart';
import 'package:ethereal/data/models/mood.dart';
import 'package:ethereal/presentation/screens/music_screen.dart';
import 'package:ethereal/presentation/widgets/mood_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseService _dbService = DatabaseService();
  final List<String> _recentMoods = [];

  @override
  void initState() {
    super.initState();
    _dbService.getRecentMoods().listen((moods) {
      setState(() {});
    });
  }

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
                        .map(
                          (mood) => MoodButton(
                            mood: mood,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => MusicScreen(mood: mood.name),
                                ),
                              );
                            },
                          ),
                        )
                        .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

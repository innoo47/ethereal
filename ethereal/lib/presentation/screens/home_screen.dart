import 'package:ethereal/domain/entities/mood.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ethereal/presentation/bloc/mood/mood_bloc.dart';
import 'package:ethereal/presentation/bloc/mood/mood_event.dart';
import 'package:ethereal/presentation/bloc/mood/mood_state.dart';
import 'package:ethereal/presentation/widgets/mood_button.dart';
import 'package:ethereal/presentation/screens/music_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onMoodSelected(BuildContext context, String mood) {
    context.read<MoodBloc>().add(SelectMood(mood));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MusicScreen(mood: mood)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ethereal')),
      body: BlocBuilder<MoodBloc, MoodState>(
        builder: (context, state) {
          List<String> recentMoods = [];
          if (state is RecentMoodsLoaded) {
            recentMoods = state.moods;
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* 감정 선택 안내 문구 */
              const Text(
                '현재 기분을 선택하세요!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              /* 감정 선택 버튼 */
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    moods
                        .map(
                          (mood) => MoodButton(
                            mood: mood,
                            onTap: () => _onMoodSelected(context, mood.name),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 30),
              /* 최근 선택한 감정 리스트 */
              if (recentMoods.isNotEmpty) ...[
                const Text(
                  '최근 선택한 감정',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children:
                      recentMoods
                          .map((mood) => Chip(label: Text(mood)))
                          .toList(),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

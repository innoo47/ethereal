import 'package:ethereal/presentation/bloc/mood/mood_bloc.dart';
import 'package:ethereal/presentation/bloc/mood/mood_event.dart';
import 'package:ethereal/presentation/bloc/music/music_bloc.dart';
import 'package:ethereal/core/api_service.dart';
import 'package:ethereal/core/database_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ethereal/presentation/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final DatabaseService _dbService = DatabaseService();
  final YouTubeService _youtubeService = YouTubeService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoodBloc(_dbService)..add(LoadRecentMoods()),
        ),
        BlocProvider(create: (context) => MusicBloc(_youtubeService)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

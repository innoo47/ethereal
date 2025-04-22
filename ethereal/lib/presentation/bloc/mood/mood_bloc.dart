import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ethereal/core/database_service.dart';
import 'mood_event.dart';
import 'mood_state.dart';

class MoodBloc extends Bloc<MoodEvent, MoodState> {
  final DatabaseService _dbService;

  MoodBloc(this._dbService) : super(MoodInitial()) {
    on<SelectMood>((event, emit) async {
      await _dbService.saveMood(event.mood);
      emit(MoodSelected(event.mood));
    });

    on<LoadRecentMoods>((event, emit) {
      _dbService.getRecentMoods().listen((moods) {
        emit(RecentMoodsLoaded(moods));
      });
    });
  }
}

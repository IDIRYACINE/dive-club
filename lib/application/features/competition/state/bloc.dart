import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'state.dart';

class CompetitionBloc extends Bloc<CompetitionEvent, CompetitionState> {
  CompetitionBloc() : super(CompetitionState.initial()) {
    on<LoadScoresEvent>(_handleLoadScoresEvent);
    on<AddScoreEvent>(_handleAddScoreEvent);
    on<UpdateScoreEvent>(_handleUpdateScoreEvent);
  }

  FutureOr<void> _handleUpdateScoreEvent(
      UpdateScoreEvent event, Emitter<CompetitionState> emit) {}

  FutureOr<void> _handleAddScoreEvent(
      AddScoreEvent event, Emitter<CompetitionState> emit) {
        final newState = state.copyWith(
          scores: [...state.scores , event.score]
        );

        emit(newState);
      }

  FutureOr<void> _handleLoadScoresEvent(
      LoadScoresEvent event, Emitter<CompetitionState> emit) {
        emit(state.copyWith(scores: event.scores));
      }
}

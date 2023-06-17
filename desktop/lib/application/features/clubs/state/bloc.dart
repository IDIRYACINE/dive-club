import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'state.dart';

class ClubBloc extends Bloc<ClubEvent, ClubState> {
  ClubBloc() : super(ClubState.initial()) {
    on<LoadClubsEvent>(_handleLoadSpecialitysEvent);
    on<AddClubEvent>(_handleAddClubEvent);
    on<UpdateClubEvent>(_handleUpdateClubEvent);
  }

  FutureOr<void> _handleUpdateClubEvent(
      UpdateClubEvent event, Emitter<ClubState> emit) {
        final newState = state.copyWith(
          clubs: state.clubs.map((club) {
            if(club.clubId.value == event.club.clubId.value) {
              return event.club;
            }
            return club;
          }).toList()
        );

        emit(newState);
      }

  FutureOr<void> _handleAddClubEvent(
      AddClubEvent event, Emitter<ClubState> emit) {
        final newState = state.copyWith(
          clubs: [...state.clubs , event.club]
        );

        emit(newState);
      }

  FutureOr<void> _handleLoadSpecialitysEvent(
      LoadClubsEvent event, Emitter<ClubState> emit) {
        emit(state.copyWith(clubs: event.clubs));
      }
}

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'state.dart';

class AgeDivisionBloc extends Bloc<AgeDivisionEvent, AgeDivisionState> {
  AgeDivisionBloc() : super(AgeDivisionState.initial()) {
    on<LoadAgeDivisionsEvent>(_handleLoadSpecialitysEvent);
    on<AddAgeDivisionEvent>(_handleAddAgeDivisionEvent);
    on<UpdateAgeDivisionEvent>(_handleUpdateAgeDivisionEvent);
  }

  FutureOr<void> _handleUpdateAgeDivisionEvent(
      UpdateAgeDivisionEvent event, Emitter<AgeDivisionState> emit) {
        final newState = state.copyWith(
          ageDivisions: state.ageDivisions.map((division) {
            if(division.divisionId.value == event.ageDivision.divisionId.value) {
              return event.ageDivision;
            }
            return division;
          }).toList()
        );

        emit(newState);
      }

  FutureOr<void> _handleAddAgeDivisionEvent(
      AddAgeDivisionEvent event, Emitter<AgeDivisionState> emit) {
        final newState = state.copyWith(
          ageDivisions: [...state.ageDivisions , event.ageDivision]
        );

        emit(newState);
      }

  FutureOr<void> _handleLoadSpecialitysEvent(
      LoadAgeDivisionsEvent event, Emitter<AgeDivisionState> emit) {
        emit(state.copyWith(ageDivisions: event.ageDivisions));
      }
}

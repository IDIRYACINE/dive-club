import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'state.dart';

class SpecialtyBloc extends Bloc<SpecialityEvent, SpecialtyState> {
  SpecialtyBloc() : super(SpecialtyState.initial()) {
    on<LoadSpecialtiesEvent>(_handleLoadSpecialitysEvent);
    on<AddSpecialtyEvent>(_handleAddSpecialityEvent);
    on<UpdateSpecialtyEvent>(_handleUpdateSpecialityEvent);
  }

  FutureOr<void> _handleUpdateSpecialityEvent(
      UpdateSpecialtyEvent event, Emitter<SpecialtyState> emit) {}

  FutureOr<void> _handleAddSpecialityEvent(
      AddSpecialtyEvent event, Emitter<SpecialtyState> emit) {
        final newState = state.copyWith(
          specialties: [...state.specialties , event.specialty]
        );

        emit(newState);
      }

  FutureOr<void> _handleLoadSpecialitysEvent(
      LoadSpecialtiesEvent event, Emitter<SpecialtyState> emit) {
        emit(state.copyWith(specialties: event.specialties));
      }
}

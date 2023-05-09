import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'state.dart';

class SpecialityBloc extends Bloc<SpecialityEvent, SpecialtyState> {
  SpecialityBloc() : super(SpecialtyState.initial()) {
    on<LoadSpecialtiesEvent>(_handleLoadSpecialitysEvent);
    on<AddSpecialtyEvent>(_handleAddSpecialityEvent);
    on<UpdateSpecialtyEvent>(_handleUpdateSpecialityEvent);
  }

  FutureOr<void> _handleUpdateSpecialityEvent(
      UpdateSpecialtyEvent event, Emitter<SpecialtyState> emit) {}

  FutureOr<void> _handleAddSpecialityEvent(
      AddSpecialtyEvent event, Emitter<SpecialtyState> emit) {}

  FutureOr<void> _handleLoadSpecialitysEvent(
      LoadSpecialtiesEvent event, Emitter<SpecialtyState> emit) {}
}

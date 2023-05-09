import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'state.dart';

class DivisionBloc extends Bloc<DivisionEvent, DivisionState> {
  DivisionBloc() : super(DivisionState.initial()) {
    
    on<LoadDivisionsEvent>(_handleLoadDivisionsEvent);
    on<AddDivisionEvent>(_handleAddDivisionEvent);
    on<UpdateDivisionEvent>(_handleUpdateDivisionEvent);
  }

  FutureOr<void> _handleUpdateDivisionEvent(
      UpdateDivisionEvent event, Emitter<DivisionState> emit) {}

  FutureOr<void> _handleAddDivisionEvent(
      AddDivisionEvent event, Emitter<DivisionState> emit) {}

  FutureOr<void> _handleLoadDivisionsEvent(
      LoadDivisionsEvent event, Emitter<DivisionState> emit) {}
}

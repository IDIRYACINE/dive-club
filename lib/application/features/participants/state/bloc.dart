import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'state.dart';

class ParticipantBloc extends Bloc<ParticipantEvent, ParticipantState> {
  ParticipantBloc() : super(ParticipantState.initial()) {
    on<LoadParticipantsEvent>(_handleLoadParticipantsEvent);
    on<AddParticipantEvent>(_handleAddParticipantEvent);
    on<UpdateParticipantEvent>(_handleUpdateParticipantEvent);
  }

  FutureOr<void> _handleUpdateParticipantEvent(
      UpdateParticipantEvent event, Emitter<ParticipantState> emit) {}

  FutureOr<void> _handleAddParticipantEvent(
      AddParticipantEvent event, Emitter<ParticipantState> emit) {}

  FutureOr<void> _handleLoadParticipantsEvent(
      LoadParticipantsEvent event, Emitter<ParticipantState> emit) {}
}

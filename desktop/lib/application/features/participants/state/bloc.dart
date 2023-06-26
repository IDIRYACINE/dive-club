import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';
import 'state.dart';

class ParticipantBloc extends Bloc<ParticipantEvent, ParticipantState> {
  ParticipantBloc() : super(ParticipantState.initial()) {
    on<LoadParticipantsEvent>(_handleLoadParticipantsEvent);
    on<AddParticipantEvent>(_handleAddParticipantEvent);
    on<UpdateParticipantEvent>(_handleUpdateParticipantEvent);
    on<DeleteParticipantEvent>(_handleDeleteParticipantEvent);
  }

  FutureOr<void> _handleUpdateParticipantEvent(
      UpdateParticipantEvent event, Emitter<ParticipantState> emit) {
    final updatedParticipants = state.participants
        .map((e) => e.participantId == event.participant.participantId
            ? event.participant
            : e)
        .toList();

    emit(state.copyWith(participants: updatedParticipants));
  }

  FutureOr<void> _handleAddParticipantEvent(
      AddParticipantEvent event, Emitter<ParticipantState> emit) {
    final newState = state
        .copyWith(participants: [...state.participants, event.participant]);
    emit(newState);
  }

  FutureOr<void> _handleLoadParticipantsEvent(
      LoadParticipantsEvent event, Emitter<ParticipantState> emit) {
    emit(state.copyWith(participants: event.participants));
  }

  FutureOr<void> _handleDeleteParticipantEvent(DeleteParticipantEvent event, Emitter<ParticipantState> emit) {
    final updatedParticipants = state.participants.where((element) => element.participantId != event.participantId).toList();

    emit(state.copyWith(participants: updatedParticipants));
  }
}

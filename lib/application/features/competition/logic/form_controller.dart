import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/competition/export.dart';
import 'package:dive_club/core/domain/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/events.dart';

class ScoreDataHolder {
  Score? score;
  ParticipantEntity? participant;

  ScoreDataHolder([this.participant]);
}

class ScoreController {
  static final key = GlobalKey<FormState>();

  ScoreController([ParticipantEntity? entity]) {
    _data = ScoreDataHolder(entity);
  }

  late ScoreDataHolder _data;

  void onCancel() {
    NavigationService.pop();
  }

  void onRegister(BuildContext context) {
    final isFormValid = key.currentState!.validate();
    if (isFormValid) {
      final bloc = BlocProvider.of<CompetitionBloc>(context);

      final entity = CompetitionScoreEntity(
        specialtyId: _data.participant!.specialtyId,
        divisionId: _data.participant!.divisionId,
        participantId: _data.participant!.participantId,
        score: _data.score!,
      );

      _registerCompetitionScore(entity);

      final event = AddScoreEvent(entity);

      bloc.add(event);
      NavigationService.pop();
    }
  }


  Future<void> _registerCompetitionScore(CompetitionScoreEntity entity) async {
    final options = CreateScoreOptions(
        score: CompetitionScore(
            participantId: entity.participantId.value,
            divisionId: entity.divisionId.value,
            specialityId: entity.specialtyId.value,
            score: entity.score.value,
            date: DateTime.now()));
    ServicesProvider.instance().databasePort.insertScore(options);
  }

  void printRakings() {}

  void printPrizes() {}

  void updateScore(String? value) {
    if (value == null) return;

    _data.score = Score.fromString(value);
  }
}


import 'package:dive_club/application/features/competition/logic/printer.dart';
import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:dive_club/application/features/specialties/feature.dart';
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
      final divisionBloc = BlocProvider.of<DivisionBloc>(context);
      final specialtyBloc = BlocProvider.of<SpecialtyBloc>(context);

      final divisionId = _data.participant!.divisionId;
      final specialtyId = _data.participant!.specialtyId;

      final entity = CompetitionScoreEntity(
        specialtyId: specialtyId,
        divisionId: divisionId,
        participantId: _data.participant!.participantId,
        score: _data.score!,
        divisionName: divisionBloc.state.divisionById(divisionId).divisionName,
        participantName: _data.participant!.participantName,
        specialtyName: specialtyBloc.state.specialtyById(specialtyId).specialtyName,
      );

      _registerCompetitionScore(entity);

      final event = AddScoreEvent(entity);

      bloc.add(event);
      NavigationService.pop();
    }
  }

  Future<void> _registerCompetitionScore(CompetitionScoreEntity entity) async {
    final options = CreateScoreOptions(
      participantId: entity.participantId.value,
      divisionId: entity.divisionId.value,
      specialityId: entity.specialtyId.value,
      score: entity.score.value,
      date: DateTime.now(),
    );
    ServicesProvider.instance().databasePort.insertScore(options);
  }

  void printRakings(CompetitionBloc bloc, ) async {
    final printer = CompetitionPrinter();
    printer.prepareNewDocument();
    await printer.createRankingsDocument(bloc.state.scores);
    printer.displayPreview();
  }

  void printPrizes(CompetitionBloc bloc) async {
    final printer = CompetitionPrinter();
    printer.prepareNewDocument();
    await printer.createCertifiactesDocument(bloc.state.scores);
    printer.displayPreview();
  }

  void updateScore(String? value) {
    if (value == null) return;

    _data.score = Score.fromString(value);
  }


}

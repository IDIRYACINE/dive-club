import 'package:dive_club/application/commons/widgets/filter.dart';
import 'package:dive_club/application/features/competition/logic/printer.dart';
import 'package:dive_club/application/features/competition/ui/forms.dart';
import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:dive_club/application/features/specialties/feature.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/events.dart';

class ScoreDataHolder {
  Score? score;
  ParticipantEntity? participant;

  String? searchId;

  ScoreDataHolder([this.participant]);
}

class ScoreController {
  static final key = GlobalKey<FormState>();

  ScoreController([ParticipantEntity? entity]) {
    _data = ScoreDataHolder(entity);
  }

  late ScoreDataHolder _data;

  get participant => _data.participant;

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

      final ageDivisionYear =
          AgeDivisionId(_data.participant!.participantBirthDate.year);

      final entity = CompetitionScoreEntity(
        specialtyId: specialtyId,
        divisionId: divisionId,
        participantId: _data.participant!.participantId,
        score: _data.score!,
        divisionName: divisionBloc.state.divisionById(divisionId).divisionName,
        participantName: _data.participant!.participantName,
        specialtyName:
            specialtyBloc.state.specialtyById(specialtyId).specialtyName,
        ageDivisionId: ageDivisionYear,
        genderId: GenderId(0),
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
      score: entity.score.toIntCode(),
      date: DateTime.now(),
      ageDivisionId: entity.ageDivisionId.value,
      genderId: entity.genderId.value,
    );
    ServicesProvider.instance().databasePort.insertScore(options);
  }

  void printRakings(
    CompetitionBloc bloc,
  ) async {
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

  void filterScores() {
    final dialog = FilterDialog(
      onConfirmPressed: _onFilter,
    );
    NavigationService.displayDialog(dialog);
  }

  void _onFilter(
    FilterOptions filterOptions,
  ) {
    final databasePort = ServicesProvider.instance().databasePort;

    final options = LoadCompetitionScoresOptions(
      divisionId: filterOptions.divisionId?.value,
      specialityId: filterOptions.specialtyId?.value,
    );

    databasePort.loadCompetitionScores(options).then((value) {
      final event = LoadScoresEvent(value.scores);
      filterOptions.competitionBloc!.add(event);
    });
  }

  Future<ParticipantEntity?> searchParticipant() async {
    final databasePort = ServicesProvider.instance().databasePort;

    final options =
        LoadParticipantsOptions(participantId: int.parse(_data.searchId!));

    final result = await databasePort.loadParticipants(options);

    final pr =
        result.participants.isNotEmpty ? result.participants.first : null;

    _data.participant = pr;

    return pr;
  }

  void addScore() {
    const dialog = ScoreDialog();
    NavigationService.displayDialog(dialog);
  }

  void updateSearchId(String? value) {
    _data.searchId = value;
  }
}

import 'package:dive_club/application/commons/widgets/filter.dart';
import 'package:dive_club/application/features/competition/ui/forms.dart';
import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:dive_club/application/features/specialties/feature.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/report.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/events.dart';

class ScoreDataHolder {
  String? score;
  ParticipantEntity? participant;

  String? searchId;

  ScoreDataHolder([this.participant]);
}

class ScoreController {
  static final key = GlobalKey<FormState>();
  late DiveReportGenerator report;

  ScoreController([ParticipantEntity? entity]) {
    _data = ScoreDataHolder(entity);
    final servicesProvider = ServicesProvider.instance();

    report = DiveReportGenerator(
        printerPort: servicesProvider.printerPort,
        dbPort: servicesProvider.databasePort,
        excelPort: servicesProvider.excelManagerPort);
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

      final divisionId = _data.participant!.division.divisionId;
      final specialtyId = _data.participant!.specialty.specialtyId;

      final club = _data.participant!.club;

      final ageDivision = _data.participant!.ageDivision;

      final gender = GenderEntity.fromId(_data.participant!.genderId);

      final entity = CompetitionScoreEntity(
        specialtyId: specialtyId,
        divisionId: divisionId,
        participantId: _data.participant!.participantId,
        score: Score.fromString(_data.score!),
        divisionName: divisionBloc.state.divisionById(divisionId).divisionName,
        participantName: _data.participant!.participantName,
        specialtyName:
            specialtyBloc.state.specialtyById(specialtyId).specialtyName,
        ageDivision: ageDivision,
        gender: gender,
        club: club,
        column: _data.participant!.column,
        series: _data.participant!.series,
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
      ageDivisionId: entity.ageDivision.divisionId.value,
      genderId: entity.gender.genderId.value,
    );
    ServicesProvider.instance().databasePort.insertScore(options);
  }

  void printRakings(
    CompetitionBloc bloc,
  ) async {
    await report.generateParticipantResults();
  }

  void printPrizes(CompetitionBloc bloc) async {
    ServicesProvider.instance()
        .printerPort
        .printCertificates(bloc.state.scores);
  }

  void updateScore(String? value) {
    if (value == null) return;

    _data.score = value;
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
        genderId: filterOptions.genderId?.value,
        ageDivisionId: filterOptions.ageDivisionId?.value);

    databasePort.loadCompetitionScores(options).then((value) {
      final event = LoadScoresEvent(value.scores);
      filterOptions.competitionBloc!.add(event);
    });
  }

  Future<ParticipantEntity?> searchParticipant(int searchId) async {
    final databasePort = ServicesProvider.instance().databasePort;

    final options = LoadParticipantsOptions(participantId: searchId);

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
}


Future<void> deleteScore(CompetitionBloc bloc,CompetitionScoreEntity entity) async {
  
}
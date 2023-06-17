import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/report.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';

import '../state/livemodel.dart';
import '../ui/developer_contacts.dart';
import '../ui/display_language_selector.dart';

class SettingsController {
  SettingsController(this.settingsLiveModel) {
    final sProvider = ServicesProvider.instance();
    report = DiveReportGenerator(
        printerPort: sProvider.printerPort,
        excelPort: sProvider.excelManagerPort,
        dbPort: sProvider.databasePort);
  }

  final SettingsLiveDataModel settingsLiveModel;
  late DiveReportGenerator report;

  void _onChangeDisplayLanguage(Locale locale) {
    settingsLiveModel.setDisplayLanguage(locale);
  }

  void changeDisplayLangauge(BuildContext context) {
    NavigationService.displayDialog(
      DisplayLanguageSelectorDialog(onConfirm: _onChangeDisplayLanguage),
    );
  }

  void changeAppTheme(BuildContext context) {}

  void displayAbout(BuildContext context) {
    NavigationService.displayDialog(
      const DeveloperContactDialog(),
    );
  }

  Future<void> importEngagements() async {
    report.registerParticipants();
    NavigationService.pop();
  }

  Future<void> printStartLists() async {
    await report.generateParticipantsSeries(
      updateDb: false,
    );
    NavigationService.pop();
  }

  Future<void> printPapillons() async {
    await report.printPapillons();
    NavigationService.pop();
  }

  Future<void> printRankings() async {
    await report.generateParticipantResults();
    NavigationService.pop();
  }

  Future<void> generateStartLists() async {
    report.generateParticipantsSeries(print: false);
  }
}

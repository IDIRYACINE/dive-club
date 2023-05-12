import 'package:dive_club/application/navigation/feature.dart';
import 'package:flutter/material.dart';

import '../state/livemodel.dart';
import '../ui/developer_contacts.dart';
import '../ui/display_language_selector.dart';

class SettingsController {
  SettingsController(this.settingsLiveModel);

  final SettingsLiveDataModel settingsLiveModel;

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
}

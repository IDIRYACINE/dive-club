import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/application/commons/widgets/menus.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:dive_club/resources/measures.dart';
import 'package:dive_club/resources/metadata.dart';
import 'package:flutter/material.dart';

typedef LocaleCallback = void Function(Locale locale);

class DisplayLanguageSelectorForm extends StatelessWidget {
  const DisplayLanguageSelectorForm({Key? key, required this.onConfirm})
      : super(key: key);

  final LocaleCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<Locale> selectedLocale =
        ValueNotifier(AppMetadata.supportedLocales[0]);
    final localizations = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DisplayLanguageSelector(
          selectedLanguage: (selectedLocale),
        ),
        const SizedBox(
          width: AppMeasures.space,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonPrimary(
              text: localizations.cancelLabel,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ButtonPrimary(
              text: localizations.confirmLabel,
              onPressed: () {
                onConfirm(selectedLocale.value);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class DisplayLanguageSelector extends StatelessWidget {
  const DisplayLanguageSelector({
    Key? key,
    required this.selectedLanguage,
  }) : super(key: key);

  final ValueNotifier<Locale> selectedLanguage;

  DropdownMenuItem<Locale> localeDropdownAdapter(Locale locale) {
    return DropdownMenuItem<Locale>(
      value: locale,
      child: Text(locale.languageCode),
    );
  }

  List<DropdownMenuItem<Locale>>? buildDropdown(List<Locale> languages) {
    List<DropdownMenuItem<Locale>>? items = [];
    for (Locale lang in languages) {
      items.add(localeDropdownAdapter(lang));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.selectLanguage,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          width: AppMeasures.space,
        ),
        Expanded(
          child: SelectorDropDown<Locale>(
              items: buildDropdown(AppMetadata.supportedLocales),
              onSelect: (value) => selectedLanguage.value = value,
              initialSelection: selectedLanguage),
        )
      ],
    );
  }
}

class DisplayLanguageSelectorDialog extends StatelessWidget {
  const DisplayLanguageSelectorDialog({Key? key, required this.onConfirm})
      : super(key: key);

  final LocaleCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: DisplayLanguageSelectorForm(onConfirm: onConfirm),
    );
  }
}

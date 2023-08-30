import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/application/features/ageDivision/ui/actions.dart';
import 'package:dive_club/application/features/divisions/ui/actions.dart';
import 'package:dive_club/application/features/gender/actions.dart';
import 'package:dive_club/application/features/specialties/ui/actions.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/entities/diving/entity.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:dive_club/resources/measures.dart';
import 'package:flutter/material.dart';

import 'certificate_controller.dart';

class CertificateDialog extends StatefulWidget {
  const CertificateDialog({super.key});

  @override
  State<StatefulWidget> createState() => _CertificateDialogState();
}

class _CertificateDialogState extends State<CertificateDialog> {
  bool selectAll = true;

  void _switchMode(bool? value) {
    setState(() {
      selectAll = value ?? false;
    });
  }

  final GlobalKey<CertifiacteFormState> key = GlobalKey<CertifiacteFormState>();


  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RadioListTile<bool>(
            title: Text(localizations.autoPrint),
            groupValue: selectAll,
            value: true,
            onChanged: _switchMode,
          ),
          RadioListTile<bool>(
            title: Text(localizations.customPrintPrize),
            groupValue: selectAll,
            value: false,
            onChanged: _switchMode,
          ),
          if (!selectAll)  Expanded(child: CertifiacteForm(key:key)),
          const SizedBox(
            height: AppMeasures.space,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () => NavigationService.pop(),
                  child: Text(localizations.cancelLabel)),
              ButtonPrimary(
                text: localizations.confirmLabel,
                onPressed: () {
                  onPrintCustomPrizes(key);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CertifiacteForm extends StatefulWidget {
  const CertifiacteForm({super.key});

  @override
  State<StatefulWidget> createState() => CertifiacteFormState();
}

class CertifiacteFormState extends State<CertifiacteForm> {


  
  final List<CertificatePrinterOptions> options = [];

  AgeDivisionEntity? ageEntity;
  GenderEntity? genderEntity;
  DivingSpecialtyEntity? specialtyEntity;
  DivingDivisionEntity? divisionEntity;

  void updateSpecialtyEntity(DivingSpecialtyEntity? entity) {
    specialtyEntity = entity;
  }

  void updateDivisionEntity(DivingDivisionEntity? entity) {
    divisionEntity = entity;
  }

  void updateAgeEntity(AgeDivisionEntity? entity) {
    ageEntity = entity;
  }

  void updateGenderEntity(GenderEntity? entity) {
    genderEntity = entity;
  }

  void removeOption(CertificatePrinterOptions option) {
    setState(() {
      options.remove(option);
    });
  }

  void addOption(CertificatePrinterOptions option) {
    bool exists = false;
    for (CertificatePrinterOptions cOption in options) {
      if (cOption.equals(option)) {
        exists = true;
        break;
      }
    }

    if (!exists) {
      setState(() {
        options.add(option);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = CertificateController(widget.key as GlobalKey<CertifiacteFormState> );

    return SizedBox(
      width: 1200,
      height: 800,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AgeDivisionDropdown(
                  onSelected: updateAgeEntity,
                ),
              ),
              const SizedBox(
                width: AppMeasures.space,
              ),
              Flexible(child: GenderDropdown(onSelected: updateGenderEntity))
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: DivisionDropdown(onSelected: updateDivisionEntity)),
              const SizedBox(
                width: AppMeasures.space,
              ),
              Flexible(
                  child: SpecialtyDropdown(onSelected: updateSpecialtyEntity)),
            ],
          ),
          const SizedBox(
            height: AppMeasures.space,
          ),
          ButtonPrimary(onPressed: controller.onConfirm, text: "add"),
          const SizedBox(
            height: AppMeasures.space,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: _itemBuilder,
                  separatorBuilder: _separatorBuilder,
                  itemCount: options.length),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final option = options[index];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => removeOption(option),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(option.ageEntity.divisionName.value),
              Text(option.genderEntity.genderName.value),
              Text(option.divisionEntity.divisionName.value),
              Text(option.specialtyEntity.specialtyName.value),
            ],
          ),
        ),
      ),
    );
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return const SizedBox(
      height: AppMeasures.space,
    );
  }
}

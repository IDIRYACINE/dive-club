import 'dart:typed_data';

import 'package:dive_club/application/commons/utility/validators.dart';
import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/application/features/competition/feature.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:dive_club/resources/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import 'certaficates/certificate_dialog.dart';

class PrinterDialog extends StatelessWidget {
  const PrinterDialog({super.key, required this.preparedDoc});

  final Uint8List preparedDoc;

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (pageFormat) => preparedDoc,
      maxPageWidth: 700,
      actions: [
        IconButton(
          onPressed: () {
            NavigationService.pop();
          },
          icon: const Icon(Icons.close),
        )
      ],
    );
  }
}

class PreparingPrinterDialog extends StatelessWidget {
  const PreparingPrinterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(localization.preparingPrint),
          const SizedBox(
            height: 20,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}

class ChoosePrintModeDialog extends StatelessWidget {
  const ChoosePrintModeDialog({super.key, required this.bloc});
  final CompetitionBloc bloc;

  void onAutoPrint() {
    // ServicesProvider.instance()
    //     .printerPort
    //     .printCertificates(bloc.state.scores);
    const dialog =  CertificateDialog();
    NavigationService.replaceDialog(dialog);
  }

  void onCustomPrint() {
    final dialog = CustomPrizeDialog(
      bloc: bloc,
    );
    NavigationService.replaceDialog(dialog);
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(localization.printerMode),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonPrimary(
            width: double.infinity,
            onPressed: onAutoPrint,
            text: localization.autoPrint,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonPrimary(
            width: double.infinity,
            onPressed: onCustomPrint,
            text: localization.customPrintPrize,
          ),
        ],
      ),
    );
  }
}

class _CustomPrizeController {
  _CustomPrizeController();

  int participantId = -1;
  int participantRank = -1;
  late CompetitionBloc bloc;

  static final key = GlobalKey<FormState>();

  void onCancel() {
    NavigationService.maybePop();
  }

  void onPrint() {
    final isFormValid = key.currentState!.validate();
    final validInput = participantId != -1 && participantRank != -1;

    if (isFormValid && validInput) {
      final participant = bloc.state.aggregate.searchScore(
        participantId: participantId,
      );

      if (participant == null) {
        return;
      }

      ServicesProvider.instance()
          .printerPort
          .printCustomCertificate(participant, participantRank);
    }
  }

  void updateParticipantId(String value) {
    participantId = int.tryParse(value) ?? -1;
  }

  void updateParticipantRank(String value) {
    participantRank = int.tryParse(value) ?? -1;
  }
}

class CustomPrizeDialog extends StatelessWidget {
  CustomPrizeDialog({super.key, required this.bloc});

  final CompetitionBloc bloc;
  final controller = _CustomPrizeController();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    controller.bloc = bloc;

    return AlertDialog(
      title: Text(localization.customPrintPrize),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: _CustomPrizeController.key,
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Participant Id",
                ),
                validator: validatorId,
                onChanged: controller.updateParticipantId,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Participant Rank",
                ),
                validator: validatorId,
                onChanged: controller.updateParticipantRank,
              )
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonPrimary(
                onPressed: controller.onCancel,
                text: localization.cancelLabel,
              ),
             
              ButtonPrimary(
                onPressed: controller.onPrint,
                text: localization.confirmLabel,
              ),
            ],
          )
        ],
      ),
    );
  }
}

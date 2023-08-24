import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:flutter/material.dart';

import 'certificate_dialog.dart';

class CertificateController {
  final GlobalKey<CertifiacteFormState> key;

  CertificateController(this.key);

  void onConfirm() {
    final state = key.currentState!;

    final validAge = state.ageEntity != null;
    final validDivision = state.divisionEntity != null;
    final validGender = state.genderEntity != null;
    final validSpecialty = state.specialtyEntity != null;


    if (validAge && validDivision && validGender && validSpecialty) {
      state.addOption(CertificatePrinterOptions.fromState(state));
    }
  }
}

class CertificatePrinterOptions {
  final AgeDivisionEntity ageEntity;
  final GenderEntity genderEntity;
  final DivingSpecialtyEntity specialtyEntity;
  final DivingDivisionEntity divisionEntity;

  CertificatePrinterOptions(
      {required this.ageEntity,
      required this.genderEntity,
      required this.specialtyEntity,
      required this.divisionEntity});

  factory CertificatePrinterOptions.fromState(CertifiacteFormState state) {
    return CertificatePrinterOptions(
        ageEntity: state.ageEntity!,
        divisionEntity: state.divisionEntity!,
        genderEntity: state.genderEntity!,
        specialtyEntity: state.specialtyEntity!);
  }

  bool equals(CertificatePrinterOptions option) {
    return option.ageEntity.equals(ageEntity) &&
        option.divisionEntity.equals(divisionEntity) &&
        option.specialtyEntity.equals(specialtyEntity) &&
        option.genderEntity.equals(genderEntity);
  }
}



Future<void> onPrintCustomPrizes(GlobalKey<CertifiacteFormState> key) async {

  final options = key.currentState?.options;

  if(options != null && options.isNotEmpty){

    // final printerPort = ServicesProvider.instance().printerPort;
    // TODO: implement print custom prizes

    return;
  }

}
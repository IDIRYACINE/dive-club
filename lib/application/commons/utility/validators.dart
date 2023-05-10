

import 'package:dive_club/core/domain/diving/export.dart';

String? validatorEmptyText(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}


String? validatorDivingDivision(DivingDivisionEntity? value) {
  if (value == null) {
    return 'Please select a division';
  }
  return null;
}


String? validatorDivingSpecialty(DivingSpecialtyEntity? value) {
  if (value == null) {
    return 'Please select a specialty';
  }
  return null;
}


import 'package:dive_club/core/domain/clubs/export.dart';
import 'package:dive_club/core/domain/diving/export.dart';

String? validatorEmptyText(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  return null;
}


String? validatorScore(String? value) {
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

String? validatorAgeDivision(AgeDivisionEntity? value) {
  if (value == null) {
    return 'Please select an age division';
  }
  return null;
}


String? validatorClub(ClubEntity? value) {
  if (value == null) {
    return 'Please select a club';
  }
  return null;
}
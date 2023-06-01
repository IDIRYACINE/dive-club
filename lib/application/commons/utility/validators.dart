import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';

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

String? validatorGender(GenderEntity? value) {
  if (value == null) {
    return 'Please select a gender';
  }
  return null;
}

String? validatorId(String? value) {
  if ((value == null) || (int.tryParse(value) == null)) {
    return 'Please enter a valid id';
  }
  return null;
}

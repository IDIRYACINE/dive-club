import 'package:flutter/foundation.dart';

class DivisionId {
  final int value;

  DivisionId(this.value);

  bool equals(DivisionId cDivision) {
    return cDivision.value == value;
  }
}

class DivisionName {
  final String value;

  DivisionName(this.value);
}

class SpecialtyId {
  final int value;

  SpecialtyId(this.value);

  bool equals(SpecialtyId cSpecialty) {
    return cSpecialty.value == value;
  }
}

class SpecialtyName {
  final String value;

  SpecialtyName(this.value);
}

class AgeDivisionId {
  final int value;

  AgeDivisionId(this.value);


  factory AgeDivisionId.fromString(String value) {
    int test = 1800;

    try {
      test = int.parse(value);
    }
    catch(e){
      debugPrint("error parsing score : $value");
    }

    return AgeDivisionId(test);
  }

  static AgeDivisionId fromDate(DateTime value) {
    final year = value.year;
    return AgeDivisionId(year);
  }

  @override
  String toString() {
    return value.toString();
  }

  bool equals(AgeDivisionId cAgeDivision) {
    return cAgeDivision.value == value;
  }
}

class AgeDivisionName {
  final String value;

  AgeDivisionName(this.value);
}

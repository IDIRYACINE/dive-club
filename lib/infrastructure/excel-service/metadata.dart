import 'package:dive_club/core/entities/diving/export.dart';

class EngagementsSheetRows {
  static const nameIndex = 1;
  static const lastNameIndex = 2;
  static const ageDivisionIndex = 3;
  static const categoryIndex = 4;
  static const clubIndex = 5;
  static const sexIndex = 6;
  static const freeStyle50m = 7;
  static const freeStyle100m = 8;
  static const freeStyle200m = 9;
  static const dosStyle50m = 10;
  static const dosStyle100m = 11;
  static const brassStyle50m = 12;
  static const brassStyle100m = 13;
  static const papillonStyle50m = 14;
  static const nageStyle = 16;

  static DivisionProfile divisionProfileFromIndex(int columnIndex) {
    switch (columnIndex) {
      case freeStyle50m:
        return DivisionProfile(divisionId: 0, specialtyId: 0);

      case freeStyle100m:
        return DivisionProfile(divisionId: 0, specialtyId: 1);

      case freeStyle200m:
        return DivisionProfile(divisionId: 0, specialtyId: 2);

      case dosStyle50m:
        return DivisionProfile(divisionId: 1, specialtyId: 0);

      case dosStyle100m:
        return DivisionProfile(divisionId: 1, specialtyId: 1);

      case brassStyle50m:
        return DivisionProfile(divisionId: 2, specialtyId: 0);

      case brassStyle100m:
        return DivisionProfile(divisionId: 2, specialtyId: 1);

      case nageStyle:
        return DivisionProfile(divisionId: 4, specialtyId: 1);

      case papillonStyle50m:
        return DivisionProfile(divisionId: 3, specialtyId: 0);

      default:
        return DivisionProfile(divisionId: 3, specialtyId: 0);
    }
  }
}

class DivisionProfile {
  late DivisionId divisionId;
  late SpecialtyId specialtyId;

  DivisionProfile({required int divisionId, required int specialtyId}) {
    this.divisionId = DivisionId(divisionId);
    this.specialtyId = SpecialtyId(specialtyId);
  }
}

import 'package:dive_club/core/entities/diving/export.dart';

class EngagementsSheetRows {
  static const nameIndex = 2;
  static const lastNameIndex = 3;
  static const ageDivisionIndex = 4;
  static const sexIndex = 5;
  static const clubIndex = 6;
  static const freeStyle50m = 7;
  static const freeStyle100m = 8;
  static const freeStyle200m = 9;
  static const dosStyle50m = 13;
  static const dosStyle100m = 14;
  static const brassStyle50m = 16;
  static const brassStyle100m = 17;
  static const papillonStyle50m = 19;
  static const nageStyle = 22;

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

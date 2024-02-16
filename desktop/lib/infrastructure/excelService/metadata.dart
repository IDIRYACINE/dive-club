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

  static const int cndbbaIndex = 0;
  static const int omrIndex = 1;
  static const int csabasIndex = 2;
  static const int unbbaIndex = 3;
  static const int afakIndex = 4;
  static const int csanmIndex = 5;
  static const int enbbaIndex = 6;
  static const int uskIndex = 7;
  static const int csaIndex = 8;
  static const int cabIndex = 9;
  static const int camhIndex = 10;
  static const int gbnIndex = 11;
  static const int cbnIndex = 12;

  static const cndbba = "cndbba";
  static const omr = "omr";
  static const csabas = "csabas";
  static const unbba = "unbba";
  static const afak = "afak";
  static const csanm = "csanm";
  static const enbba = "csenbba";
  static const usk = "uskbba";
  static const csa = "csapcbba";
  static const cab = "cab";
  static const camh = "camh";
  static const gbn = "gbnbba";
  static const cbn = "cbn";


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

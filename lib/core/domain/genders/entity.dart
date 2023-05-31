import 'package:dive_club/core/domain/genders/value_objects.dart';

class GenderEntity {
  final GenderId genderId;
  final GenderName genderName;

  GenderEntity({required this.genderId, required this.genderName});
}

final gendersList = [
  GenderEntity(genderId: GenderId(0), genderName: GenderName("H")),
  GenderEntity(genderId: GenderId(1), genderName: GenderName("F"))
];

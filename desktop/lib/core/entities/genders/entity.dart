import 'package:dive_club/core/entities/genders/value_objects.dart';

final gendersList = [
  GenderEntity(genderId: GenderId(0), genderName: GenderName("H")),
  GenderEntity(genderId: GenderId(1), genderName: GenderName("F"))
];

class GenderEntity {
  final GenderId genderId;
  final GenderName genderName;

  GenderEntity({required this.genderId, required this.genderName});

  factory GenderEntity.fromId(GenderId genderId) {
    return gendersList
        .firstWhere((element) => element.genderId.value == genderId.value);
  }


  bool get isFemale => genderId.value == 1;

  bool get isMale => genderId.value == 0;

  bool equals(GenderEntity genderEntity) {
    return genderEntity.genderId.equals(genderId);
  }
}

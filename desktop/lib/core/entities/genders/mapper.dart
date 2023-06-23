
import 'package:dive_club/core/infrastrucutre/database/export.dart';

import 'entity.dart';
import 'value_objects.dart';

class GenderMapper
    implements DatabaseMapper<GenderEntity, Gender> {
  @override
  GenderEntity toDomainEntity(Gender persistance) {
    return GenderEntity(
      genderId: GenderId(persistance.genderId),
      genderName: GenderName(persistance.genderName),
    );
  }

  @override
  Gender toPersistanceEntity(GenderEntity domain) {
    throw UnimplementedError();
  }
}
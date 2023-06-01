
import 'package:dive_club/core/entities/clubs/entity.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';

import 'value_objects.dart';

class ClubMapper
    implements DatabaseMapper<ClubEntity, Club> {
  @override
  ClubEntity toDomainEntity(Club persistance) {
    return ClubEntity(
      clubId: ClubId(persistance.clubId),
      clubName: ClubName(persistance.clubName),
    );
  }

  @override
  Club toPersistanceEntity(ClubEntity domain) {
    throw UnimplementedError();
  }
}
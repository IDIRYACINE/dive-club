
 import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/database-service/drift/database/database.dart' as raw;

List<ClubEntity> mapToDomainClub(List<raw.Club> clubs, ClubMapperPort mapper) {


  List<ClubEntity> results = [];

  for( raw.Club club in clubs){
    final temp = Club(clubId: club.clubId, clubName: club.clubName);
     final res = mapper.toDomainEntity(temp);

     results.add(res);
  }

  return results;

}
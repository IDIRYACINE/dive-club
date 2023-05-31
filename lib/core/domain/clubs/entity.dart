

import 'package:dive_club/core/domain/clubs/export.dart';

class ClubEntity{
  final ClubId clubId;
  final ClubName clubName;

  ClubEntity({required this.clubId,required  this.clubName});


  ClubEntity copyWith({ClubName? clubName}) {
    return ClubEntity(
      clubId: clubId ,
      clubName: clubName ?? this.clubName,
    );
  }

}
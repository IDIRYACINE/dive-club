

import 'package:dive_club/core/entities/clubs/export.dart';

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

  bool equals(ClubEntity other) {
    return clubId.value == other.clubId.value ;
  }

}
import 'package:dive_club/core/entities/clubs/export.dart';

class ClubState {
  final List<ClubEntity> clubs;

  ClubState(this.clubs);

  ClubState copyWith({List<ClubEntity>? clubs}) {
    return ClubState(clubs ?? this.clubs);
  }

  factory ClubState.initial() {
    return ClubState([]);
  }

  ClubEntity clubById(ClubId clubId) {
    return clubs.firstWhere(
        (element) => element.clubId.value == clubId.value);
  }
}

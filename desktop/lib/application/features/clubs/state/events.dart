import 'package:dive_club/core/entities/clubs/export.dart';

abstract class ClubEvent {}

class LoadClubsEvent extends ClubEvent {
  final List<ClubEntity> clubs;

  LoadClubsEvent(this.clubs);
}

class AddClubEvent extends ClubEvent {
  final ClubEntity club;

  AddClubEvent(this.club);
}

class UpdateClubEvent extends ClubEvent {
  final ClubEntity club;

  UpdateClubEvent(this.club);
}

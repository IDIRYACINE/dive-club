
import 'package:dive_club/core/entities/participants/export.dart';

abstract class ParticipantEvent{

}


class LoadParticipantsEvent extends ParticipantEvent{
  final List<ParticipantEntity> participants;

  LoadParticipantsEvent(this.participants);
}


class AddParticipantEvent extends ParticipantEvent{
  final ParticipantEntity participant;

  AddParticipantEvent(this.participant);
}

class UpdateParticipantEvent extends  ParticipantEvent{
   final ParticipantEntity participant;

  UpdateParticipantEvent(this.participant);
}

class DeleteParticipantEvent extends ParticipantEvent{
  final ParticipantId participantId;

  DeleteParticipantEvent(this.participantId);
}
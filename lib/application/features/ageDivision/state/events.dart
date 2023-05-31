import 'package:dive_club/core/domain/diving/export.dart';

abstract class AgeDivisionEvent {}

class LoadAgeDivisionsEvent extends AgeDivisionEvent {
  final List<AgeDivisionEntity> ageDivisions;

  LoadAgeDivisionsEvent(this.ageDivisions);
}

class AddAgeDivisionEvent extends AgeDivisionEvent {
  final AgeDivisionEntity ageDivision;

  AddAgeDivisionEvent(this.ageDivision);
}

class UpdateAgeDivisionEvent extends AgeDivisionEvent {
  final AgeDivisionEntity ageDivision;

  UpdateAgeDivisionEvent(this.ageDivision);
}

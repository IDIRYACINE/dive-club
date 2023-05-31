import 'package:dive_club/core/domain/diving/export.dart';

abstract class AgeDivisionEvent {}

class LoadSpecialtiesEvent extends AgeDivisionEvent {
  final List<AgeDivisionEntity> specialties;

  LoadSpecialtiesEvent(this.specialties);
}

class AddAgeDivisionEvent extends AgeDivisionEvent {
  final AgeDivisionEntity ageDivision;

  AddAgeDivisionEvent(this.ageDivision);
}

class UpdateAgeDivisionEvent extends AgeDivisionEvent {
  final AgeDivisionEntity ageDivision;

  UpdateAgeDivisionEvent(this.ageDivision);
}

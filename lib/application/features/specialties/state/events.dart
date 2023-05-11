import 'package:dive_club/core/domain/diving/export.dart';

abstract class SpecialityEvent {}

class LoadSpecialtiesEvent extends SpecialityEvent {
  final List<DivingSpecialtyEntity> specialties;

  LoadSpecialtiesEvent(this.specialties);
}

class AddSpecialtyEvent extends SpecialityEvent {
  final DivingSpecialtyEntity specialty;

  AddSpecialtyEvent(this.specialty);
}

class UpdateSpecialtyEvent extends SpecialityEvent {
  final DivingSpecialtyEntity specialty;

  UpdateSpecialtyEvent(this.specialty);
}

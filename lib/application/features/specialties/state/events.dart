
import 'package:dive_club/core/domain/diving/export.dart';

abstract class SpecialityEvent{

}


class LoadSpecialtiesEvent extends SpecialityEvent{
  final List<DivingSpecialityEntity> specialty;

  LoadSpecialtiesEvent(this.specialty);
}


class AddSpecialtyEvent extends SpecialityEvent{
  final DivingSpecialityEntity specialty;

  AddSpecialtyEvent(this.specialty);
}

class UpdateSpecialtyEvent extends  SpecialityEvent{
   final DivingSpecialityEntity specialty;

  UpdateSpecialtyEvent(this.specialty);
}
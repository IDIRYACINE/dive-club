
import 'package:dive_club/core/entities/diving/export.dart';

abstract class DivisionEvent{

}


class LoadDivisionsEvent extends DivisionEvent{
  final List<DivingDivisionEntity> divisions;

  LoadDivisionsEvent(this.divisions);
}


class AddDivisionEvent extends DivisionEvent{
  final DivingDivisionEntity division;

  AddDivisionEvent(this.division);
}

class UpdateDivisionEvent extends  DivisionEvent{
   final DivingDivisionEntity division;

  UpdateDivisionEvent(this.division);
}
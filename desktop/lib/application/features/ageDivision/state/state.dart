import 'package:dive_club/core/entities/diving/export.dart';

class AgeDivisionState {
  final List<AgeDivisionEntity> ageDivisions;

  AgeDivisionState(this.ageDivisions);

  AgeDivisionState copyWith({List<AgeDivisionEntity>? ageDivisions}) {
    return AgeDivisionState(ageDivisions ?? this.ageDivisions);
  }

  factory AgeDivisionState.initial() {
    return AgeDivisionState([]);
  }

  AgeDivisionEntity divisionById(AgeDivisionId divisionId) {
    return ageDivisions.firstWhere(
        (element) => element.divisionId.value == divisionId.value);
  }
}

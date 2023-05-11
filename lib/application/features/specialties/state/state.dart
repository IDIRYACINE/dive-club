import 'package:dive_club/core/domain/diving/export.dart';

class SpecialtyState {
  final List<DivingSpecialtyEntity> specialties;

  SpecialtyState(this.specialties);

  SpecialtyState copyWith({List<DivingSpecialtyEntity>? specialties}) {
    return SpecialtyState(specialties ?? this.specialties);
  }

  factory SpecialtyState.initial() {
    return SpecialtyState([]);
  }

  DivingSpecialtyEntity specialtyById(SpecialtyId specialtyId) {
    return specialties.firstWhere(
        (element) => element.specialtyId.value == specialtyId.value);
  }
}

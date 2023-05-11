import 'package:dive_club/application/commons/utility/formaters.dart';
import 'package:dive_club/application/features/participants/ui/forms.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/diving/entity.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/domain/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/events.dart';

class RegistrationDataHolder {
  String name;
  DateTime birthDate = DateTime.now();
  final TextEditingController birthDateTextController = TextEditingController();
  DivingDivisionEntity? division;
  DivingSpecialtyEntity? specialty;

  RegistrationDataHolder({this.name = '', DateTime? birthDate}) {
    if (birthDate != null) {
      this.birthDate = birthDate;
    }
  }
}

class ParticipantController {
  static final key = GlobalKey<FormState>();

  ParticipantController();

  final RegistrationDataHolder _data = RegistrationDataHolder();

  TextEditingController get birthDateTextController =>
      _data.birthDateTextController;

  Future<void> selectBirthDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      _data.birthDate = date;
      _data.birthDateTextController.text =
         formatDateTimeToDisplay(date);
    }
  }

  void onCancel() {
    NavigationService.pop();
  }

  void onRegister(BuildContext context) {
    final isFormValid = key.currentState!.validate();
    if (isFormValid) {
      final bloc = BlocProvider.of<ParticipantBloc>(context);

      final entity = ParticipantEntity(
          participantId: ParticipantId(bloc.state.participants.length + 1),
          participantName: ParticipantName(_data.name),
          divisionId: _data.division!.divisionId,
          participantBirthDate: ParticipantBirthDate(_data.birthDate),
          specialtyId: _data.specialty!.specialtyId);

      _registerParticipant(entity);

      final event = AddParticipantEvent(entity);

      bloc.add(event);

      NavigationService.pop();
    }
  }

  void updateName(String value) {
    _data.name = value;
  }

  void addParticipant() {
    const dialog = ParticipantDialog();
    NavigationService.displayDialog(dialog);
  }

  void updateDivision(DivingDivisionEntity? item) {
    _data.division = item;
  }

  void updateSpecialty(DivingSpecialtyEntity? item) {
    _data.specialty = item;
  }

  Future<void> _registerParticipant(ParticipantEntity entity) async {
    final options = CreateParticipantOptions(
        participant: Participant(
            id: entity.participantId.value,
            name: entity.participantName.value,
            birthDate: entity.participantBirthDate.value,
            divisionId: entity.divisionId.value,
            specialityId: entity.specialtyId.value));
    ServicesProvider.instance().databasePort.insertParticipant(options);
  }
}

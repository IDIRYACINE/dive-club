import 'package:dive_club/application/commons/utility/formaters.dart';
import 'package:dive_club/application/commons/widgets/filter.dart';
import 'package:dive_club/application/features/participants/ui/forms.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/events.dart';
import '../ui/dialogs.dart';
import 'options.dart';

class RegistrationDataHolder {
  String firstName;
  String lastName = "todo";
  DateTime birthDate = DateTime.now();
  final TextEditingController birthDateTextController = TextEditingController();
  DivingDivisionEntity? division;
  DivingSpecialtyEntity? specialty;

  GenderEntity? gender;
  AgeDivisionEntity? ageDivision = AgeDivisionEntity(
      divisionId: AgeDivisionId(2012), divisionName: AgeDivisionName("value"));

  ClubEntity? club;

  String? score;

  RegistrationDataHolder({this.firstName = '', DateTime? birthDate}) {
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
      initialDate: DateTime(2012),
      firstDate: DateTime(2012),
      lastDate: DateTime(2018),
      onDatePickerModeChange: (mode) {},
      initialDatePickerMode: DatePickerMode.year,
    );

    if (date != null) {
      _data.birthDate = date;
      _data.birthDateTextController.text = formatDateTimeToDisplay(date);
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
          participantName: ParticipantName(_data.firstName, _data.lastName),
          division: _data.division!,
          specialty: _data.specialty!,
          ageDivision: _data.ageDivision!,
          club: _data.club!,
          entryTime: Score.fromString(_data.score!)!,
          genderId: _data.gender!.genderId,
          column: ParticipantColumn.from(-1),
          series: ParticipantSeries(-1));

      _registerParticipant(entity);

      final event = AddParticipantEvent(entity);

      bloc.add(event);

      NavigationService.pop();
    }
  }

  onUpdate(BuildContext context, ParticipantEntity oldEntity) {
    final isFormValid = key.currentState!.validate();
    if (isFormValid) {
      final bloc = BlocProvider.of<ParticipantBloc>(context);

      final entity = oldEntity.copyWith(
        participantName: ParticipantName(_data.firstName, _data.lastName),
        division: _data.division!,
        specialty: _data.specialty!,
        ageDivision: _data.ageDivision!,
        club: _data.club!,
        entryTime: Score.fromString(_data.score!),
        genderId: _data.gender!.genderId,
      );

      _updateParticipant(entity);

      final event = UpdateParticipantEvent(entity);

      bloc.add(event);

      NavigationService.pop();
    }
  }

  void addParticipant() {
    const dialog = ParticipantDialog();
    NavigationService.displayDialog(dialog);
  }

  void updateFirstName(String value) {
    _data.firstName = value;
  }

  void updateEntryTime(String value) {
    _data.score = value;
  }

  void updateLastName(String value) {
    _data.lastName = value;
  }

  void updateDivision(DivingDivisionEntity? item) {
    _data.division = item;
  }

  void updateSpecialty(DivingSpecialtyEntity? item) {
    _data.specialty = item;
  }

  void updateGender(GenderEntity? item) {
    _data.gender = item;
  }

  void updateClub(ClubEntity? item) {
    _data.club = item;
  }

  void updateAgeDivision(AgeDivisionEntity? item) {
    _data.ageDivision = item;
  }

  void filterParticipants() {
    final dialog = FilterDialog(
      onConfirmPressed: _onFilter,
    );
    NavigationService.displayDialog(dialog);
  }

  void _onFilter(
    FilterOptions filterOptions,
  ) {
    final databasePort = ServicesProvider.instance().databasePort;

    final options = LoadParticipantsOptions(
        divisionId: filterOptions.divisionId?.value,
        specialityId: filterOptions.specialtyId?.value,
        ageDivisionId: filterOptions.ageDivisionId?.value,
        participantId: filterOptions.id);

    databasePort.loadParticipants(options).then((value) {
      final event = LoadParticipantsEvent(value.participants);
      filterOptions.participantBloc!.add(event);
    });
  }

  void setupUpdateMode(ParticipantEntity participantEntity) {
    _data.firstName = participantEntity.participantName.firstName;
    _data.lastName = participantEntity.participantName.lastName;
    _data.division = participantEntity.division;
    _data.specialty = participantEntity.specialty;
    _data.ageDivision = participantEntity.ageDivision;
    _data.club = participantEntity.club;
    _data.birthDateTextController.text =
        participantEntity.ageDivision.divisionId.toString();
    _data.birthDate = DateTime(participantEntity.ageDivision.divisionId.value);
    _data.score = participantEntity.entryTime.toString();

    _data.gender = GenderEntity.fromId(participantEntity.genderId);
  }
}

class RowController {
  Future<void> displayActionsDialog(DisplayActionsOptions options) async {
    final dialog = ParticipantActionsDialog(
      entity: options.entity,
    );
    NavigationService.displayDialog(dialog);
  }
}

Future<void> _updateParticipant(ParticipantEntity entity) async {
  final options = UpdateParticipantOptions(
      id: entity.participantId.value,
      firstName: entity.participantName.firstName,
      divisionId: entity.division.divisionId.value,
      specialityId: entity.specialty.specialtyId.value,
      ageDivisionId: entity.ageDivision.divisionId.value,
      clubId: entity.club.clubId.value,
      entryTime: entity.entryTime.toIntCode(),
      genderId: entity.genderId.value,
      lastName: entity.participantName.lastName);
  ServicesProvider.instance().databasePort.updateParticipant(options);
}

Future<void> _registerParticipant(ParticipantEntity entity) async {
  final options = CreateParticipantOptions(
      id: entity.participantId.value,
      firstName: entity.participantName.firstName,
      divisionId: entity.division.divisionId.value,
      specialityId: entity.specialty.specialtyId.value,
      ageDivisionId: entity.ageDivision.divisionId.value,
      clubId: entity.club.clubId.value,
      entryTime: entity.entryTime.toIntCode(),
      genderId: entity.genderId.value,
      lastName: entity.participantName.lastName);
  ServicesProvider.instance().databasePort.insertParticipant(options);
}

void deleteParticipant(ParticipantEntity entity, ParticipantBloc bloc) {
  final event = DeleteParticipantEvent(entity.participantId);
  bloc.add(event);
  _deleteParticipant(entity);
  NavigationService.pop();
}

Future<void> _deleteParticipant(ParticipantEntity entity) async {
  final options = DeleteParticipantOptions(
    id: entity.participantId.value,
  );
  ServicesProvider.instance().databasePort.deleteParticipant(options);
}

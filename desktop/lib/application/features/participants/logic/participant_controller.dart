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
          entryTime: Score.fromString(_data.score!),
          genderId: _data.gender!.genderId,
          column: ParticipantColumn.from(-1),
          series: ParticipantSeries(-1));

      _registerParticipant(entity);

      final event = AddParticipantEvent(entity);

      bloc.add(event);

      NavigationService.pop();
    }
  }

  onUpdate(BuildContext context,ParticipantEntity oldEntity) {
    final isFormValid = key.currentState!.validate();
    if (isFormValid) {
      final bloc = BlocProvider.of<ParticipantBloc>(context);

      final entity = oldEntity.copyWith(
          participantName: ParticipantName(_data.firstName, _data.lastName),
          ageDivision: _data.ageDivision!,
          club: _data.club!,
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
}

class RowController {
  void addParticipantScore(ParticipantEntity entity) {}


  Future<void> displayActionsDialog(DisplayActionsOptions options) async {
    final dialog = ParticipantActionsDialog(entity: options.entity,);
    NavigationService.displayDialog(dialog);
  }

  Future<void> displayActions(DisplayActionsOptions options) async {
    final RenderBox overlay =
        Overlay.of(options.context).context.findRenderObject() as RenderBox;
    final RenderBox button = options.context.findRenderObject() as RenderBox;
    final position = button.localToGlobal(Offset.zero);

    final action = await showMenu(
      context: options.context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + 50,
        overlay.size.width - position.dx - button.size.width,
        overlay.size.height - position.dy,
      ),
      items: const [
        PopupMenuItem(
          value: 'addScore',
          child: Text('Add Score'),
        ),
      ],
    );

    if (action != null) {
      switch (action) {
        case 'addScore':
          addParticipantScore(options.entity);
          break;
      }
    }
  }
}


Future<void> _updateParticipant(ParticipantEntity entity) async {
  // final options = UpdateParticipantOptions(
  //     id: entity.participantId.value,
  //     firstName: entity.participantName.firstName,
  //     divisionId: entity.division.divisionId.value,
  //     specialityId: entity.specialty.specialtyId.value,
  //     ageDivisionId: entity.ageDivision.divisionId.value,
  //     clubId: entity.club.clubId.value,
  //     entryTime: entity.entryTime.toIntCode(),
  //     genderId: entity.genderId.value,
  //     lastName: entity.participantName.lastName);
  // ServicesProvider.instance().databasePort.insertParticipant(options);
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


Future<void> deleteParticipant(ParticipantEntity entity) async {
  final options = DeleteParticipantOptions(
      id: entity.participantId.value,
     );
  ServicesProvider.instance().databasePort.deleteParticipant(options);
}

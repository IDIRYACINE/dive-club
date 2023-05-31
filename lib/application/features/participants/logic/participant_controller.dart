import 'package:dive_club/application/commons/utility/formaters.dart';
import 'package:dive_club/application/commons/widgets/filter.dart';
import 'package:dive_club/application/features/competition/ui/forms.dart';
import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:dive_club/application/features/participants/ui/forms.dart';
import 'package:dive_club/application/features/specialties/feature.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/clubs/export.dart';
import 'package:dive_club/core/domain/competition/export.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/domain/genders/export.dart';
import 'package:dive_club/core/domain/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/events.dart';
import 'options.dart';
import 'printer.dart';

class RegistrationDataHolder {
  String firstName;
  String lastName = "todo";
  DateTime birthDate = DateTime.now();
  final TextEditingController birthDateTextController = TextEditingController();
  DivingDivisionEntity? division;
  DivingSpecialtyEntity? specialty;
  
  GenderEntity? gender;
  
  AgeDivisionEntity? ageDivision;
  
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
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
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
      final divisionBloc = BlocProvider.of<DivisionBloc>(context);
      final specialtyBloc = BlocProvider.of<SpecialtyBloc>(context);

      final divisionId = _data.division!.divisionId;
      final specialtyId = _data.specialty!.specialtyId;
      final birthDate = ParticipantBirthDate(_data.birthDate);

      final entity = ParticipantEntity(
          participantId: ParticipantId(bloc.state.participants.length + 1),
          participantName: ParticipantName(_data.firstName, _data.lastName),
          divisionId: divisionId,
          participantBirthDate: birthDate,
          specialtyId: specialtyId,
          divisionName:
              divisionBloc.state.divisionById(divisionId).divisionName,
          specialtyName:
              specialtyBloc.state.specialtyById(specialtyId).specialtyName,
          ageDivisionId: AgeDivisionId(birthDate.year),
          clubId: _data.club!.clubId,
          entryTime: Score.fromString(_data.score!),
          genderId: _data.gender!.genderId);

      _registerParticipant(entity);

      final event = AddParticipantEvent(entity);

      bloc.add(event);

      NavigationService.pop();
    }
  }


  void addParticipant() {
    const dialog = ParticipantDialog();
    NavigationService.displayDialog(dialog);
  }

  Future<void> printParticipants(
      ParticipantBloc bloc, BuildContext context) async {
    final printer = ParticipantsPrinter();
    printer.prepareNewDocument();
    await printer.createDocument(bloc.state.participants);
    printer.displayPreview();
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
        participantId: filterOptions.id);

    databasePort.loadParticipants(options).then((value) {
      final event = LoadParticipantsEvent(value.participants);
      filterOptions.participantBloc!.add(event);
    });
  }

}

class RowController {
  void addParticipantScore(ParticipantEntity entity) {
    final dialog = ScoreDialog(entity: entity);
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

Future<void> _registerParticipant(ParticipantEntity entity) async {
  final options = CreateParticipantOptions(
      id: entity.participantId.value,
      firstName: entity.participantName.firstName,
      birthDate: entity.participantBirthDate.value,
      divisionId: entity.divisionId.value,
      specialityId: entity.specialtyId.value,
      ageDivisionId: entity.ageDivisionId.value,
      clubId: entity.clubId.value,
      entryTime: entity.entryTime.toIntCode(),
      genderId: entity.genderId.value,
      lastName: entity.participantName.lastName);
  ServicesProvider.instance().databasePort.insertParticipant(options);
}

// ignore_for_file: unused_local_variable

import 'dart:typed_data';

import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:dive_club/infrastructure/excel-service/metadata.dart';
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class ExcelService implements ExcelManagerPort {
  bool _isFileProcessed = false;
  // final _sheetName = "engagement 06-05-23";
  final _sheetName = "Sheet1";

  late Excel _excel;

  @override
  Future<void> exportEngagementsFiles(
      String outputDirectory, List<ParticipantEngagement> engagements) async {
    final dir = await getApplicationDocumentsDirectory();

    if (engagements.isEmpty) {
      return;
    }
    final fileName = engagements.first.clubName.value.toString();

    String fPath = '${dir.path}/$outputDirectory/$fileName.xlsx';

    File file = File(fPath);
    _excel = Excel.createExcel();

    final sheet = _excel[_sheetName];
    final header = [
      "id",
      "nom",
      "prenom",
      "naissance",
      "category",
      "sex",
      "division",
      "specialty",
      "serie",
      "couloir",
      "temps entry"
    ];
    sheet.appendRow(header);

    for (ParticipantEngagement engagement in engagements) {
      sheet.appendRow([
        engagement.participantId.value,
        engagement.participantName.firstName,
        engagement.participantName.lastName,
        engagement.ageDivisionId.value,
        engagement.ageDivisionName.value,
        engagement.gender.value,
        engagement.divisionName.value,
        engagement.specialtyName.value,
        engagement.series,
        engagement.column.value,
        engagement.entryScore.toString()
      ]);
    }

    List<int>? bytes = _excel.save();
    if (bytes != null) {
      file
        ..createSync(recursive: true)
        ..writeAsBytesSync(bytes);
    }
  }

  @override
  Future<void> exportStartListFile(
      String outputDirectory, EngagementsRecords engagements) async {
    final dir = await getApplicationDocumentsDirectory();

    String fPath = '${dir.path}/$outputDirectory/startList.xlsx';

    File file = File(fPath);
    _excel = Excel.createExcel();

    for (List<ParticipantEngagement> engagement in engagements) {
      _writeStartListSheet(engagement);
    }

    List<int>? bytes = _excel.save();
    if (bytes != null) {
      file
        ..createSync(recursive: true)
        ..writeAsBytesSync(bytes);
    }
  }

  @override
  bool get isFileProcessed => _isFileProcessed;

  @override
  // TODO: implement processedParticipants
  List<ParticipantRegistration> get processedParticipants =>
      throw UnimplementedError();

  Future<List<File>> _getEngagementFiles(String inputDirectory) async {
    final dir = await getApplicationDocumentsDirectory();

    final directoryPath = '${dir.path}/$inputDirectory';

    Directory dr = Directory(directoryPath);
    if (!dr.existsSync()) {
      dr.createSync();
    }

    final rawFiles = dr.listSync();
    List<File> files = [];

    for (FileSystemEntity inputStream in rawFiles) {
      files.add(inputStream as File);
    }

    return files;
  }

  @override
  Future<List<ParticipantRegistration>> processEngagementFiles(
      String inputDirectory) async {
    List<File> files = await _getEngagementFiles(inputDirectory);

    List<ParticipantRegistration> results = [];

    for (File file in files) {
      Uint8List bytes = file.readAsBytesSync();
      Excel excel = Excel.decodeBytes(bytes);

      final sheet = excel[_sheetName];

      for (int rowIndex = 11; rowIndex < sheet.maxRows; rowIndex++) {
        final firstName = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex, columnIndex: EngagementsSheetRows.nameIndex));
        final lastName = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex,
            columnIndex: EngagementsSheetRows.lastNameIndex));
        final club = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex, columnIndex: EngagementsSheetRows.clubIndex));
        final ageDivision = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex,
            columnIndex: EngagementsSheetRows.ageDivisionIndex));
        final sex = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex, columnIndex: EngagementsSheetRows.sexIndex));

        final freeStyle50m = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex,
            columnIndex: EngagementsSheetRows.freeStyle50m));
        final freeStyle100m = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex,
            columnIndex: EngagementsSheetRows.freeStyle100m));
        final freeStyle200m = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex,
            columnIndex: EngagementsSheetRows.freeStyle200m));
        final dosStyle50m = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex, columnIndex: EngagementsSheetRows.dosStyle50m));
        final dosStyle100m = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex,
            columnIndex: EngagementsSheetRows.dosStyle100m));
        final brassStyle50m = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex,
            columnIndex: EngagementsSheetRows.brassStyle50m));
        final brassStyle100m = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex,
            columnIndex: EngagementsSheetRows.brassStyle100m));
        final papillonStyle50m = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex,
            columnIndex: EngagementsSheetRows.papillonStyle50m));

        final nageStyle = sheet.cell(CellIndex.indexByColumnRow(
            rowIndex: rowIndex, columnIndex: EngagementsSheetRows.nageStyle));

        if (firstName.value == null) {
          continue;
        }


        final entryScoresRaw = [
          freeStyle50m,
          freeStyle100m,
          freeStyle200m,
          dosStyle50m,
          dosStyle100m,
          brassStyle50m,
          brassStyle100m,
          papillonStyle50m,
          nageStyle
        ];

        AgeDivisionId ageDivisionId;

        if (ageDivision.value is DateTime) {
          ageDivisionId = AgeDivisionId.fromDate(ageDivision.value);
        } else {
          ageDivisionId = AgeDivisionId.fromString(ageDivision.value.toString());
        }

        final registration = ParticipantRegistration(
            participantName: ParticipantName(
                firstName.value.toString(), lastName.value.toString()),
            ageDivisionId:
                AgeDivisionId.fromString(ageDivision.value.toString()),
            clubId: ClubId(_getClubId(club.value.toString())),
            genderId: GenderId.fromString(sex.value.toString()),
            entryScores: _processEntryScores(entryScoresRaw));


        results.add(registration);

        

      }

      print(file.path);
    }

    return results;
  }

  List<ScoreEngagement> _processEntryScores(List<Data> entryScoresRaw) {
    final List<ScoreEngagement> engagements = [];

    for (Data entry in entryScoresRaw) {
      Score? score;

      if ((entry.cellType.name == "String") &&
          (entry.value.toString() != "null")) {
        score = Score.fromString(entry.value.toString());
      }

      final divisionProfile = EngagementsSheetRows.divisionProfileFromIndex(
          entry.cellIndex.columnIndex);

      final engagement = ScoreEngagement(
          divisionId: divisionProfile.divisionId,
          specialtyId: divisionProfile.specialtyId,
          score: score);

      engagements.add(engagement);
    }

    return engagements;
  }

  void _writeStartListSheet(List<ParticipantEngagement> engagementRows) {
    final sheetName = _generateStartListSheetName(engagementRows.first);
    final header = [
      "id",
      "nom",
      "prenom",
      "naissance",
      "club",
      "sex",
      "serie",
      "couloir",
      "temps entry"
    ];

    final sheet = _excel[sheetName];

    _appendHeader(sheet, header);

    int rowIndex = 2;

    for (ParticipantEngagement engagement in engagementRows) {
      _appendStartListRows(sheet, rowIndex, engagement);
      rowIndex++;
    }
  }

  String _generateStartListSheetName(ParticipantEngagement engagement) {
    return "${engagement.ageDivisionName.value} ${engagement.divisionName.value} ${engagement.specialtyName.value} ";
  }

  int _getClubId(String value) {
    switch (value) {
      case 'CNDBBA':
        return 0;
      case 'omr':
        return 1;
      case 'UN BBA ':
        return 3;
      case 'CSA BAS':
        return 2;
      case 'csa/afak':
        return 4;
      case 'المنصورة':
        return 5;
      case 'EN':
        return 6;
      case 'U S K':
        return 7;
      default:
        return 0;
    }
  }

  void _appendHeader(Sheet sheet, List<String> header) {

    for(int i = 0 ; i < 10;i++){
      sheet.appendRow(header);
    }

  }

  void _appendStartListRows(
      Sheet sheet, int rowIndex, ParticipantEngagement engagement) {
    final data = [
      engagement.participantId.value,
      engagement.participantName.firstName,
      engagement.participantName.lastName,
      engagement.ageDivisionId.value,
      engagement.clubName.value,
      engagement.gender.value,
      engagement.series,
      engagement.column.value,
      engagement.entryScore.toString()
    ];

    sheet.appendRow(data);
  }
}

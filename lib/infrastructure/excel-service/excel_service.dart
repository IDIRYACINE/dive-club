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
  final _sheetName = "engagement 06-05-23";
  late Excel _excel;

  @override
  Future<void> exportEngagementsFiles(
      String outputDirectory, List<ParticipantEngagement> engagements) {
    // TODO: implement exportEngagementsFiles
    throw UnimplementedError();
  }

  @override
  Future<void> exportStartListFile(
      String outputDirectory, List<ParticipantEngagement> engagements) async {
    final dir = await getApplicationDocumentsDirectory();

    String fPath = '${dir.path}/$outputDirectory/startList.xlsx';

    File file = File(fPath);
    _excel = Excel.createExcel();

    final sheet = _excel[_sheetName];

    for (ParticipantEngagement engagement in engagements) {
      sheet.appendRow([
        engagement.participantId.value,
        engagement.participantName.firstName,
        engagement.participantName.lastName,
        engagement.ageDivisionId.value,
        engagement.gender.value,
        engagement.divisionName.value,
        engagement.specialtyName.value,
        engagement.series,
        engagement.column,
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
        ];

        final registration = ParticipantRegistration(
            participantName: ParticipantName(
                firstName.value.toString(), lastName.value.toString()),
            ageDivisionId:
                AgeDivisionId.fromString(ageDivision.value.toString()),
            clubId: ClubId(0),
            genderId: GenderId.fromString(sex.value.toString()),
            entryScores: _processEntryScores(entryScoresRaw));

        results.add(registration);
      }
    }

    _isFileProcessed = true;

    return results;
  }

  List<ScoreEngagement> _processEntryScores(List<Data> entryScoresRaw) {
    final List<ScoreEngagement> engagements = [];

    for (Data entry in entryScoresRaw) {
      Score? score =
          entry.value == null ? null : Score.fromString(entry.value.toString());

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
}

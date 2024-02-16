// ignore_for_file: unused_local_variable

import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/genders/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:dive_club/infrastructure/excelService/metadata.dart';
import 'package:dive_club/resources/resources.dart';
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class ExcelService implements ExcelManagerPort {
  final _sheetName = "engagement";

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
      "nom",
      "prenom",
      "naissance",
      "category",
      "sex",
      "division",
      "specialty",
      "serie",
      "couloir",
      "temps"
    ];
    sheet.appendRow(header);

    for (ParticipantEngagement engagement in engagements) {
      sheet.appendRow([
        engagement.participantName.firstName,
        engagement.participantName.lastName,
        engagement.ageDivisionId.value,
        engagement.ageDivisionName.value,
        engagement.gender.genderName.value,
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

    File excelFile = File(AppResources.startListsExcel);
    String fPath = dir.path;
    if (!fPath.endsWith("/")) {
      fPath += "/";
    }
    fPath += '$outputDirectory/startList.xlsx';

    File file = File(fPath);

    final templateBytes = excelFile.readAsBytesSync();

    _excel = Excel.decodeBytes(templateBytes);

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
  bool get isFileProcessed => false;

  @override
  List<ParticipantRegistration> get processedParticipants =>
      throw UnimplementedError();

  Future<List<File>> _getEngagementFiles(String inputDirectory) async {
    final dir = await getApplicationDocumentsDirectory();

    final directoryPath = '${dir.path}$inputDirectory';

    Directory dr = Directory(inputDirectory);
    if (!dr.existsSync()) {
      dr.createSync();
    }

    final rawFiles = dr.listSync();
    List<File> files = [];

    for (FileSystemEntity inputStream in rawFiles) {
      files.add(inputStream as File);
      debugPrint("detected engagement file ${inputStream.path}");
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
      debugPrint("inside ${file.path}");

      final sheet = excel[_sheetName];

      for (int rowIndex = 20; rowIndex < sheet.maxRows; rowIndex++) {
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

        if (firstName.value == null || firstName.value == "null") {
          debugPrint(
              "skipped participant null firstName at file : ${file.path}");
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
          ageDivisionId =
              AgeDivisionId.fromString(ageDivision.value.toString());
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
    }

    return results;
  }

  List<ScoreEngagement> _processEntryScores(List<Data> entryScoresRaw) {
    final List<ScoreEngagement> engagements = [];

    for (Data entry in entryScoresRaw) {
      Score? score;

      if ((entry.value != null)) {
        String val = entry.value.toString();
        if (entry.cellType.name != "String") {
          val = "02 00 00";
        }
        score = Score.fromString(val);
      }

      if (score != null) {
        final divisionProfile = EngagementsSheetRows.divisionProfileFromIndex(
            entry.cellIndex.columnIndex);

        final engagement = ScoreEngagement(
            divisionId: divisionProfile.divisionId,
            specialtyId: divisionProfile.specialtyId,
            score: score);

        engagements.add(engagement);
      }
    }

    return engagements;
  }

  void _writeStartListSheet(List<ParticipantEngagement> engagementRows) {
    final sheetName = _generateStartListSheetName(engagementRows.first);
    const templateSheetName = "StartList";

    final sheet = _excel[sheetName];
    // _excel.copy(templateSheetName, sheetName);

    final cell =
        sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 2));
    cell.value = sheetName;

    GenderId lastGender = engagementRows.first.gender.genderId;
    bool genderSwapped = false;

    for (ParticipantEngagement engagement in engagementRows) {
      _appendStartListRows(sheet, engagement);
      final currGender = engagement.gender.genderId;
      genderSwapped = !lastGender.equals(currGender);

      if (genderSwapped) {
        sheet.appendRow(["Females"]);
      }

      lastGender = currGender;
    }

    _formatSheet(sheet);
  }

  void _writeResultListSheet(List<ParticipantResult> resultRows) {
    final sheetName = _generateResultListSheetName(resultRows.first);
    const templateSheetName = "StartList";

    final sheet = _excel[sheetName];

    final cell =
        sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 2));
    cell.value = sheetName;

    for (ParticipantResult results in resultRows) {
      _appendResultListRow(sheet, results);
    }

    _formatSheet(sheet);
  }

  String _generateStartListSheetName(ParticipantEngagement engagement) {
    return "${engagement.ageDivisionName.value} ${engagement.divisionName.value} ${engagement.specialtyName.value} ";
  }

  String _generateResultListSheetName(ParticipantResult result) {
    return "${result.ageDivisionName.value} ${result.divisionName.value} ${result.specialtyName.value} ";
  }

  int _getClubId(String value) {
    value = value.toLowerCase();
    value = value.replaceAll(" ", "");

    int clubId = -99;

    switch (value) {
      case EngagementsSheetRows.cndbba:
        clubId = EngagementsSheetRows.cndbbaIndex;
        break;
      case EngagementsSheetRows.omr:
        clubId = EngagementsSheetRows.omrIndex;
        break;
      case EngagementsSheetRows.csabas:
        clubId = EngagementsSheetRows.csabasIndex;
        break;
      case EngagementsSheetRows.unbba:
        clubId = EngagementsSheetRows.unbbaIndex;
        break;
      case EngagementsSheetRows.afak:
        clubId = EngagementsSheetRows.afakIndex;
        break;
      case EngagementsSheetRows.csanm:
        clubId = EngagementsSheetRows.csanmIndex;
        break;
      case EngagementsSheetRows.enbba:
        clubId = EngagementsSheetRows.enbbaIndex;
        break;
      case EngagementsSheetRows.usk:
        clubId = EngagementsSheetRows.uskIndex;
        break;
      case EngagementsSheetRows.csa:
        clubId = EngagementsSheetRows.csaIndex;
        break;
      case EngagementsSheetRows.cab:
        clubId = EngagementsSheetRows.cabIndex;
        break;
      case EngagementsSheetRows.camh:
        clubId = EngagementsSheetRows.camhIndex;
        break;
      case EngagementsSheetRows.gbn:
        clubId = EngagementsSheetRows.gbnIndex;
        break;
      case EngagementsSheetRows.cbn:
        clubId = EngagementsSheetRows.cbnIndex;
        break;
      default:
        clubId = -1;
        debugPrint("couldn't map id of : $value");
        break;
    }
    debugPrint("$value mapped to $clubId");
    return clubId;
  }

  void _appendStartListRows(Sheet sheet, ParticipantEngagement engagement) {
    final data = [
      engagement.participantName.firstName,
      engagement.participantName.lastName,
      engagement.ageDivisionId.value,
      engagement.clubName.value,
      engagement.gender.genderName.value,
      engagement.series,
      engagement.column.value,
      engagement.entryScore.toString()
    ];

    sheet.appendRow(data);
  }

  @override
  Future<void> exportResultsFile(
      String outputDirectory, ResultsRecords scores) async {
    final dir = await getApplicationDocumentsDirectory();

    File excelFile = File(AppResources.startListsExcel);
    String fPath = '${dir.path}/$outputDirectory/resultList.xlsx';

    File file = File(fPath);

    final templateBytes = excelFile.readAsBytesSync();

    _excel = Excel.decodeBytes(templateBytes);

    for (List<ParticipantResult> score in scores) {
      _writeResultListSheet(score);
    }

    List<int>? bytes = _excel.save();
    if (bytes != null) {
      file
        ..createSync(recursive: true)
        ..writeAsBytesSync(bytes);
    }
  }

  void _appendResultListRow(Sheet sheet, ParticipantResult score) {
    final data = [
      score.participantName.firstName,
      score.participantName.lastName,
      score.clubName.value,
      score.gender.value,
      score.series,
      score.column.value,
      score.score.toString()
    ];

    sheet.appendRow(data);
  }

  void _formatSheet(Sheet sheet) {
    int rowIndex = 0;
    for (List<Data?> row in sheet.rows) {
      if (rowIndex > 2) {
        final isEven = (rowIndex % 2) == 0;
        final rowColor = isEven ? "#3AD2FF" : "#F2F2F2";
        for (Data? cell in row) {
          cell?.cellStyle = CellStyle(
              backgroundColorHex: rowColor,
              horizontalAlign: HorizontalAlign.Left);
        }
      }
      rowIndex++;
    }
  }
}

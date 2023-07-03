import 'dart:io';

import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:dive_club/resources/resources.dart';
import 'package:pdf/widgets.dart' as pw;

import '../commons.dart';

class ParticipantsPage extends pw.StatelessWidget {
  final List<ParticipantEngagement> participants;
  final int totalParticipants;

  ParticipantsPage(
    this.participants, this.totalParticipants,
  );

  pw.TableRow _buildHeaderRow() {
    const rtl = pw.TextDirection.rtl;
    const tAlign = pw.TextAlign.left;

    return pw.TableRow(
      children: [
        pw.Text('الاسم',
            textAlign: tAlign, textDirection: pw.TextDirection.rtl),
        pw.Text('النادي',
            textAlign: tAlign, textDirection: pw.TextDirection.rtl),
        pw.Text('المجموعة',
            textAlign: tAlign, textDirection: pw.TextDirection.rtl),
        pw.Text('الرواق',
            textAlign: tAlign, textDirection: pw.TextDirection.rtl),
        pw.Text('التوقيت', textAlign: tAlign, textDirection: rtl),
      ],
    );
  }

  List<pw.TableRow> _buildTableRows() {
    final List<pw.TableRow> rows = [];

    rows.add(_buildHeaderRow());
    bool isOdd = true;
    const rtl = pw.TextDirection.rtl;
    const tAlign = pw.TextAlign.left;

    for (ParticipantEngagement participant in participants) {
      isOdd = !isOdd;
      rows.add(
        pw.TableRow(
          verticalAlignment: pw.TableCellVerticalAlignment.middle,
          decoration: pw.BoxDecoration(
            color: getRowColorByOdd(isOdd),
          ),
          children: [
            pw.Text(participant.participantName.toString().toUpperCase(),
                textAlign: tAlign, textDirection: rtl),
            pw.Text(participant.clubName.value,
                textAlign: tAlign, textDirection: rtl),
            pw.Text(participant.series.toString(),
                textAlign: tAlign, textDirection: rtl),
            pw.Text(participant.column.toString(),
                textAlign: tAlign, textDirection: rtl),
            pw.Text(participant.entryScore.toString(),
                textAlign: tAlign, textDirection: rtl),
          ],
        ),
      );
    }

    return rows;
  }

  String _generateStartListSheetName(ParticipantEngagement engagement) {
    return "${engagement.divisionName.value} ${engagement.specialtyName.value} ";
  }

  String _generateStartListSubTitle(ParticipantEngagement engagement) {
    return engagement.gender.isMale ? "($totalParticipants) ذكور" : "($totalParticipants) اناث";
  }

  String _generateStartListSecondTitle(ParticipantEngagement engagement) {
    return engagement.ageDivisionName.value;
  }

  @override
  pw.Widget build(pw.Context context) {
    final secondTitle = _generateStartListSheetName(participants.first);
    final title = _generateStartListSecondTitle(participants.first);
    final subtitle = _generateStartListSubTitle(participants.first);

    return pw.Padding(
      padding: const pw.EdgeInsets.all(8.0),
      child: pw.Column(
        children: [
          pw.Flexible(child: StartListHeader(title, subtitle, secondTitle)),
          pw.SizedBox(height: 40),
          pw.Expanded(child: pw.Table(children: _buildTableRows())),
        ],
      ),
    );
  }
}

class ClubPage extends pw.StatelessWidget {
  final String clubName;

  ClubPage(this.clubName);

  @override
  pw.Widget build(pw.Context context) {

    return pw.Center( child:pw.Text(
          clubName,
          textDirection: pw.TextDirection.rtl,
          style: pw.TextStyle(
            fontSize: 20,
            fontWeight: pw.FontWeight.bold,
          ),
        ),);
  }
}

class StartListHeader extends pw.StatelessWidget {
  final String title;
  final String subtitle;
  final String secondtitle;

  StartListHeader(this.title, this.subtitle, this.secondtitle);

  @override
  pw.Widget build(pw.Context context) {
    final image = File(AppResources.logoAssetPath);

    return pw.Row(children: [
      pw.Image(
        pw.MemoryImage(image.readAsBytesSync()),
      ),
      pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
        pw.Text(
          title,
          textDirection: pw.TextDirection.rtl,
          style: pw.TextStyle(
            fontSize: 20,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.Text(
          secondtitle,
          textDirection: pw.TextDirection.rtl,
          style: pw.TextStyle(
            fontSize: 20,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.Text(
          subtitle,
          textDirection: pw.TextDirection.rtl,
          style: pw.TextStyle(
            fontSize: 15,
            fontWeight: pw.FontWeight.bold,
          ),
        )
      ]),
    ]);
  }
}

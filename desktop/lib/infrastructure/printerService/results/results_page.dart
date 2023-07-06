import 'dart:io';

import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/resources/resources.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../commons.dart';

class RankingsPage extends pw.StatelessWidget {
  final List<CompetitionScoreEntity> participants;
  final int currRank;

  RankingsPage(
    this.participants, this.currRank,
  );

  pw.TableRow _buildHeaderRow() {
    const tDirection = pw.TextDirection.rtl;
    const tAlign = pw.TextAlign.left;
    return pw.TableRow(
      children: [
        pw.Text('الاسم', textAlign: tAlign, textDirection: tDirection),
        pw.Text('النادي', textAlign: tAlign, textDirection: tDirection),
        pw.Text('وقت الدخول', textAlign: tAlign, textDirection: tDirection),
        pw.Text('النتيجة', textAlign: tAlign, textDirection: tDirection),
      ],
    );
  }

  List<pw.TableRow> _buildTableRows() {
    final List<pw.TableRow> rows = [];
    bool isOdd = true;
    rows.add(_buildHeaderRow());

    const tDirection = pw.TextDirection.rtl;
    const tAlign = pw.TextAlign.left;

    int rank = currRank;

    for (CompetitionScoreEntity participant in participants) {
      isOdd = !isOdd;

      String score = participant.score.toString();

      final isAbsent = participant.isAbsent;
      final isDisqualified = participant.isDisqualified;

      if (isAbsent) {
        score = "غائب";
      }

      if (isDisqualified) {
        score = "مقصي";
      }

      rows.add(
        pw.TableRow(
          decoration: pw.BoxDecoration(
            color: getRowColorByOdd(isOdd),
          ),
          children: [
            pw.Text("$rank - ${participant.participantName.toString().toUpperCase()}",
                textDirection: tDirection, textAlign: tAlign),
            pw.Text(participant.club.clubName.value,
                textDirection: tDirection, textAlign: tAlign),
            pw.Text(participant.entryTime.toString(),
                textDirection: tDirection, textAlign: tAlign),
            pw.Text(score,
                style: isAbsent || isDisqualified
                    ? const pw.TextStyle(color: PdfColors.red)
                    : null,
                textDirection: tDirection,
                textAlign: tAlign),
          ],
        ),
      );

      rank++;
    }

    return rows;
  }

  String _generateStartListSheetName(CompetitionScoreEntity engagement) {
    return "${engagement.divisionName.value} ${engagement.specialtyName.value} ";
  }

  String _generateStartListSubTitle(CompetitionScoreEntity engagement) {
    return engagement.gender.isMale ? "ذكور" : "اناث";
  }

  String _generateStartListSecondTitle(CompetitionScoreEntity engagement) {
    return engagement.ageDivision.divisionName.value;
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
          ResultListHeader(title, subtitle, secondTitle),
          pw.Expanded(child: pw.Table(children: _buildTableRows())),
        ],
      ),
    );
  }
}

class ResultListHeader extends pw.StatelessWidget {
  final String title;
  final String subtitle;
  final String secondtitle;

  ResultListHeader(this.title, this.subtitle, this.secondtitle);

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

import 'package:dive_club/core/entities/competition/export.dart';
import 'package:pdf/widgets.dart' as pw;

import '../commons.dart';

class RankingsPage extends pw.StatelessWidget {
  final List<CompetitionScoreEntity> participants;

  RankingsPage(
    this.participants,
  );

  pw.TableRow _buildHeaderRow() {
    const tDirection = pw.TextDirection.rtl;
    const tAlign = pw.TextAlign.left;
    return pw.TableRow(
      children: [
        pw.Text('الاسم', textAlign: tAlign, textDirection: tDirection),
        pw.Text('النادي', textAlign: tAlign, textDirection: tDirection),
        pw.Text('المجموعة', textAlign: tAlign, textDirection: tDirection),
        pw.Text('الرواق', textAlign: tAlign, textDirection: tDirection),
        pw.Text('النتيجة', textAlign: tAlign, textDirection: tDirection),
      ],
    );
  }

  List<pw.TableRow> _buildTableRows() {
    final List<pw.TableRow> rows = [];
    bool isOdd = true;
    rows.add(_buildHeaderRow());

    for (CompetitionScoreEntity participant in participants) {
      isOdd = !isOdd;

      rows.add(
        pw.TableRow(
          decoration: pw.BoxDecoration(
            color: getRowColorByOdd(isOdd),
          ),
          children: [
            pw.Text(participant.participantName.toString(),
                textDirection: pw.TextDirection.rtl),
            pw.Text(participant.club.clubName.value,
                textDirection: pw.TextDirection.rtl),
            pw.Text(participant.series.toString(),
                textDirection: pw.TextDirection.rtl),
            pw.Text(participant.column.toString(),
                textDirection: pw.TextDirection.rtl),
            pw.Text(participant.score.toString(),
                textDirection: pw.TextDirection.rtl),
          ],
        ),
      );
    }

    return rows;
  }

  String _generateStartListSheetName(CompetitionScoreEntity engagement) {
    return "${engagement.ageDivision.divisionName.value} ${engagement.divisionName.value} ${engagement.specialtyName.value} ";
  }

  @override
  pw.Widget build(pw.Context context) {
    final title = _generateStartListSheetName(participants.first);

    return pw.Padding(
      padding: const pw.EdgeInsets.all(8.0),
      child: pw.Column(
        children: [
          ResultListHeader(title),
          pw.Expanded(child: pw.Table(children: _buildTableRows())),
        ],
      ),
    );
  }
}

class ResultListHeader extends pw.StatelessWidget {
  final String title;

  ResultListHeader(this.title);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Text(
      title,
      textDirection: pw.TextDirection.rtl,
      style: pw.TextStyle(
        fontSize: 20,
        fontWeight: pw.FontWeight.bold,
      ),
    );
  }
}

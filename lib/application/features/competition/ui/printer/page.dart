import 'dart:io';

import 'package:dive_club/core/entities/competition/export.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class RankingsPage extends pw.StatelessWidget {
  final List<CompetitionScoreEntity> participants;

  RankingsPage(
    this.participants,
  );

  pw.TableRow _buildHeaderRow() {
    return pw.TableRow(
      children: [
        pw.Text('Name', textDirection: pw.TextDirection.rtl),
        pw.Text('Division', textDirection: pw.TextDirection.rtl),
        pw.Text('Specialty', textDirection: pw.TextDirection.rtl),
        pw.Text('Score', textDirection: pw.TextDirection.rtl),
      ],
    );
  }

  List<pw.TableRow> _buildTableRows() {
    final List<pw.TableRow> rows = [];

    rows.add(_buildHeaderRow());

    for (CompetitionScoreEntity participant in participants) {
      rows.add(
        pw.TableRow(
          children: [
            pw.Text(participant.participantName.toString(),
                textDirection: pw.TextDirection.rtl),
            pw.Text(participant.divisionName.value,
                textDirection: pw.TextDirection.rtl),
            pw.Text(participant.specialtyName.value,
                textDirection: pw.TextDirection.rtl),
            pw.Text(participant.score.toString(),
                textDirection: pw.TextDirection.rtl),
          ],
        ),
      );
    }

    return rows;
  }

  @override
  pw.Widget build(pw.Context context) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8.0),
      child: pw.Column(
        children: [
          pw.Expanded(child: pw.Table(children: _buildTableRows())),
        ],
      ),
    );
  }
}

class CertificatePage extends pw.StatelessWidget {
  CertificatePage({required this.participant, required this.image});

  final File image;

  final CompetitionScoreEntity participant;

  @override
  pw.Widget build(pw.Context context) {
    final center = (context.page.pageFormat.width ) / 2;
    final color = PdfColor.fromHex("#FF0000");
    return pw.Stack(
      children: [
        pw.Image(pw.MemoryImage(image.readAsBytesSync())),
        pw.Positioned(
          top: 300,
          left: center,
          child: pw.Text(
            participant.participantName.toString(),
            style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
                color: color),
          ),
        ),
        pw.Positioned(
          top: 370,
          left: center,
          child: pw.Text(
            '${participant.divisionName.value} ${participant.specialtyName.value}',
            textDirection: pw.TextDirection.rtl,
            style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
                color: color),
          ),
        ),
        pw.Positioned(
          top: 396,
          left: 370,
          child: pw.Text(
            'عيد الطفولة',
            textDirection: pw.TextDirection.rtl,
            style: pw.TextStyle(
                fontSize: 23,
                fontWeight: pw.FontWeight.bold,
                color: color),
          ),
        ),
      ],
    );
  }
}

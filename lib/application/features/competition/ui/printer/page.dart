import 'dart:io';

import 'package:dive_club/core/domain/competition/export.dart';
import 'package:pdf/widgets.dart' as pw;

class RankingsPage extends pw.StatelessWidget {
  final List<CompetitionScoreEntity> participants;

  RankingsPage(this.participants);

  pw.TableRow _buildHeaderRow() {
    return pw.TableRow(
      children: [
        pw.Text('Name'),
        pw.Text('Birth Date'),
        pw.Text('Division'),
        pw.Text('Specialty'),
        pw.Text('Score'),
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
            pw.Text("participant.participantName.value"),
            pw.Text("formatDateTimeToDisplay(participant.birthDate.value)"),
            pw.Text("participant.division.value.toString()"),
            pw.Text("participant.specialty.value.toString()"),
            pw.Text("participant.score.value.toString()"),
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
    return pw.Stack(
      children: [
        pw.Image(pw.MemoryImage(image.readAsBytesSync())),
        pw.Positioned(
          top: 100,
          left: 100,
          child: pw.Text("name"),
        ),
      ],
    );
  }
}

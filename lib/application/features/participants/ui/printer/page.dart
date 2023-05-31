import 'package:dive_club/application/commons/utility/formaters.dart';
import 'package:dive_club/core/domain/participants/export.dart';
import 'package:pdf/widgets.dart' as pw;

class ParticipantsPage extends pw.StatelessWidget {
  final List<ParticipantEntity> participants;

  ParticipantsPage(this.participants, );

  pw.TableRow _buildHeaderRow() {
    return pw.TableRow(
      children: [
        pw.Text('Name',textDirection: pw.TextDirection.rtl ),
        pw.Text('Birth Date',textDirection: pw.TextDirection.rtl ),
        pw.Text('Division',textDirection: pw.TextDirection.rtl ),
        pw.Text('Specialty',textDirection: pw.TextDirection.rtl ),
      ],
    );
  }

  List<pw.TableRow> _buildTableRows() {
    final List<pw.TableRow> rows = [];

    rows.add(_buildHeaderRow());

    for (ParticipantEntity participant in participants) {
      rows.add(
        pw.TableRow(
          children: [
            pw.Text(participant.participantName.toString(),textDirection: pw.TextDirection.rtl ),
            pw.Text(
                formatDateTimeToDisplay(participant.participantBirthDate.value),
                textDirection: pw.TextDirection.rtl 
                ),
            pw.Text(participant.divisionName.value,textDirection: pw.TextDirection.rtl ),
            pw.Text(participant.specialtyName.value,textDirection: pw.TextDirection.rtl ),
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

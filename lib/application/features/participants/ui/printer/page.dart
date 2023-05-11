import 'package:dive_club/application/commons/utility/formaters.dart';
import 'package:dive_club/core/domain/participants/export.dart';
import 'package:pdf/widgets.dart' as pw;

class ParticipantsPage extends pw.StatelessWidget {
  final List<ParticipantEntity> participants;

  ParticipantsPage(this.participants);

  pw.TableRow _buildHeaderRow() {
    return pw.TableRow(
      children: [
        pw.Text('Name'),
        pw.Text('Birth Date'),
        pw.Text('Division'),
        pw.Text('Specialty'),
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
            pw.Text(participant.participantName.value),
            pw.Text(formatDateTimeToDisplay(
                participant.participantBirthDate.value)),
            pw.Text(participant.divisionId.value.toString()),
            pw.Text(participant.specialtyId.value.toString()),
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

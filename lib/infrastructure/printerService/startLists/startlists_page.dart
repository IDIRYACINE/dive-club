import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ParticipantsPage extends pw.StatelessWidget {
  final List<ParticipantEngagement> participants;

  ParticipantsPage(
    this.participants,
  );

  pw.TableRow _buildHeaderRow() {
    const rtl = pw.TextDirection.rtl;
    const tAlign = pw.TextAlign.left;

    return pw.TableRow(
      children: [
        pw.Text('Name', textAlign: tAlign, textDirection: rtl),
        pw.Text('Birth Date', textAlign: tAlign, textDirection: rtl),
        pw.Text('Division', textAlign: tAlign, textDirection: rtl),
        pw.Text('Specialty', textAlign: tAlign, textDirection: rtl),
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
            color: isOdd ? PdfColors.grey : PdfColors.blue200,
          ),
          children: [
            pw.Text(participant.participantName.toString().toUpperCase(),
                textAlign: tAlign, textDirection: rtl),
            pw.Text(participant.ageDivisionId.value.toString(),
                textAlign: tAlign, textDirection: rtl),
            pw.Text(participant.divisionName.value,
                textAlign: tAlign, textDirection: rtl),
            pw.Text(participant.specialtyName.value,
                textAlign: tAlign, textDirection: rtl),
          ],
        ),
      );
    }

    return rows;
  }

  String _generateStartListSheetName(ParticipantEngagement engagement) {
    return "${engagement.ageDivisionName.value} ${engagement.divisionName.value} ${engagement.specialtyName.value} ";
  }

  @override
  pw.Widget build(pw.Context context) {
    final title = _generateStartListSheetName(participants.first);

    return pw.Padding(
      padding: const pw.EdgeInsets.all(8.0),
      child: pw.Column(
        children: [
          pw.Flexible(child: StartListHeader(title)),
          pw.SizedBox(height: 40),
          pw.Expanded(child: pw.Table(children: _buildTableRows())),
        ],
      ),
    );
  }
}

class StartListHeader extends pw.StatelessWidget {
  final String title;

  StartListHeader(this.title);

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

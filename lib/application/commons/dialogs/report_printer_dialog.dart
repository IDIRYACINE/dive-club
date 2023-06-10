import 'package:dive_club/application/commons/widgets/buttons.dart';
import 'package:dive_club/application/navigation/feature.dart';
import 'package:dive_club/core/domain/report.dart';
import 'package:dive_club/infrastructure/service_provider.dart';
import 'package:flutter/material.dart';

class ReportsDialog extends StatelessWidget {
  const ReportsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _Controller controller = _Controller();

    return AlertDialog(
        title: const Text("Reports"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: ButtonPrimary(
                onPressed: controller.printEngagements,
                text: 'Print engagements',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ButtonPrimary(
                onPressed: controller.printStartLists,
                text: 'Print startLists',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ButtonPrimary(
                onPressed: controller.printPapillons,
                text: 'Print papillons',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ButtonPrimary(
                onPressed: controller.loadEngagements,
                text: 'import engagements',
              ),
            )
          ],
        ));
  }
}

class _Controller {
  late ReportStartList report;

  _Controller() {
    final servicesProvider = ServicesProvider.instance();

    report = ReportStartList(
        dbPort: servicesProvider.databasePort,
        excelPort: servicesProvider.excelManagerPort);
  }

  Future<void> printPapillons() async {
    ServicesProvider.instance().printerPort.printPapillons();
  }

  Future<void> loadEngagements() async {
    await report.registerParticipants();
    NavigationService.pop();
  }

  void printEngagements() {
    report.generateEngagementsReport();
    NavigationService.pop();
  }

  void printStartLists() {
    report.generateParticipantsSeries(updateDb: false).then((engagements) =>
        ServicesProvider.instance().printerPort.printStartLists(engagements));
  }
}

import 'package:dive_club/core/infrastrucutre/database/mapper.dart';
import 'package:dive_club/core/infrastrucutre/database/database_port.dart';
import 'package:dive_club/core/infrastrucutre/service_provider_port.dart';
import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';
import 'package:dive_club/core/infrastrucutre/utilities/printer_port.dart';
import 'package:dive_club/infrastructure/printerService/printer_service.dart';

import 'databaseService/drift/drift_database.dart';
import 'excelService/excel_service.dart';
import 'mapperService/mapper_service.dart';

class ServicesProvider implements ServicesProviderPort {
  static ServicesProvider? _instance;

  ServicesProvider._(
      {required this.databasePort,
      required this.mapperService,
      required this.excelManagerPort,
      required this.printerPort});

  @override
  final DatabasePort databasePort;

  @override
  final MapperServicePort mapperService;

  @override
  final ExcelManagerPort excelManagerPort;

  @override
  final PrinterPort printerPort;

  factory ServicesProvider.instance() {
    final mapperService = MapperService();
    final excelManagerPort = ExcelService();
    final databasePort = DriftDatabaseService(mapperService);
    final printerPort = PrinterService(databasePort: databasePort);

    _instance ??= ServicesProvider._(
        databasePort: databasePort,
        mapperService: mapperService,
        excelManagerPort: excelManagerPort,
        printerPort: printerPort);
    return _instance!;
  }
}

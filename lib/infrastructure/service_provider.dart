import 'package:dive_club/core/infrastrucutre/database/mapper.dart';
import 'package:dive_club/core/infrastrucutre/database/database_port.dart';
import 'package:dive_club/core/infrastrucutre/service_provider_port.dart';
import 'package:dive_club/core/infrastrucutre/utilities/excel_manager_port.dart';

import 'databaseService/drift/drift_database.dart';
import 'excelService/excel_service.dart';
import 'mapperService/mapper_service.dart';

class ServicesProvider implements ServicesProviderPort {
  static ServicesProvider? _instance;

  ServicesProvider._(this.databasePort, this.mapperService, this.excelManagerPort) ;

  @override
  final DatabasePort databasePort;

  @override
  final MapperServicePort mapperService;

  @override
  final ExcelManagerPort excelManagerPort;


  factory ServicesProvider.instance() {
    final mapperService = MapperService();
    final excelManagerPort = ExcelService();

    final databasePort = DriftDatabaseService(mapperService);
    _instance ??= ServicesProvider._(databasePort, mapperService,excelManagerPort);
    return _instance!;
  }

}

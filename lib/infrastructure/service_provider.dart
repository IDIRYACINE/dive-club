import 'package:dive_club/core/infrastrucutre/database/mapper.dart';
import 'package:dive_club/core/infrastrucutre/database/database_port.dart';
import 'package:dive_club/core/infrastrucutre/service_provider_port.dart';

import 'database-service/drift/drift_database.dart';
import 'mapper_service/mapper_service.dart';

class ServicesProvider implements ServicesProviderPort {
  static ServicesProvider? _instance;

  ServicesProvider._(this.databasePort, this.mapperService) {}

  @override
  final DatabasePort databasePort;

  @override
  final MapperServicePort mapperService;

  factory ServicesProvider.instance() {
    final mapperService = MapperService();

    final databasePort = DriftDatabaseService(mapperService);
    _instance ??= ServicesProvider._(databasePort, mapperService);
    return _instance!;
  }
}

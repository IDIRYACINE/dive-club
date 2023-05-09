

import 'package:dive_club/core/infrastrucutre/database/export.dart';

abstract class ServicesProviderPort{
  MapperServicePort get mapperService;
  DatabasePort get databasePort;
}
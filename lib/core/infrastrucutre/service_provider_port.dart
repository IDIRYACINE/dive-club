

import 'package:dive_club/core/infrastrucutre/database/export.dart';

import 'utilities/excel_manager_port.dart';

abstract class ServicesProviderPort{
  MapperServicePort get mapperService;
  DatabasePort get databasePort;
  ExcelManagerPort get excelManagerPort;
}
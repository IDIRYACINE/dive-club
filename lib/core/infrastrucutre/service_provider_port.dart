

import 'package:dive_club/core/infrastrucutre/database/export.dart';
import 'package:dive_club/core/infrastrucutre/utilities/printer_port.dart';

import 'utilities/excel_manager_port.dart';

abstract class ServicesProviderPort{
  MapperServicePort get mapperService;
  DatabasePort get databasePort;
  ExcelManagerPort get excelManagerPort;
  PrinterPort get printerPort;
}
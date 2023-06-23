

import 'package:pdf/pdf.dart';

PdfColor getRowColorByOdd(bool isOdd){
  return isOdd ? PdfColors.grey100 : PdfColors.blue100;
} 
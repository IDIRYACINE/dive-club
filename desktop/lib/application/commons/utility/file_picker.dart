import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

Future<File?> getSaveFile() async {
  String? outputFile = await FilePicker.platform.saveFile(
    dialogTitle: 'Please select an output file:',
    fileName: 'output.pdf',
  );

  if (outputFile == null) {
    return null;
  }

  return File(outputFile);
}

void saveDataToFile(File file, Uint8List data)  {
   file.writeAsBytesSync(data);
}

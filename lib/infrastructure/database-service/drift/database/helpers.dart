import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<File> copyDatabase() async {
  final dbPath = await getApplicationDocumentsDirectory();
  final path = '${dbPath.path}/database.db';
  final dbFile = File(path);
  if(dbFile.existsSync()){
    return dbFile;
  }
  dbFile.createSync();
  return dbFile;
}

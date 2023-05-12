// ignore_for_file: avoid_print
import 'dart:io';

void main() async {
    const folderPath = 'lib/infrastructure/database-service/drift/';

  final result = await Process.run(
    'flutter',
    [
      'pub',
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
      '--build-filter',
      folderPath,
    ],
  );

  // Check the exit code to determine if the process was successful
  if (result.exitCode == 0) {
    print('Build Runner completed successfully.');
  } else {
    print('Build Runner encountered an error. Exit code: ${result.exitCode}');
    print('Error output:\n${result.stderr}');
  }
}



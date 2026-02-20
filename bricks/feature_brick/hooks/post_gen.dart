import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('Eseguo build runner...');

  await Process.run('flutter', [
    'pub',
    'run',
    'build_runner',
    'build',
    '--delete-conflicting-outputs',
  ]);
  progress.complete('Build runner eseguito con successo!');
}

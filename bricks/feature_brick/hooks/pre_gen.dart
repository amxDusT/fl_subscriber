import 'package:mason/mason.dart';
import 'dart:io';
import 'package:yaml/yaml.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('Cerco nome package...');
  final directory = Directory.current.path;
  try {
    final pubSpecFile = File('${directory}/pubspec.yaml');

    if (!await pubSpecFile.exists()) {
      throw Exception(
        'pubspec.yaml non trovato. Assicurati di eseguire lo script nella directory principale del progetto.',
      );
    }

    final content = await pubSpecFile.readAsString();
    final yamlMap = loadYaml(content);
    final packageName = yamlMap['name'];
    context.vars['packageName'] = packageName;
  } catch (e) {
    context.logger.err('Errore: $e');
  }
  progress.complete('Nome package trovato!');
}

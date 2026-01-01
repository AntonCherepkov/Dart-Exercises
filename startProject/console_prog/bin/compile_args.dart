/**
 * Изучение модуля args
 */

import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) {
  var parser = ArgParser()
    ..addOption('name', abbr: 'n', help: 'User name', defaultsTo: 'NoName')
    ..addOption('age', abbr: 'a', help: 'User age', defaultsTo: '1')
    ..addFlag('debug', abbr: 'd', help: 'Enabling debug-mode', defaultsTo: false)
    ..addOption('format', abbr: 'f', help: 'Document Format', allowed: ['text', 'json']);
  var parseArgs = parser.parse(arguments);

  final name = parseArgs['name'];
  final age = int.tryParse(parseArgs['age']) ?? 0;
  final debug = parseArgs['debug'];
  final docFormat = parseArgs['format'];

  StringBuffer bufer = StringBuffer()
    ..writeln('User name: $name')
    ..writeln('User age: $age')
    ..writeln('Debug mode: $debug')
    ..writeln('Format doc: $docFormat');

  if (docFormat == 'json') {
    print("""{
  "name": "$name",
  "age": $age,
  "debug": $debug,
  "format": "$docFormat"
}""");
  } else {
    print(bufer.toString());
  }
}
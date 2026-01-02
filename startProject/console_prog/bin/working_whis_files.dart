import 'dart:io';
import 'dart:convert';
import 'dart:async';

Map<String, Function> counterLevels() {
  int countINFO = 0;
  int countWARN = 0;
  int countERROR = 0;

  void determineLevel(String logLine) {
    switch (logLine) {
      case String s when s.startsWith('INFO'):
        countINFO++;
        break;
      case String s when s.startsWith('WARN'):
        countWARN++;
        break;
      case String s when s.startsWith('ERROR'):
        countERROR++;
        break;
    }
  }
  String inputResult() => 
    "INFO: $countINFO\nWARN: $countWARN\nERROR: $countERROR";

  return <String, Function>{"count": determineLevel, "result": inputResult};
}

void main(List<String> arguments) async {
  String content = """
INFO|2025-01-01 10:00:01|User login
WARN|2025-01-01 10:01:12|Invalid password
ERROR|2025-01-01 10:02:45|Database unavailable
INFO|2025-01-01 10:03:00|User logout
ERROR|2025-01-01 10:04:11|Timeout exceeded
""";
  String addContent = """
INFO|2026-01-01 11:00:01|Create user
WARN|2026-01-01 11:00:02|Login is already taken
ERROR|2026-01-01 11:00:03|Error creating user
INFO|2026-01-01 11:00:04|New attempt to create user
""";
  
  // Синхронная запись данных в файл
  var myFile = File('loging.log');
  myFile.writeAsStringSync('Синхронная запись в файл:', mode: FileMode.append);
  myFile.writeAsStringSync(content, mode: FileMode.append);

  // Асинхронная запись данных в файл
  var sink = myFile.openWrite(mode: FileMode.append);
  sink.write("Асинхронная запись в файл:\n");
  sink.write(addContent);
  await sink.flush();
  await sink.close();

  // Синхронное чтение
  var readFile = myFile.readAsLinesSync();
  var counterLevel = counterLevels();
  for (var line in readFile) {
    counterLevel["count"]!(line);
  }
  print("Посчитали синхронно:");
  print(counterLevel["result"]!());

  var counterLevel0 = counterLevels();
  var contentReading = await myFile.readAsString();
  for(var line in contentReading.split('\n')) {
    counterLevel0['count']!(line);
  }
  print("Посчитали ассинхронно:");
  print(counterLevel0['result']!());

  // Потоковое чтение
  Stream streamReadFile = myFile
    .openRead()                   // получаем Stream
    .transform(utf8.decoder)      // декодируем
    .transform(LineSplitter());   // ставим разделители

  var counterLevel1 = counterLevels();

  // Запись в файл всех Error
  File errorFile = File('error.log');

  try {
    var errorSink = errorFile.openWrite();
    await for(var line in streamReadFile) {
      counterLevel1['count']!(line);
      if (line.startsWith('ERROR')) {
        errorSink.writeln(line);
      }
    }
    await errorSink.flush();
    await errorSink.close();

    print("Посчитали в потоке:");
    print(counterLevel1['result']!());

  } catch (e) {
    print(e);
  }
}
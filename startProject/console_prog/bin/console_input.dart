import 'dart:io';

void main(List<String> parameters) {
  print('Пожалуйста, введите номер: ');
  String? inputUser = stdin.readLineSync();
  var data = int.tryParse(inputUser!);

  print('Вы ввели номер: ${data}');
  print('Тип переменной: ${data.runtimeType}');

  print('Пожалуйста, введите последовательность чисел:');
  String? inputListUser = stdin.readLineSync();
  if (inputListUser != null || inputListUser!.isEmpty) {
    List<String> newDataString = inputListUser!.split(' ');
    List<int> newDataInt = newDataString.map(int.parse).toList();
    print('Вы ввели последовательность: ${newDataInt}');
  }

  print('Пожалуйста, введите последовательность чисел:');
  String? input = stdin.readLineSync();
  if (input != null || input != '') {
    Set<String> setInputStr = Set<String>.from(input!.split(' '));
    Set<int> setInputInt = Set<int>.from(setInputStr.map(int.parse));
    print('Вы ввели последовательность: ${setInputInt}');
  }

  print('Пожалуйста, введите ключи для мапки:');
  String? keys = stdin.readLineSync();
  List<String> keysList = [...keys!.split(' ')];

  print('Пожалуйста, введите значения для мапки:');
  String? values = stdin.readLineSync();
  List<String> valuesListStr = List<String>.from(values!.split(' '));
  
  var valuesListInt = List<int>.from(valuesListStr.map(int.parse));
  Map<String, int> resultMap = Map<String, int>.fromIterables(keysList, valuesListInt);
  print('Итоговая структура: ${resultMap}');
}
import 'dart:io';

void main(List<String> parameters) {
  print('Введите значение через пробел: ');
  String? inputUser = stdin.readLineSync();
  var [name, age, ...] = inputUser!.split(" ");
  print(name);
  print(age);
}
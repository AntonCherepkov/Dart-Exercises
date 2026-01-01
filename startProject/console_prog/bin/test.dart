import 'dart:io';

void main(List<String> parameters) {
  print('Введите значение через пробел: ');
  String? inputUser = stdin.readLineSync();
  try {
    var [name, age, ...] = inputUser!.split(" ");
  } catch (Error) {
    print("Ошибка ${Error}");
  }
}

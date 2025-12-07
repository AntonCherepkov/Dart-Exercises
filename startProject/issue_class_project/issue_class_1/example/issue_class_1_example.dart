import 'dart:io';
import 'package:issue_class_1/issue_class_1.dart';

void main() {
  /** Задание 1 */
  print('Задание 1 ${"-" * 25}');
  User userOne = User('Anton', 34);
  print('user name: ${userOne.name}');
  print('user age: ${userOne.age}');

  while (true) {
    stdout.write('Задай пароль для пользователя ${userOne.name}: ');
    String? password = stdin.readLineSync();
    if (password != null) {
      userOne.password = password;
      if (userOne.password == '*' * password.length) {
        print('Пароль принят: ${userOne.password}');
        break;
      }
    }
  }

  /** Задание 2 */
  print('Задание 2 ${"-" * 20}');
  User userTwo = User.guest();
  print('user name: ${userTwo.name}');
  print('user age: ${userTwo.age}');

  /** Задание 3 и 4 */
  print('Задание 3 и 4 ${"-" * 20}');
  City cityOne = City("Eketrinburg", 3_000_000);
  City cityTwo = City("Penza", 500_000);
  City.showCities();
}

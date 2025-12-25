import 'package:issue_class_6/issue_class_6.dart';

void main() {
  String valueMask = NameString("23453").masked;
  print(valueMask);
  print(NameString("234qadf").isDigit);
  print(NameString("dsafa23").isValid);
  print(NameString("4645545").isValid);

  Box box = Box([1, 3, 4, 5]);
  print('first null: ${box.firstOrNull()}');
  print('add 1: ${box.map((e) => e + 1)}');
  print('even: ${box.where((e) => e % 2 == 0)}');
}

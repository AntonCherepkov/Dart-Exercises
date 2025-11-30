import 'dart:collection';
import 'dart:math';

// function 1
int sum(int a, int b) {
  return a + b;
}

// function 2
String repeat(String text, int n) {
  return (List.filled(n, text)).join(', ');
}

// function 3
void greet({required String name, int age = 18}) {
  print('Привет ${name}, тебе ${age} лет!');
}

// function 4
String urlFormat({required String host, String fomat = 'https', String port = '443'}) {
  final result;
  result = '$fomat://$host:${port}';
  return result;
}

// function 5
String describe({String? sity, String country = 'Россия'}) {
  var result = 
    sity != null 
    ? 'Город ${sity}, страна ${country}'
    : 'Страна: $country';
  return result;
}

// function 6
int calc(int a, int b, {bool absolute = false}) {
  if (absolute) {
    return (a - b).abs();
  }
  else {
    return a - b;
  }
}

// fucntion 7
String fullName(String first, String last, {String? middle}) {
  var result = 
    middle != null
    ? '$first ${middle} $last'
    : '$first $last';
  return result;
}

// function 8
int safeLength(String? text) {
  if (text == null) {
    return 0;
  }
  else {
    return text.length;
  }
}

// function 9
int safeLengthV1({String? text}) {
  if (text == null) {
    return 0;
  }
  else {
    return text.length;
  }
}

// function 10
int apply(int a, int b, Function(int, int) op) {
  return op(a, b);
}

// function 11
void buildPath(String path, {String? ext, bool withSlash = false}) {
  String result = '';
  if (ext != null) {
    result = '.$ext';
  }
  result += path;
  if (withSlash) {
    result += '/';
  }
  print(result);
}

// function 12
dynamic choose(bool flag, {required dynamic a, required dynamic b}) {
  return flag ? a : b;
}

// fuction 13
String userInfo(
  String username,
  int id,
  {String? phone,
   bool? emailConfirmed,
   String role = 'user'}
) {
  final emailConfirmedStr;
  if (emailConfirmed == null) {
    emailConfirmedStr = 'неизвестно';
  }
  else if (emailConfirmed) {
    emailConfirmedStr = 'да';
  }
  else {
    emailConfirmedStr = 'нет';
  }
  String result = '';
  return 
  """
  Имя: ${username}
  ID: ${id}
  Телефон: ${phone == null ? 'Не указан' : phone }
  Роль: $role
  Email подтвержден: $emailConfirmedStr
  """;
}

void main(List<String> parameters) {
  int a = 4;
  int b = 5;
  var sum_ = sum(a, b);
  print('Работа первой функции sum(): $sum_');

  String text = 'тест';
  var result_text = repeat(text, a);
  print('Работа функции repeat: $result_text');

  print('Работа функции greet:');
  greet(name: 'Anton', age: 34);
  greet(name: 'Semen');

  print('Работа функции urlFormat()');
  print(urlFormat(host: 'domovoy', fomat: 'http', port: '8080'));
  print(urlFormat(host: 'domovoyN', port: '8090'));
  print(urlFormat(host: 'domovoyB'));

  print('Работа функции describe:');
  print(describe());
  print(describe(sity: 'Екатеринбург'));
  print(describe(sity: 'NewYork', country: 'USA'));

  print('Работа функции calc:');
  print(calc(4, 5));
  print(calc(4, 5, absolute: true));

  print('Работа функции fullName():');
  print(fullName('Anton', 'Cherepkov', middle: 'Nikolaevich'));
  print(fullName('Dasha', 'Cherepkova'));

  print('Работа функции safeLength():');
  print(safeLength(null));
  print(safeLength('TestTestTest'));

  print('Работа функции safeLengthV1():');
  print(safeLengthV1());
  print(safeLengthV1(text: 'TestTestTest'));

  print('Работа функции высшего порядка apply():');
  print(apply(a, b, (x, y) => x + y));
  print(apply(a, b, (x, y) => x ~/ y));

  print('Работа функции buildPath()');
  buildPath('folder');
  buildPath('folder', ext: 'root/');
  buildPath('folder', ext: 'root/', withSlash: true);

  print('Работа функции choose:');
  print(choose(true, a: 'Истина', b: 'Ложь'));

  print('Работа функции userInfo(): ');
  print(userInfo(
    'AntonCherepkov', 1235435, 
    phone: '+79999999999',
    role: 'admin'));
}
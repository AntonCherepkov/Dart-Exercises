/**
 * Класс User. 
 * Имеет геттер и сеттер для поля _password:
 * - Сеттер устанавивает пароль только если его длина не менее 6;
 * - Геттер возврвщает строку, в которой символы заменены на *;
 * - Имеет базовый конструктор с необязательным параметром password;
 * - Имеет именованный коструктор, создающий гостя ('Guest', 0);
 */
class User {
  late final String name;
  late int age;
  late String? _password;

  User(this.name, this.age, [this._password]);
  User.guest([this._password, this.name = 'Guest', this.age = 0]);

  set password(String password) {
    if (password.length < 6) {
      print('Пароль не принят');
      return;
    }  
    _password = password;
  }

  String get password{
    if (_password != null) {
      return '*' * _password!.length;
    } else {
      return '';
    }
  }
}

typedef cacheCities = Map<String, City>;

/** Класс City */
class  City {
  final String name;
  late int population;

  static cacheCities _cache = Map<String, City>();

  City.unknown({this.name = 'unknown', this.population = 0});
  City.create(this.name, this.population);

  factory City(String name, int population) {
    var cachedName = name;
    return _cache.putIfAbsent(cachedName, 
                              () => City.create(name, population)); 
  }

  static void showCities() {
    _cache.entries.forEach(
      (element) => print(
        'Город: ${element.value.name} '
        'Население: ${element.value.population}'));
  }
}